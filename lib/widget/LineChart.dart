import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutterncov19/services/API_Service.dart' as service;
import 'package:flutterncov19/model/HistoryData.dart';

class LineChart extends StatefulWidget {
  final String countryID;

  const LineChart(this.countryID);

  @override
  _LineChartState createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  Future<History> historyData;
  List<DataList> data;

  @override
  void initState() {
    super.initState();
    historyData = service.APIService.getHistoryCountryData(widget.countryID);
    historyData.then((value) {
      value.timeline.cases.forEach((key, value) {
        data.add(DataList(key, value));
      });
    });

    print(data);
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<DataList, String>> series = [
      charts.Series(
        id: 'Cases',
        data: data,
        domainFn: (DataList series, _) => series.date,
        measureFn: (DataList series, _) => series.value,
      )
    ];

    return historyData == null
        ? CircularProgressIndicator()
        : Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text('History Cases'),
                  Expanded(
                    child: charts.BarChart(series, animate: false),
                  )
                ],
              ),
            ),
          );
  }
}

class DataList {
  final String date;
  final int value;

  DataList(this.date, this.value);
}

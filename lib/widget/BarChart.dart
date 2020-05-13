import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutterncov19/services/API_Service.dart' as service;
import 'package:flutterncov19/model/HistoryData.dart';
import 'package:intl/intl.dart';
import '../model/BarSeries.dart';

class BarChart extends StatefulWidget {
  final String countryID;

  const BarChart(this.countryID);

  @override
  _BarChartState createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  final List<TimelineSeries> data = [];
  Future<History> historyData;

  @override
  void initState() {
    super.initState();
    historyData = service.APIService.getHistoryCountryData(widget.countryID);
    historyData.then((value) {
      value.timeline.cases.forEach((key, value) {
        setState(() {
          data.add(TimelineSeries(
            date: key,
            value: value,
            barColor: charts.ColorUtil.fromDartColor(Colors.blue)));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<TimelineSeries, String>> series = [
      charts.Series(
          id: "Timeline",
          data: data,
          domainFn: (TimelineSeries series, _) => series.date,
          measureFn: (TimelineSeries series, _) => series.value,
          colorFn: (TimelineSeries series, _) => series.barColor)
    ];

    return Container(
      height: 400,
      padding: EdgeInsets.all(10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "Cases",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Expanded(
                child: charts.BarChart(
                  series,
                  animate: true,
                  defaultInteractions: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

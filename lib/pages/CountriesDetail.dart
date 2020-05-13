import 'package:flutter/material.dart';
import '../model/CountriesData.dart';
import '../widget/BarChart.dart';
import '../widget/NumberData.dart';
//import '../widget/LineChart.dart';

class CountryDetail extends StatelessWidget {
  static const String id = '/detail';

  final Countries country;

  const CountryDetail({Key key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(country.country),
          backgroundColor: Colors.indigo,
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                height: 250.0,
                child: Image.network(
                  country.countryInfo.flag,
                  fit: BoxFit.fill,
                )),
            SizedBox(
              height: 10.0,
            ),
            NumberDataDetail(
              cases: country.cases,
              deaths: country.deaths,
              recovered: country.recovered,
              todayCases: country.todayCases,
              active: country.active,
              todayDeaths: country.todayDeaths,
              critical: country.critical,
            ),
            BarChart(country.countryInfo.iso2),
            //LineChart(country.countryInfo.iso2),
          ]),
        ));
  }
}

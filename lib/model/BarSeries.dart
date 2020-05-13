import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class TimelineSeries {
  final String date;
  final int value;
  final charts.Color barColor;

  TimelineSeries(
      {@required this.date,
      @required this.value,
      @required this.barColor});
}
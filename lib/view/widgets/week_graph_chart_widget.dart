import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeekGraphChart extends StatelessWidget {
  static const String routeName = '/week_graph_chart';
  final List<WeekData> data = [
    WeekData(
        weekDay: "Sunday",
        value: 50,
        color: charts.ColorUtil.fromDartColor(Colors.blue)),
    WeekData(
        weekDay: "Monday",
        value: 75,
        color: charts.ColorUtil.fromDartColor(Colors.green)),
    WeekData(
        weekDay: "Tuesday",
        value: 80,
        color: charts.ColorUtil.fromDartColor(Colors.orange)),
    WeekData(
        weekDay: "Wednesday",
        value: 50,
        color: charts.ColorUtil.fromDartColor(Colors.blue)),
    WeekData(
        weekDay: "Thursday",
        value: 75,
        color: charts.ColorUtil.fromDartColor(Colors.green)),
    WeekData(
        weekDay: "Friday",
        value: 40,
        color: charts.ColorUtil.fromDartColor(Colors.orange)),
    WeekData(
        weekDay: "Saturday",
        value: 23,
        color: charts.ColorUtil.fromDartColor(Colors.blue)),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<WeekData, String>> series = [
      charts.Series(
        id: "WeekData",
        data: data,
        domainFn: (WeekData series, _) => series.weekDay,
        measureFn: (WeekData series, _) => series.value,
        colorFn: (WeekData series, _) => series.color!,
      ),
    ];
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 10.h),
      height: 350.h,
      width: 400.w,
      child: charts.BarChart(
        series,
        animate: true,
        domainAxis: charts.OrdinalAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(
            labelRotation: 30,
          ),
        ),
      ),
    );
  }
}

class WeekData {
  final String weekDay;
  final double value;
  final charts.Color? color;

  WeekData({
    required this.weekDay,
    required this.value,
    this.color,
  });
}

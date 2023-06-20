import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YearGraphChart extends StatelessWidget {
  static const String routeName = '/year_graph_chart';
  final List<YearData> data = [
    YearData(
        month: "Jan",
        value: 50,
        color: charts.ColorUtil.fromDartColor(Colors.blue)),
    YearData(
        month: "Feb",
        value: 75,
        color: charts.ColorUtil.fromDartColor(Colors.green)),
    YearData(
        month: "Mar",
        value: 40,
        color: charts.ColorUtil.fromDartColor(Colors.orange)),
    YearData(
        month: "Apr",
        value: 50,
        color: charts.ColorUtil.fromDartColor(Colors.blue)),
    YearData(
        month: "May",
        value: 75,
        color: charts.ColorUtil.fromDartColor(Colors.green)),
    YearData(
        month: "June",
        value: 40,
        color: charts.ColorUtil.fromDartColor(Colors.orange)),
    YearData(
        month: "July",
        value: 0,
        color: charts.ColorUtil.fromDartColor(Colors.blue)),
    YearData(
        month: "Aug",
        value: 75,
        color: charts.ColorUtil.fromDartColor(Colors.green)),
    YearData(
        month: "Sep",
        value: 40,
        color: charts.ColorUtil.fromDartColor(Colors.orange)),
    YearData(
        month: "Oct",
        value: 50,
        color: charts.ColorUtil.fromDartColor(Colors.blue)),
    YearData(
        month: "Nov",
        value: 120,
        color: charts.ColorUtil.fromDartColor(Colors.green)),
    YearData(
        month: "Dec",
        value: 40,
        color: charts.ColorUtil.fromDartColor(Colors.orange)),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<YearData, String>> series = [
      charts.Series(
        id: "YearData",
        data: data,
        domainFn: (YearData series, _) => series.month,
        measureFn: (YearData series, _) => series.value,
        colorFn: (YearData series, _) => series.color!,
      ),
    ];
    return Container(
      height: 300.h,
      width: 500.w,
      padding: EdgeInsets.all(16.0),
      child: charts.BarChart(
        series,
        animate: true,
        domainAxis: charts.OrdinalAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(
            labelRotation: 20,
          ),
        ),
      ),
    );
  }
}

class YearData {
  final String month;
  final double value;
  final charts.Color? color;

  YearData({
    required this.month,
    required this.value,
    this.color,
  });
}

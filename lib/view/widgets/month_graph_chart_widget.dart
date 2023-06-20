import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonthGraphChart extends StatelessWidget {
  static const String routeName = '/month_graph_chart';
  final List<MonthData> data = [
    MonthData(
        day: "1",
        value: 50,
        color: charts.ColorUtil.fromDartColor(Colors.blue)),
    MonthData(
        day: "2",
        value: 75,
        color: charts.ColorUtil.fromDartColor(Colors.green)),
    MonthData(
        day: "3",
        value: 40,
        color: charts.ColorUtil.fromDartColor(Colors.orange)),
    MonthData(
        day: "4",
        value: 50,
        color: charts.ColorUtil.fromDartColor(Colors.blue)),
    MonthData(
        day: "5",
        value: 75,
        color: charts.ColorUtil.fromDartColor(Colors.green)),
    MonthData(
        day: "6",
        value: 40,
        color: charts.ColorUtil.fromDartColor(Colors.orange)),
    MonthData(
        day: "7", value: 0, color: charts.ColorUtil.fromDartColor(Colors.blue)),
    MonthData(
        day: "8",
        value: 75,
        color: charts.ColorUtil.fromDartColor(Colors.green)),
    MonthData(
        day: "9",
        value: 40,
        color: charts.ColorUtil.fromDartColor(Colors.orange)),
    MonthData(
        day: "10",
        value: 50,
        color: charts.ColorUtil.fromDartColor(Colors.blue)),
    MonthData(
        day: "11",
        value: 120,
        color: charts.ColorUtil.fromDartColor(Colors.green)),
    MonthData(
        day: "12",
        value: 40,
        color: charts.ColorUtil.fromDartColor(Colors.orange)),
    MonthData(
        day: "13",
        value: 50,
        color: charts.ColorUtil.fromDartColor(Colors.blue)),
    MonthData(
        day: "14",
        value: 75,
        color: charts.ColorUtil.fromDartColor(Colors.green)),
    MonthData(
        day: "15",
        value: 40,
        color: charts.ColorUtil.fromDartColor(Colors.orange)),
    MonthData(
        day: "16",
        value: 50,
        color: charts.ColorUtil.fromDartColor(Colors.blue)),
    MonthData(
        day: "17",
        value: 75,
        color: charts.ColorUtil.fromDartColor(Colors.green)),
    MonthData(
        day: "18",
        value: 40,
        color: charts.ColorUtil.fromDartColor(Colors.orange)),
    MonthData(
        day: "19",
        value: 0,
        color: charts.ColorUtil.fromDartColor(Colors.blue)),
    MonthData(
        day: "20",
        value: 75,
        color: charts.ColorUtil.fromDartColor(Colors.green)),
    MonthData(
        day: "21",
        value: 40,
        color: charts.ColorUtil.fromDartColor(Colors.orange)),
    MonthData(
        day: "22",
        value: 50,
        color: charts.ColorUtil.fromDartColor(Colors.blue)),
    MonthData(
        day: "23",
        value: 120,
        color: charts.ColorUtil.fromDartColor(Colors.green)),
    MonthData(
        day: "24",
        value: 40,
        color: charts.ColorUtil.fromDartColor(Colors.orange)),
    MonthData(
        day: "25",
        value: 40,
        color: charts.ColorUtil.fromDartColor(Colors.orange)),
    MonthData(
        day: "26",
        value: 0,
        color: charts.ColorUtil.fromDartColor(Colors.blue)),
    MonthData(
        day: "27",
        value: 75,
        color: charts.ColorUtil.fromDartColor(Colors.green)),
    MonthData(
        day: "28",
        value: 40,
        color: charts.ColorUtil.fromDartColor(Colors.orange)),
    MonthData(
        day: "29",
        value: 50,
        color: charts.ColorUtil.fromDartColor(Colors.blue)),
    MonthData(
        day: "30",
        value: 120,
        color: charts.ColorUtil.fromDartColor(Colors.green)),
    MonthData(
        day: "31",
        value: 40,
        color: charts.ColorUtil.fromDartColor(Colors.orange)),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<MonthData, String>> series = [
      charts.Series(
        id: "MonthData",
        data: data,
        domainFn: (MonthData series, _) => series.day,
        measureFn: (MonthData series, _) => series.value,
        colorFn: (MonthData series, _) => series.color!,
      ),
    ];
    return Container(
      height: 350.h,
      width: 700.w,
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 10.h),
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

class MonthData {
  final String day;
  final double value;
  final charts.Color? color;

  MonthData({
    required this.day,
    required this.value,
    this.color,
  });
}

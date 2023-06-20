import 'package:earning_statistics_graph/view/pages/earning_statistics_page.dart';
import 'package:earning_statistics_graph/view/widgets/year_graph_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            initialRoute: EarningStatisticsPage.routeName,
            //initialRoute: YearGraphChart.routeName,
            routes: {
              EarningStatisticsPage.routeName: (context) =>
                  EarningStatisticsPage(),
              YearGraphChart.routeName: (context) => YearGraphChart(),
            },
          );
        });
  }
}

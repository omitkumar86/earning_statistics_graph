import 'package:earning_statistics_graph/view/widgets/year_graph_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_mention/instagram_mention.dart';

import '../widgets/month_graph_chart_widget.dart';
import '../widgets/week_graph_chart_widget.dart';

class EarningStatisticsPage extends StatefulWidget {
  static const String routeName = '/earning_statistics_page';
  EarningStatisticsPage({super.key});

  @override
  State<EarningStatisticsPage> createState() => _EarningStatisticsPageState();
}

class _EarningStatisticsPageState extends State<EarningStatisticsPage>
    with SingleTickerProviderStateMixin {
  int selectedItem = 0;

  /// tab
  late TabController _tabController;
  int selectedTabIndex = 0;
  int selectedProjectDocTabIndex = 0;

  /// slider
  double _currentSliderValue = 20;

  final bodyGlobalKey = GlobalKey();
  final List<Widget> myTabs = [
    Tab(text: 'auto short'),
    Tab(text: 'auto long'),
    Tab(text: 'fixed'),
  ];
  late ScrollController _scrollController;
  late bool fixedScroll;

  @override
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          controller: _scrollController,
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, value) {
            return [
              SliverToBoxAdapter(
                  child: Container(
                padding: EdgeInsets.only(
                    top: 20.h, left: 16.w, right: 16.w, bottom: 20.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/earn.png",
                          height: 24.h,
                          width: 24.w,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          'Earning Statistics',
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    /// For Tab Bar
                    Container(
                      width: MediaQuery.of(context).size.width - 5,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: TabBar(
                        controller: this._tabController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                        indicatorPadding: EdgeInsets.zero,
                        labelPadding: EdgeInsets.all(0),
                        //isScrollable: true,
                        onTap: ((index) {
                          setState(() {
                            selectedTabIndex = index;
                          });
                          print("selectedTabIndex $selectedTabIndex");
                        }),
                        // DefaultTabController.of(context).index
                        tabs: [
                          Tab(
                            child: selectedTabIndex == 0
                                ? InstagramMention(
                                    padding: EdgeInsets.all(8),
                                    text: 'This Year',
                                    textStyle: TextStyle(
                                        fontSize: 16.sp, color: Colors.white),
                                    color: Colors.blue,
                                  )
                                : Text(
                                    "This Year",
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.black45),
                                  ),
                          ),
                          Tab(
                            child: selectedTabIndex == 1
                                ? InstagramMention(
                                    padding: EdgeInsets.all(8),
                                    text: 'This Month',
                                    textStyle: TextStyle(
                                        fontSize: 16.sp, color: Colors.white),
                                    color: Colors.blue,
                                  )
                                : Text(
                                    "This Month",
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.black45),
                                  ),
                          ),
                          Tab(
                            child: selectedTabIndex == 2
                                ? InstagramMention(
                                    padding: EdgeInsets.all(8),
                                    text: 'This Week',
                                    textStyle: TextStyle(
                                        fontSize: 16.sp, color: Colors.white),
                                    color: Colors.blue,
                                  )
                                : Text(
                                    "This Week",
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.black45),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ];
          },

          /// For View Tab Bar
          body: Container(
            alignment: Alignment.center,
            child: TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                /// This Year
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: YearGraphChart(),
                      ),
                    ],
                  ),
                ),

                /// This Month
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: MonthGraphChart()),
                    ],
                  ),
                ),

                /// This Week
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: WeekGraphChart(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

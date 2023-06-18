import 'package:flutter/material.dart';

import 'package:flutter_dashboard/pages/home/widgets/activity_details_card.dart';
import 'package:flutter_dashboard/pages/home/widgets/bar_graph_card.dart';
import 'package:flutter_dashboard/pages/home/widgets/line_chart_card.dart';
import 'package:flutter_dashboard/responsive.dart';
import 'package:get_it/get_it.dart';

import '../../app_state.dart';
import 'controller/controller.dart';

class HomePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomePage({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDataLoaded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _loadData();
    });
  }

  Controller controller = GetIt.I.get<Controller>();

  Future<void> _loadData() async {
    // if (!_isDataLoaded) {
    //   await controller.getData();
    //   setState(() {
    //     _isDataLoaded = true;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    SizedBox _height(BuildContext context) => SizedBox(
          height: Responsive.isDesktop(context) ? 30 : 20,
        );
    return ValueListenableBuilder<AppState>(
        valueListenable: controller.store.state,
        builder: (context, state, child) {
          return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Responsive.isMobile(context) ? 15 : 18),
                child: Column(
                  children: [
                    SizedBox(
                      height: Responsive.isMobile(context) ? 5 : 18,
                    ),
                    _height(context),
                    const ActivityDetailsCard(),
                    _height(context),
                    LineChartCard(),
                    _height(context),
                    BarGraphCard(),
                    _height(context),
                  ],
                ),
              )));
        });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dashboard/app_state.dart';
import 'package:flutter_dashboard/pages/home/controller/controller.dart';
import 'package:flutter_dashboard/pages/home/home_page.dart';
import 'package:flutter_dashboard/pages/home/widgets/activity_details_card.dart';
import 'package:flutter_dashboard/stores/home_store.dart';
import 'package:flutter_dashboard/widgets/menu.dart';
import 'package:flutter_dashboard/Responsive.dart';
import 'package:flutter_dashboard/widgets/profile/profile.dart';
import 'package:get_it/get_it.dart';

class DashBoard extends StatefulWidget {
  DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

Controller controller = GetIt.I.get<Controller>();
HomeStore store = GetIt.I.get<HomeStore>();

class _DashBoardState extends State<DashBoard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     await controller.getData();
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: !Responsive.isDesktop(context)
            ? SizedBox(width: 250, child: Menu(scaffoldKey: _scaffoldKey))
            : null,
        endDrawer: Responsive.isMobile(context)
            ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Profile())
            : null,
        body: ValueListenableBuilder<AppState>(
            valueListenable: controller.store.state,
            builder: (context, state, child) {
              if (state.isLoading()) {
                return Center(child: CircularProgressIndicator());
              }
              return SafeArea(
                child: Row(
                  children: [
                    if (Responsive.isDesktop(context))
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: Menu(scaffoldKey: _scaffoldKey)),
                      ),
                    Expanded(
                        flex: 3, child: HomePage(scaffoldKey: _scaffoldKey)),
                    if (!Responsive.isMobile(context))
                      const Expanded(
                        flex: 1,
                        child: Profile(),
                      ),
                  ],
                ),
              );
            }));
  }
}

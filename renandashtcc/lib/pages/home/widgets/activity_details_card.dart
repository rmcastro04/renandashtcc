import 'package:flutter/material.dart';
import 'package:flutter_dashboard/Responsive.dart';
import 'package:flutter_dashboard/app_state.dart';
import 'package:flutter_dashboard/model/health_model.dart';
import 'package:flutter_dashboard/stores/home_store.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

import '../../../repositories/repository_impl.dart';
import '../controller/controller.dart';

class ActivityDetailsCard extends StatefulWidget {
  const ActivityDetailsCard({super.key});

  @override
  State<ActivityDetailsCard> createState() => _ActivityDetailsCardState();
}

//

final String teste = "";

class _ActivityDetailsCardState extends State<ActivityDetailsCard> {
  Controller controller = GetIt.I.get<Controller>();
  HomeStore store = GetIt.I.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<HealthModel>>(
        valueListenable: controller.store.health,
        builder: (context, state, child) {
          if (controller.store.state.value.isLoading()) {
            return Center(child: CircularProgressIndicator());
          }
          return GridView.builder(
            itemCount: store.health.value.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
              crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
              mainAxisSpacing: 12.0,
            ),
            itemBuilder: (context, i) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: CustomCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        store.health.value[i].icon,
                        height: 30, // Defina o tamanho do ícone aqui
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 4),
                        child: Text(
                          store.health.value[i].value,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 37, 17, 148),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        store.health.value[i].title,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 27, 27, 27),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}

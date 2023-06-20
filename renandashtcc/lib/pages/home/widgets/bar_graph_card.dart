import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../controller/controller.dart';

class BarGraphCard extends StatefulWidget {
  const BarGraphCard({super.key});

  @override
  State<BarGraphCard> createState() => _BarGraphCardState();
}

class _BarGraphCardState extends State<BarGraphCard> {
  Controller controller = GetIt.I.get<Controller>();

  @override
  Widget build(BuildContext context) {
    final List<BarGraphModel> data = [
      BarGraphModel(
          label: 'Homens',
          value: controller.store.isAnalfabetismo
              ? controller.store.analfabetismoHomemView.value.toInt().floor()
              : controller.store.espVidaHomemView.value.toInt().floor(),
          color: const Color.fromARGB(255, 92, 175, 243)),
      BarGraphModel(
          label: 'Mulheres',
          value: controller.store.isAnalfabetismo
              ? controller.store.analfabetismoMulherView.value.toInt().floor()
              : controller.store.espMulherView.value.toInt().floor(),
          color: const Color.fromARGB(255, 248, 107, 97)),
      BarGraphModel(
          label: 'Negros',
          value: controller.store.isAnalfabetismo
              ? controller.store.analfabetismoNegrosView.value.toInt().floor()
              : controller.store.espVidaNegrosView.value.toInt().floor(),
          color: const Color.fromARGB(255, 135, 230, 139)),
      BarGraphModel(
          label: 'Brancos',
          value: controller.store.isAnalfabetismo
              ? controller.store.analfabetismoBrancosView.value.toInt().floor()
              : controller.store.espVidaBrancosView.value.toInt().floor(),
          color: const Color.fromARGB(255, 241, 184, 97)),
    ];
    return GridView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 15,
        mainAxisSpacing: 12.0,
        childAspectRatio: 5 / 4,
      ),
      itemBuilder: (context, i) {
        return CustomCard(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: data[i].value.toDouble(),
                            color: data[i].color,
                            title: '${data[i].value}%',
                            titleStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                          PieChartSectionData(
                            value: 100 - data[i].value.toDouble(),
                            color: const Color(0xFFE4E4E4),
                            radius: 44,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data[i].label,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '${data[i].value}%',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomCard extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Widget child;

  CustomCard({required this.padding, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}

class BarGraphModel {
  final String label;
  final int value;
  final Color color;

  BarGraphModel(
      {required this.label, required this.value, required this.color});
}

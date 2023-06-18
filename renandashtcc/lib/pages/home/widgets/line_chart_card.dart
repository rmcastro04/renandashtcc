import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_dashboard/responsive.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';
import 'package:get_it/get_it.dart';
import '../../../stores/home_store.dart';
import '../controller/controller.dart';

class LineChartCard extends StatefulWidget {
  LineChartCard({Key? key});

  @override
  _LineChartCardState createState() => _LineChartCardState();
}

class _LineChartCardState extends State<LineChartCard> {
  String? selectedState;
  String? selectedProblem;
  String? selectedYear = '2019';

  HomeStore store = GetIt.I.get<HomeStore>();
  Controller controller = GetIt.I.get<Controller>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: controller.store,
        builder: (context, state, child) {
          return CustomCard(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDropdown(
                        label: "Selecione um Estado:",
                        value: selectedState,
                        items: store.listStates.value,
                        onChanged: (String? newValue) {
                          int selectedIndex;

                          setState(() async {
                            selectedState = newValue;

                            // Atualizar os valores selecionados
                            selectedIndex =
                                store.listStates.value.indexOf(newValue!);

                            store.stateSelected =
                                store.listStates.value.indexOf(newValue);
                            await controller.getData();
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      if (selectedState == null)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Estado selecionado: ${store.listVisitor.value[store.stateSelected].territorialidades}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      SizedBox(height: 20),
                      _buildDropdown(
                        label: "Selecione um dado a ser visualizado:",
                        value: selectedProblem,
                        items: [
                          'Taxa de Analfabetismo 18 anos ou mais',
                          'Esperança de Vida ao nascer.',
                        ],
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedProblem = newValue;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      if (selectedProblem != null)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Dado selecionado: $selectedProblem',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      SizedBox(height: 20),
                      _buildDropdown(
                        label: "Selecione um Ano:",
                        value: selectedYear,
                        items: [
                          '2017',
                          '2018',
                          '2019',
                          '2020',
                          '2021',
                        ],
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedYear = newValue;
                            store.isSelected = int.parse(newValue!);
                            if (selectedYear == "2017") {
                              controller.getData();
                              store.index = 2017;
                            } else if (selectedYear == "2018") {
                              controller.getData();
                              store.index = 2018;
                            } else if (selectedYear == "2019") {
                              controller.getData();
                              store.index = 2019;
                            } else if (selectedYear == "2020") {
                              controller.getData();
                              store.index = 2020;
                            } else if (selectedYear == "2021") {
                              controller.getData();
                              store.index = 2021;
                            }
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      if (store.isSelected != null)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Ano selecionado: ${store.isSelected}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      AspectRatio(
                        aspectRatio:
                            Responsive.isMobile(context) ? 4 / 3 : 16 / 9,
                        child: SvgPicture.asset(
                          'assets/svg/brazil.svg',
                          fit: BoxFit.contain,
                          color: Color.fromARGB(255, 40, 43, 83),
                          width: 50,
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 22, 32, 77),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          icon: Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: SvgPicture.asset(
                              'assets/svg/down.svg',
                              height: 8,
                              width: 8,
                              color: Colors.black,
                            ),
                          ),
                          onChanged: onChanged,
                          items: items.toSet().map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                  color:
                                      value == item ? Color(0xFF164B75) : null,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

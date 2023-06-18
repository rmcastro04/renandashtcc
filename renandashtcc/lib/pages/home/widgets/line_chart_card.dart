import 'package:flutter/material.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';
import 'package:get_it/get_it.dart';
import '../../../app_state.dart';
import '../../../stores/home_store.dart';
import '../controller/controller.dart';

class LineChartCard extends StatefulWidget {
  LineChartCard({Key? key});

  @override
  _LineChartCardState createState() => _LineChartCardState();
}

List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class _LineChartCardState extends State<LineChartCard> {
  String? selectedState;
  String? selectedProblem;
  String? selectedYear;

  HomeStore store = GetIt.I.get<HomeStore>();
  Controller controller = GetIt.I.get<Controller>();
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = store.listStates.value.first;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppState>(
        valueListenable: controller.store.state,
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
                      Container(
                        child: _buildDropdown(
                          label: "Selecione um Estado:",
                          value: store.listVisitor.value[store.stateSelected]
                              .territorialidades,
                          items: store.listStates.value,
                          onChanged: (String? newValue) {
                            int selectedIndex;

                            setState(() async {
                              selectedState = newValue;
                              store.selectedStateText!.value = newValue!;
                              store.listVisitor.value[store.stateSelected]
                                      .territorialidades =
                                  store.selectedStateText!.value;

                              // Atualizar os valores selecionados
                              selectedIndex =
                                  store.listStates.value.indexOf(newValue);

                              store.stateSelected =
                                  store.listStates.value.indexOf(newValue);
                              await controller.getData();
                            });
                          },
                        ),
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
                        value: store.textDataSelected.value.toString(),
                        items: [
                          'Taxa de analfabetismo 18 anos ou mais',
                          'Esperança de Vida ao nascer.',
                        ],
                        onChanged: (String? newValue) {
                          setState(() {
                            store.textDataSelected.value = newValue!;
                            selectedProblem = newValue;

                            var isAnalfabetismo =
                                newValue.contains("analfabetismo");
                            controller.getData();
                            if (isAnalfabetismo) {
                              store.isAnalfabetismo = true;
                            } else {
                              store.isAnalfabetismo = false;
                            }
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
                        value: store.index.toString(),
                        items: [
                          '2017',
                          '2018',
                          '2019',
                          '2020',
                          '2021',
                        ],
                        onChanged: (String? newValue) {
                          selectedYear = newValue;
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
    return Column(
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
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 18,
              ),
              onChanged: onChanged,
              items: items
                  .toSet()
                  .toList()
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    // overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

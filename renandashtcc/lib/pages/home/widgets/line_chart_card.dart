import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';
import 'package:get_it/get_it.dart';
import '../../../app_state.dart';
import '../../../stores/home_store.dart';
import '../controller/controller.dart';
import 'bar_chart_custom_widget.dart';

class LineChartCard extends StatefulWidget {
  LineChartCard({Key? key});

  @override
  _LineChartCardState createState() => _LineChartCardState();
}

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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
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
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDropdown(
                          label: "Selecione um Estado:",
                          value: store.dataInfoList.value[store.stateSelected]
                              .territorialidades,
                          items: store.listStates.value,
                          onChanged: (String? newValue) async {
                            int selectedIndex;

                            setState(() {
                              selectedState = newValue;
                              store.selectedStateText!.value = newValue!;
                              store.dataInfoList.value[store.stateSelected]
                                      .territorialidades =
                                  store.selectedStateText!.value;

                              // Atualizar os valores selecionados
                              selectedIndex =
                                  store.listStates.value.indexOf(newValue);

                              store.stateSelected =
                                  store.listStates.value.indexOf(newValue);
                            });

                            await controller.getData();
                          },
                        ),
                        SizedBox(height: 10),
                        if (selectedState == null)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'Estado selecionado: ${store.dataInfoList.value[store.stateSelected].territorialidades}',
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
                              if (isAnalfabetismo) {
                                store.isAnalfabetismo = true;
                              } else {
                                store.isAnalfabetismo = false;
                              }

                              controller.getData();
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
                            setState(() {
                              store.dataRankingIdhm.value = [];
                              selectedYear = newValue;
                              store.isYearSelected = int.parse(newValue!);

                              if (selectedYear == "2017") {
                                store.index = 2017;
                              } else if (selectedYear == "2018") {
                                store.index = 2018;
                              } else if (selectedYear == "2019") {
                                store.index = 2019;
                              } else if (selectedYear == "2020") {
                                store.index = 2020;
                              } else if (selectedYear == "2021") {
                                store.index = 2021;
                              }

                              controller.getData();
                            });
                          },
                        ),
                        SizedBox(height: 10),
                        if (store.isYearSelected != null)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              'Ano selecionado: ${store.isYearSelected}',
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
                ),
              ),
              SizedBox(width: 20),
              Column(
                children: [
                  Text(
                    "Renda ferentente ao ano de ${store.isYearSelected ?? "2017"}",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Container(
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
                      height: 300,
                      width: 300,
                      child: BarChartCustomCustomWidget(
                        icomeMens:
                            double.parse(controller.store.rendaHomemView.value),
                        icomePersonWhite: double.parse(
                            controller.store.rendaBrancosView.value),
                        incomeWomens: double.parse(
                            controller.store.rendaMulheresView.value),
                        icomePersonBlack: double.parse(
                            controller.store.rendaNegrosView.value),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget chartToRun() {
    List<List<double>> rendaHomemValues = [
      [
        double.parse(store.rendaHomemView.value),
        double.parse(store.rendaMulheresView.value),
        double.parse(store.rendaNegrosView.value),
        double.parse(store.rendaBrancosView.value),
      ]
    ];

    LabelLayoutStrategy? xContainerLabelLayoutStrategy;
    ChartData chartData;
    ChartOptions chartOptions = const ChartOptions();
    chartData = ChartData(
      dataRowsColors: [
        Colors.blue,
      ],
      dataRows: rendaHomemValues,
      xUserLabels: const ['Homens', 'Mulheres', 'Negros', 'Brancos'],
      dataRowsLegends: [
        'Renda referente ao ano de ${store.isYearSelected ?? "2017"}',
      ],
      chartOptions: chartOptions,
    );
    var verticalBarChartContainer = VerticalBarChartTopContainer(
      chartData: chartData,
      xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
    );

    var verticalBarChart = VerticalBarChart(
      painter: VerticalBarChartPainter(
        verticalBarChartContainer: verticalBarChartContainer,
      ),
    );
    return verticalBarChart;
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
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey, // Cor da borda
              width: 1.0, // Largura da borda
            ),
            borderRadius: BorderRadius.circular(8.0), // Raio da borda
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              onChanged: onChanged,
              items: items
                  .toSet()
                  .toList()
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      value,
                      overflow: TextOverflow.ellipsis,
                    ),
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

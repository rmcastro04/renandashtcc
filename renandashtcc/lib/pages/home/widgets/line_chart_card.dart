import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_dashboard/responsive.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';




class LineChartCard extends StatefulWidget {
  LineChartCard({Key? key});

  @override
  _LineChartCardState createState() => _LineChartCardState();
}

class _LineChartCardState extends State<LineChartCard> {
  String? selectedState;
  String? selectedProblem;
  String? selectedYear;

  Map<String, String> stateIds = {
    'Acre': 'BR-AC',
    'Alagoas': 'BR-AL',
    'Amapá': 'BR-AM',
    'Amazonas': 'BR-AP',
    'Bahia': 'BR-BA',
    'Ceará': 'BR-CE',
    'Distrito Federal': 'BR-DF',
    'Espírito Santo': 'BR-ES',
    'Goiás': 'BR-GO',
    'Maranhão': 'BR-MA',
    'Mato Grosso': 'BR-MT',
    'Mato Grosso do Sul': 'BR-MS',
    'Minas Gerais': 'BR-MG',
    'Pará': 'BR-PA',
    'Paraíba': 'BR-PB',
    'Paraná': 'BR-PR',
    'Pernambuco': 'BR-PE',
    'Piauí': 'BR-PI',
    'Rio de Janeiro': 'BR-RJ',
    'Rio Grande do Norte': 'BR-RN',
    'Rio Grande do Sul': 'BR-RS',
    'Rondônia': 'BR-RO',
    'Roraima': 'BR-RR',
    'Santa Catarina': 'BR-SC',
    'São Paulo': 'BR-SA',
    'Sergipe': 'BR-SE',
    'Tocantins': 'BR-ES',
  };

  // Função para buscar os dados do Supabase
  Future<Map<String, dynamic>> fetchSupabaseData() async {
    // Aqui você deve implementar a lógica para buscar os dados do Supabase
    // e retornar um mapa com os dados desejados

    // Exemplo de implementação fictícia:
    await Future.delayed(Duration(seconds: 2)); // Simulando uma chamada assíncrona

    return {
      'Territorialidade': 'Território do estado',
      'Analfabetismo_2017': 10.5,
      'Analfabetismo_Homem_2017': 8.2,
      'Analfabetismo_mulher_2017': 12.7,
      'Analfabetismo_negros_2017': 11.8,
      'Analfabetismo_brancos_2017': 9.6,
    };
  }

  @override
  Widget build(BuildContext context) {
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
                  items: stateIds.keys.toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedState = newValue;
                      // Realizar a busca dos dados ao selecionar um estado
                      fetchSupabaseData().then((data) {
                        // Atualizar os valores selecionados
                        setState(() {
                          selectedProblem = data['Territorialidade'];
                          selectedYear = '2017';
                        });
                      });
                    });
                  },
                ),
                SizedBox(height: 10),
                if (selectedState != null)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Estado selecionado: $selectedState',
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
                    'Renda Per Capita',
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
                    });
                  },
                ),
                SizedBox(height: 10),
                if (selectedYear != null)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Ano selecionado: $selectedYear',
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
                  aspectRatio: Responsive.isMobile(context) ? 4 / 3 : 16 / 9,
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
                          value: value,
                          onChanged: onChanged,
                          items: items.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                  color: value == item
                                      ? Color(0xFF164B75)
                                      : null,
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

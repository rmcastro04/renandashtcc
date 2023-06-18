import 'dart:ui';

import 'package:flutter_dashboard/pages/home/widgets/bar_graph_card.dart';
import 'package:flutter_dashboard/repositories/repository_impl.dart';
import 'package:flutter_dashboard/stores/home_store.dart';

import '../../../app_state.dart';
import '../../../model/health_model.dart';

class Controller {
  final RepositoryImpl repository;
  final HomeStore store;

  Controller({required this.repository, required this.store});

  Future<void> getData() async {
    store.state.value = AppState.loading();

    final response = await RepositoryImpl().getData();
    int stateSelected = 9;

    response.fold((failure) {
      print(failure.message);
    }, (sucess) {
      store.listVisitor.value = sucess;
      // store.listVisitor.value[index].territorialidades;

      for (var data in sucess) {
        store.listStates.value.add(data.territorialidades);
      }
      

      switch (store.index) {
        case 2017:
          store.idhmView.value =
              store.listVisitor.value[store.stateSelected].idhm2017.toString();
          store.analfabetismoView.value = store
              .listVisitor.value[store.stateSelected].analfabetismo2017
              .toString();
          store.rendaView.value =
              store.listVisitor.value[store.stateSelected].renda2017.toString();
          store.espVidaView.value = store
              .listVisitor.value[store.stateSelected].espVida2017
              .toString();
          store.extremaProbrezaView.value = store
              .listVisitor.value[store.stateSelected].extremaPobreza2017
              .toString();
          store.analfabetismoHomemView.value = store
              .listVisitor.value[store.stateSelected].analfabetismoHomem2017
              .toString();
          store.analfabetismoMulherView.value = store
              .listVisitor.value[store.stateSelected].analfabetismoMulher2017
              .toString();
          store.analfabetismoNegrosView.value = store
              .listVisitor.value[store.stateSelected].analfabetismoNegros2017
              .toString();
          store.analfabetismoBrancosView.value = store
              .listVisitor.value[store.stateSelected].analfabetismoBrancos2017
              .toString();
          store.rendaHomemView.value = store
              .listVisitor.value[store.stateSelected].rendaHomem2017
              .toString();
          store.rendaMulherView.value = store
              .listVisitor.value[store.stateSelected].rendaMulher2017
              .toString();
          store.rendaNegrosView.value = store
              .listVisitor.value[store.stateSelected].rendaNegros2017
              .toString();
          store.rendaBrancosView.value = store
              .listVisitor.value[store.stateSelected].rendaBrancos2017
              .toString();
          store.espVidaHomemView.value = store
              .listVisitor.value[store.stateSelected].espHomem2017
              .toString();
          store.espMulherView.value = store
              .listVisitor.value[store.stateSelected].espMulher2017
              .toString();
          store.espVidaNegrosView.value = store
              .listVisitor.value[store.stateSelected].espNegros2017
              .toString();
          store.espVidaBrancosView.value = store
              .listVisitor.value[store.stateSelected].espBrancos2017
              .toString();
          break;
        case 2018:
          store.idhmView.value =
              store.listVisitor.value[store.stateSelected].idhm2018.toString();
          store.analfabetismoView.value = store
              .listVisitor.value[store.stateSelected].analfabetismo2018
              .toString();
          store.rendaView.value =
              store.listVisitor.value[store.stateSelected].renda2018.toString();
          store.espVidaView.value = store
              .listVisitor.value[store.stateSelected].espVida2018
              .toString();
          store.extremaProbrezaView.value = store
              .listVisitor.value[store.stateSelected].extremaPobreza2018
              .toString();
          store.analfabetismoHomemView.value = store
              .listVisitor.value[store.stateSelected].analfabetismoHomem2018
              .toString();
          store.analfabetismoMulherView.value = store
              .listVisitor.value[store.stateSelected].analfabetismoMulher2018
              .toString();
          store.analfabetismoNegrosView.value = store
              .listVisitor.value[store.stateSelected].analfabetismoNegros2018
              .toString();
          store.analfabetismoBrancosView.value = store
              .listVisitor.value[store.stateSelected].analfabetismoBrancos2018
              .toString();
          store.rendaHomemView.value = store
              .listVisitor.value[store.stateSelected].rendaHomem2018
              .toString();
          store.rendaMulherView.value = store
              .listVisitor.value[store.stateSelected].rendaMulher2018
              .toString();
          store.rendaNegrosView.value = store
              .listVisitor.value[store.stateSelected].rendaNegros2018
              .toString();
          store.rendaBrancosView.value = store
              .listVisitor.value[store.stateSelected].rendaBrancos2018
              .toString();
          store.espVidaHomemView.value = store
              .listVisitor.value[store.stateSelected].espHomem2018
              .toString();
          store.espMulherView.value = store
              .listVisitor.value[store.stateSelected].espMulher2018
              .toString();
          store.espVidaNegrosView.value = store
              .listVisitor.value[store.stateSelected].espNegros2018
              .toString();
          store.espVidaBrancosView.value = store
              .listVisitor.value[store.stateSelected].espBrancos2018
              .toString();
          break;
        case 2019:
          store.idhmView.value =
              store.listVisitor.value[store.stateSelected].idhm2019.toString();
          store.analfabetismoView.value = store
              .listVisitor.value[store.stateSelected].analfabetismo2019
              .toString();
          store.rendaView.value =
              store.listVisitor.value[store.stateSelected].renda2019.toString();
          store.espVidaView.value = store
              .listVisitor.value[store.stateSelected].espVida2019
              .toString();
          store.extremaProbrezaView.value = store
              .listVisitor.value[store.stateSelected].extremaPobreza2019
              .toString();
          store.analfabetismoHomemView.value = store
              .listVisitor.value[store.stateSelected].analfabetismoHomem2019
              .toString();
          store.analfabetismoMulherView.value = store
              .listVisitor.value[store.stateSelected].analfabetismoMulher2019
              .toString();
          store.analfabetismoNegrosView.value = store
              .listVisitor.value[store.stateSelected].analfabetismoNegros2019
              .toString();
          store.analfabetismoBrancosView.value = store
              .listVisitor.value[store.stateSelected].analfabetismoBrancos2019
              .toString();
          store.rendaHomemView.value = store
              .listVisitor.value[store.stateSelected].rendaHomem2019
              .toString();
          store.rendaMulherView.value = store
              .listVisitor.value[store.stateSelected].rendaMulher2019
              .toString();
          store.rendaNegrosView.value = store
              .listVisitor.value[store.stateSelected].rendaNegros2019
              .toString();
          store.rendaBrancosView.value = store
              .listVisitor.value[store.stateSelected].rendaBrancos2019
              .toString();
          store.espVidaHomemView.value = store
              .listVisitor.value[store.stateSelected].espHomem2019
              .toString();
          store.espMulherView.value = store
              .listVisitor.value[store.stateSelected].espMulher2019
              .toString();
          store.espVidaNegrosView.value = store
              .listVisitor.value[store.stateSelected].espNegros2019
              .toString();
          store.espVidaBrancosView.value = store
              .listVisitor.value[store.stateSelected].espBrancos2019
              .toString();
          break;
        case 2020:
          store.idhmView.value =
              store.listVisitor.value[store.stateSelected].idhm2020.toString();
          store.analfabetismoView.value = store
              .listVisitor.value[store.stateSelected].analfabetismo2020
              .toString();
          store.rendaView.value =
              store.listVisitor.value[store.stateSelected].renda2020.toString();
          store.espVidaView.value = store
              .listVisitor.value[store.stateSelected].espVida2020
              .toString();
          store.extremaProbrezaView.value = store
              .listVisitor.value[stateSelected].extremaPobreza2020
              .toString();
          store.analfabetismoHomemView.value = store
              .listVisitor.value[store.stateSelected].analfabetismoHomem2020
              .toString();
          store.analfabetismoMulherView.value = store
              .listVisitor.value[store.stateSelected].analfabetismoMulher2020
              .toString();
          store.analfabetismoNegrosView.value = store
              .listVisitor.value[store.stateSelected].analfabetismoNegros2020
              .toString();
          store.analfabetismoBrancosView.value = store
              .listVisitor.value[store.stateSelected].analfabetismoBrancos2020
              .toString();
          store.rendaHomemView.value = store
              .listVisitor.value[store.stateSelected].rendaHomem2020
              .toString();
          store.rendaMulherView.value = store
              .listVisitor.value[store.stateSelected].rendaMulher2020
              .toString();
          store.rendaNegrosView.value = store
              .listVisitor.value[store.stateSelected].rendaNegros2020
              .toString();
          store.rendaBrancosView.value = store
              .listVisitor.value[store.stateSelected].rendaBrancos2020
              .toString();
          store.espVidaHomemView.value = store
              .listVisitor.value[store.stateSelected].espHomem2020
              .toString();
          store.espMulherView.value = store
              .listVisitor.value[store.stateSelected].espMulher2020
              .toString();
          store.espVidaNegrosView.value = store
              .listVisitor.value[store.stateSelected].espNegros2020
              .toString();
          store.espVidaBrancosView.value = store
              .listVisitor.value[store.stateSelected].espBrancos2020
              .toString();
          break;
        case 2021:
          store.idhmView.value =
              store.listVisitor.value[store.stateSelected].idhm2021.toString();
          store.analfabetismoView.value = store
              .listVisitor.value[store.stateSelected].analfabetismo2021
              .toString();
          store.rendaView.value =
              store.listVisitor.value[store.stateSelected].renda2021.toString();
          store.espVidaView.value = store
              .listVisitor.value[store.stateSelected].espVida2021
              .toString();
          store.extremaProbrezaView.value = store
              .listVisitor.value[store.stateSelected].extremaPobreza2021
              .toString();
          store.analfabetismoHomemView.value = store
              .listVisitor.value[store.stateSelected].analfabetismoHomem2021
              .toString();
          store.analfabetismoMulherView.value = store
              .listVisitor.value[store.stateSelected].analfabetismoMulher2021
              .toString();
          store.analfabetismoNegrosView.value = store
              .listVisitor.value[store.stateSelected].analfabetismoNegros2021
              .toString();
          store.analfabetismoBrancosView.value = store
              .listVisitor.value[store.stateSelected].analfabetismoBrancos2021
              .toString();
          store.rendaHomemView.value = store
              .listVisitor.value[store.stateSelected].rendaHomem2021
              .toString();
          store.rendaMulherView.value = store
              .listVisitor.value[store.stateSelected].rendaMulher2021
              .toString();
          store.rendaNegrosView.value = store
              .listVisitor.value[store.stateSelected].rendaNegros2021
              .toString();
          store.rendaBrancosView.value = store
              .listVisitor.value[store.stateSelected].rendaBrancos2021
              .toString();
          store.espVidaHomemView.value = store
              .listVisitor.value[store.stateSelected].espHomem2021
              .toString();
          store.espMulherView.value = store
              .listVisitor.value[store.stateSelected].espMulher2021
              .toString();
          store.espVidaNegrosView.value = store
              .listVisitor.value[store.stateSelected].espNegros2021
              .toString();
          store.espVidaBrancosView.value = store
              .listVisitor.value[store.stateSelected].espBrancos2021
              .toString();
          break;
        default:
          store.idhmView.value = store.listVisitor.value[0].idhm2017.toString();
          store.analfabetismoView.value =
              store.listVisitor.value[0].analfabetismo2017.toString();
          store.rendaView.value =
              store.listVisitor.value[0].renda2017.toString();
          store.espVidaView.value =
              store.listVisitor.value[0].espVida2017.toString();
          store.extremaProbrezaView.value =
              store.listVisitor.value[0].extremaPobreza2017.toString();
          store.analfabetismoHomemView.value =
              store.listVisitor.value[0].analfabetismoHomem2017.toString();
          store.analfabetismoMulherView.value =
              store.listVisitor.value[0].analfabetismoMulher2017.toString();
          store.analfabetismoNegrosView.value =
              store.listVisitor.value[0].analfabetismoNegros2017.toString();
          store.analfabetismoBrancosView.value =
              store.listVisitor.value[0].analfabetismoBrancos2017.toString();
          store.rendaHomemView.value =
              store.listVisitor.value[0].rendaHomem2017.toString();
          store.rendaMulherView.value =
              store.listVisitor.value[0].rendaMulher2017.toString();
          store.rendaNegrosView.value =
              store.listVisitor.value[0].rendaNegros2017.toString();
          store.rendaBrancosView.value =
              store.listVisitor.value[0].rendaBrancos2017.toString();
          store.espVidaHomemView.value =
              store.listVisitor.value[0].espHomem2017.toString();
          store.espMulherView.value =
              store.listVisitor.value[0].espMulher2017.toString();
          store.espVidaNegrosView.value =
              store.listVisitor.value[0].espNegros2017.toString();
          store.espVidaBrancosView.value =
              store.listVisitor.value[0].espBrancos2017.toString();
          break;
      }

      final List<HealthModel> healthDetails = [
        HealthModel(
            icon: 'assets/svg/idhm.svg',
            value: store.idhmView.value,
            title: "IDHM"),
        HealthModel(
            icon: 'assets/svg/livro.svg',
            value: "${store.analfabetismoView.value} %",
            title: "ANALFABETISMO"),
        HealthModel(
            icon: 'assets/svg/renda.svg',
            value: "R\$ ${store.rendaView.value}",
            title: "RENDA"),
        HealthModel(
            icon: 'assets/svg/vida.svg',
            value: "${store.espVidaView.value} %",
            title: "ESPERANÇA DE VIDA"),
        HealthModel(
            icon: 'assets/svg/pobre.svg',
            value: "${store.extremaProbrezaView.value}%",
            title: "EXTREMA POBREZA"),
      ];
      final List<BarGraphModel> data = [
        BarGraphModel(
            label: 'Homens',
            value: 100,
            color: const Color.fromARGB(255, 92, 175, 243)),
        BarGraphModel(
            label: 'Mulheres',
            value: 100,
            color: const Color.fromARGB(255, 248, 107, 97)),
        BarGraphModel(
            label: 'Negros',
            value: 100,
            color: const Color.fromARGB(255, 135, 230, 139)),
        BarGraphModel(
            label: 'Brancos',
            value: 100,
            color: const Color.fromARGB(255, 241, 184, 97)),
      ];

      store.circularProgressData.value = data;
      store.health.value = healthDetails;

      Future.delayed(Duration(microseconds: 1), () {
        store.state.value = AppState.success();
      });
    });
  }
}

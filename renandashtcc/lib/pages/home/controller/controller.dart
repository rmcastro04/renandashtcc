import 'package:flutter_dashboard/repositories/repository_impl.dart';
import 'package:flutter_dashboard/stores/home_store.dart';

import '../../../app_state.dart';
import '../../../model/health_model.dart';
import '../../../model/list_idhm_model.dart';

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
      store.dataInfoList.value = sucess;

      for (var data in sucess) {
        store.listStates.value.add(data.territorialidades);
      }

      switch (store.index) {
        case 2017:
          store.idhmView.value =
              store.dataInfoList.value[store.stateSelected].idhm2017.toString();
          store.analfabetismoView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismo2017
              .toString();
          store.rendaView.value = store
              .dataInfoList.value[store.stateSelected].renda2017
              .toString();
          store.espVidaView.value = store
              .dataInfoList.value[store.stateSelected].espVida2017
              .toString();
          store.extremaProbrezaView.value = store
              .dataInfoList.value[store.stateSelected].extremaPobreza2017
              .toString();
          store.analfabetismoHomemView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismoHomem2017;
          store.analfabetismoMulherView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismoMulher2017;
          store.analfabetismoNegrosView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismoNegros2017;
          store.analfabetismoBrancosView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismoBrancos2017;
          store.rendaHomemView.value = store
              .dataInfoList.value[store.stateSelected].rendaHomem2017
              .toString();
          store.rendaMulherView.value = store
              .dataInfoList.value[store.stateSelected].rendaMulher2017
              .toString();
          store.rendaNegrosView.value = store
              .dataInfoList.value[store.stateSelected].rendaNegros2017
              .toString();
          store.rendaBrancosView.value = store
              .dataInfoList.value[store.stateSelected].rendaBrancos2017
              .toString();
          store.espVidaHomemView.value =
              store.dataInfoList.value[store.stateSelected].espHomem2017;
          store.espMulherView.value =
              store.dataInfoList.value[store.stateSelected].espMulher2017;
          store.espVidaNegrosView.value =
              store.dataInfoList.value[store.stateSelected].espNegros2017;
          store.espVidaBrancosView.value =
              store.dataInfoList.value[store.stateSelected].espBrancos2017;
          break;
        case 2018:
          store.idhmView.value =
              store.dataInfoList.value[store.stateSelected].idhm2018.toString();
          store.analfabetismoView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismo2018
              .toString();
          store.rendaView.value = store
              .dataInfoList.value[store.stateSelected].renda2018
              .toString();
          store.espVidaView.value = store
              .dataInfoList.value[store.stateSelected].espVida2018
              .toString();
          store.extremaProbrezaView.value = store
              .dataInfoList.value[store.stateSelected].extremaPobreza2018
              .toString();
          store.analfabetismoHomemView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismoHomem2018;
          store.analfabetismoMulherView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismoMulher2018;
          store.analfabetismoNegrosView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismoNegros2018;
          store.analfabetismoBrancosView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismoBrancos2018;
          store.rendaHomemView.value = store
              .dataInfoList.value[store.stateSelected].rendaHomem2018
              .toString();
          store.rendaMulherView.value = store
              .dataInfoList.value[store.stateSelected].rendaMulher2018
              .toString();
          store.rendaNegrosView.value = store
              .dataInfoList.value[store.stateSelected].rendaNegros2018
              .toString();
          store.rendaBrancosView.value = store
              .dataInfoList.value[store.stateSelected].rendaBrancos2018
              .toString();
          store.espVidaHomemView.value =
              store.dataInfoList.value[store.stateSelected].espHomem2018;
          store.espMulherView.value =
              store.dataInfoList.value[store.stateSelected].espMulher2018;
          store.espVidaNegrosView.value =
              store.dataInfoList.value[store.stateSelected].espNegros2018;
          store.espVidaBrancosView.value =
              store.dataInfoList.value[store.stateSelected].espBrancos2018;
          break;
        case 2019:
          store.idhmView.value =
              store.dataInfoList.value[store.stateSelected].idhm2019.toString();
          store.analfabetismoView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismo2019
              .toString();
          store.rendaView.value = store
              .dataInfoList.value[store.stateSelected].renda2019
              .toString();
          store.espVidaView.value = store
              .dataInfoList.value[store.stateSelected].espVida2019
              .toString();
          store.extremaProbrezaView.value = store
              .dataInfoList.value[store.stateSelected].extremaPobreza2019
              .toString();
          store.analfabetismoHomemView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismoHomem2019;
          store.analfabetismoMulherView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismoMulher2019;
          store.analfabetismoNegrosView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismoNegros2019;
          store.analfabetismoBrancosView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismoBrancos2019;
          store.rendaHomemView.value = store
              .dataInfoList.value[store.stateSelected].rendaHomem2019
              .toString();
          store.rendaMulherView.value = store
              .dataInfoList.value[store.stateSelected].rendaMulher2019
              .toString();
          store.rendaNegrosView.value = store
              .dataInfoList.value[store.stateSelected].rendaNegros2019
              .toString();
          store.rendaBrancosView.value = store
              .dataInfoList.value[store.stateSelected].rendaBrancos2019
              .toString();
          store.espVidaHomemView.value =
              store.dataInfoList.value[store.stateSelected].espHomem2019;
          store.espMulherView.value =
              store.dataInfoList.value[store.stateSelected].espMulher2019;
          store.espVidaNegrosView.value =
              store.dataInfoList.value[store.stateSelected].espNegros2019;
          store.espVidaBrancosView.value =
              store.dataInfoList.value[store.stateSelected].espBrancos2019;
          break;
        case 2020:
          store.idhmView.value =
              store.dataInfoList.value[store.stateSelected].idhm2020.toString();
          store.analfabetismoView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismo2020
              .toString();
          store.rendaView.value = store
              .dataInfoList.value[store.stateSelected].renda2020
              .toString();
          store.espVidaView.value = store
              .dataInfoList.value[store.stateSelected].espVida2020
              .toString();
          store.extremaProbrezaView.value = store
              .dataInfoList.value[stateSelected].extremaPobreza2020
              .toString();
          store.analfabetismoHomemView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismoHomem2020;
          store.analfabetismoMulherView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismoMulher2020;
          store.analfabetismoNegrosView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismoNegros2020;
          store.analfabetismoBrancosView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismoBrancos2020;
          store.rendaHomemView.value = store
              .dataInfoList.value[store.stateSelected].rendaHomem2020
              .toString();
          store.rendaMulherView.value = store
              .dataInfoList.value[store.stateSelected].rendaMulher2020
              .toString();
          store.rendaNegrosView.value = store
              .dataInfoList.value[store.stateSelected].rendaNegros2020
              .toString();
          store.rendaBrancosView.value = store
              .dataInfoList.value[store.stateSelected].rendaBrancos2020
              .toString();
          store.espVidaHomemView.value =
              store.dataInfoList.value[store.stateSelected].espHomem2020;
          store.espMulherView.value =
              store.dataInfoList.value[store.stateSelected].espMulher2020;
          store.espVidaNegrosView.value =
              store.dataInfoList.value[store.stateSelected].espNegros2020;
          store.espVidaBrancosView.value =
              store.dataInfoList.value[store.stateSelected].espBrancos2020;
          break;
        case 2021:
          store.idhmView.value =
              store.dataInfoList.value[store.stateSelected].idhm2021.toString();
          store.analfabetismoView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismo2021
              .toString();
          store.rendaView.value = store
              .dataInfoList.value[store.stateSelected].renda2021
              .toString();
          store.espVidaView.value = store
              .dataInfoList.value[store.stateSelected].espVida2021
              .toString();
          store.extremaProbrezaView.value = store
              .dataInfoList.value[store.stateSelected].extremaPobreza2021
              .toString();
          store.analfabetismoHomemView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismoHomem2021;
          store.analfabetismoMulherView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismoMulher2021;
          store.analfabetismoNegrosView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismoNegros2021;
          store.analfabetismoBrancosView.value = store
              .dataInfoList.value[store.stateSelected].analfabetismoBrancos2021;
          store.rendaHomemView.value = store
              .dataInfoList.value[store.stateSelected].rendaHomem2021
              .toString();
          store.rendaMulherView.value = store
              .dataInfoList.value[store.stateSelected].rendaMulher2021
              .toString();
          store.rendaNegrosView.value = store
              .dataInfoList.value[store.stateSelected].rendaNegros2021
              .toString();
          store.rendaBrancosView.value = store
              .dataInfoList.value[store.stateSelected].rendaBrancos2021
              .toString();
          store.espVidaHomemView.value =
              store.dataInfoList.value[store.stateSelected].espHomem2021;
          store.espMulherView.value =
              store.dataInfoList.value[store.stateSelected].espMulher2021;
          store.espVidaNegrosView.value =
              store.dataInfoList.value[store.stateSelected].espNegros2021;
          store.espVidaBrancosView.value =
              store.dataInfoList.value[store.stateSelected].espBrancos2021;
          break;
        default:
          store.idhmView.value =
              store.dataInfoList.value[0].idhm2017.toString();
          store.analfabetismoView.value =
              store.dataInfoList.value[0].analfabetismo2017.toString();
          store.rendaView.value =
              store.dataInfoList.value[0].renda2017.toString();
          store.espVidaView.value =
              store.dataInfoList.value[0].espVida2017.toString();
          store.extremaProbrezaView.value =
              store.dataInfoList.value[0].extremaPobreza2017.toString();
          store.analfabetismoHomemView.value =
              store.dataInfoList.value[0].analfabetismoHomem2017;
          store.analfabetismoMulherView.value =
              store.dataInfoList.value[0].analfabetismoMulher2017;
          store.analfabetismoNegrosView.value =
              store.dataInfoList.value[0].analfabetismoNegros2017;
          store.analfabetismoBrancosView.value =
              store.dataInfoList.value[0].analfabetismoBrancos2017;
          store.rendaHomemView.value =
              store.dataInfoList.value[0].rendaHomem2017.toString();
          store.rendaMulherView.value =
              store.dataInfoList.value[0].rendaMulher2017.toString();
          store.rendaNegrosView.value =
              store.dataInfoList.value[0].rendaNegros2017.toString();
          store.rendaBrancosView.value =
              store.dataInfoList.value[0].rendaBrancos2017.toString();
          store.espVidaHomemView.value =
              store.dataInfoList.value[0].espHomem2017;
          store.espMulherView.value = store.dataInfoList.value[0].espMulher2017;
          store.espVidaNegrosView.value =
              store.dataInfoList.value[0].espNegros2017;
          store.espVidaBrancosView.value =
              store.dataInfoList.value[0].espBrancos2017;
          break;
      }

      for (var i = 0; i < sucess.length; i++) {
        if (store.index == 2017) {
          store.dataRankingIdhm.value.add(ListIdhmModel(
            state: sucess[i].territorialidades,
            idhm: store.dataInfoList.value[i].idhm2017,
          ));

          store.dataRankingIdhm.value.sort((a, b) => b.idhm.compareTo(a.idhm));

          store.listIdhm.value
              .add(store.dataInfoList.value[i].idhm2017.toString());
          store.listIdhm.value
              .add(store.dataInfoList.value[i].territorialidades.toString());
        } else if (store.index == 2018) {
          store.dataRankingIdhm.value.add(ListIdhmModel(
            state: sucess[i].territorialidades,
            idhm: store.dataInfoList.value[i].idhm2018,
          ));

          store.dataRankingIdhm.value.sort((a, b) => b.idhm.compareTo(a.idhm));

          store.listIdhm.value
              .add(store.dataInfoList.value[i].idhm2018.toString());
          store.listIdhm.value
              .add(store.dataInfoList.value[i].territorialidades.toString());
        } else if (store.index == 2019) {
          store.dataRankingIdhm.value.add(ListIdhmModel(
            state: sucess[i].territorialidades,
            idhm: store.dataInfoList.value[i].idhm2019,
          ));

          store.dataRankingIdhm.value.sort((a, b) => b.idhm.compareTo(a.idhm));

          store.listIdhm.value
              .add(store.dataInfoList.value[i].idhm2019.toString());
          store.listIdhm.value
              .add(store.dataInfoList.value[i].territorialidades.toString());
        } else if (store.index == 2020) {
          store.dataRankingIdhm.value.add(ListIdhmModel(
            state: sucess[i].territorialidades,
            idhm: store.dataInfoList.value[i].idhm2020,
          ));

          store.dataRankingIdhm.value.sort((a, b) => b.idhm.compareTo(a.idhm));

          store.listIdhm.value
              .add(store.dataInfoList.value[i].idhm2020.toString());
          store.listIdhm.value
              .add(store.dataInfoList.value[i].territorialidades.toString());
        } else if (store.index == 2021) {
          store.dataRankingIdhm.value.add(ListIdhmModel(
            state: sucess[i].territorialidades,
            idhm: store.dataInfoList.value[i].idhm2021,
          ));

          store.dataRankingIdhm.value.sort((a, b) => b.idhm.compareTo(a.idhm));

          store.listIdhm.value
              .add(store.dataInfoList.value[i].idhm2021.toString());
          store.listIdhm.value
              .add(store.dataInfoList.value[i].territorialidades.toString());
        }
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

      store.health.value = healthDetails;

      Future.delayed(Duration(microseconds: 1), () {
        store.state.value = AppState.success();
      });
    });
  }
}

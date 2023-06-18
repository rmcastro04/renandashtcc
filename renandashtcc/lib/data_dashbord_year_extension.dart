// import 'package:flutter_dashboard/stores/home_store.dart';
// import 'package:get_it/get_it.dart';

// enum YearData {
//   data2017,
//   data2018,
//   data2019,
//   data2020,
//   data2021,
// }

// extension YearDataExtension on YearData {
//   String data(int index) {
//     HomeStore store = GetIt.I.get<HomeStore>();

//     switch (this) {
//       case YearData.data2017:
//         store.idhmView.value =
//             store.listVisitor.value[index].idhm2017.toString();
//         store.analfabetismoView.value =
//             store.listVisitor.value[index].analfabetismo2017.toString();
//         store.rendaView.value =
//             store.listVisitor.value[index].renda2017.toString();
//         store.espVidaView.value =
//             store.listVisitor.value[index].espVida2017.toString();
//         store.extremaProbrezaView.value =
//             store.listVisitor.value[index].extremaPobreza2017.toString();
//         store.analfabetismoHomemView.value =
//             store.listVisitor.value[index].analfabetismoHomem2017.toString();
//         store.analfabetismoMulherView.value =
//             store.listVisitor.value[index].analfabetismoMulher2017.toString();
//         store.analfabetismoNegrosView.value =
//             store.listVisitor.value[index].analfabetismoNegros2017.toString();
//         store.analfabetismoBrancosView.value =
//             store.listVisitor.value[index].analfabetismoBrancos2017.toString();
//         store.rendaHomemView.value =
//             store.listVisitor.value[index].rendaHomem2017.toString();
//         store.rendaMulherView.value =
//             store.listVisitor.value[index].rendaMulher2017.toString();
//         store.rendaNegrosView.value =
//             store.listVisitor.value[index].rendaNegros2017.toString();
//         store.rendaBrancosView.value =
//             store.listVisitor.value[index].rendaBrancos2017.toString();
//         store.espVidaHomemView.value =
//             store.listVisitor.value[index].espHomem2017.toString();
//         store.espMulherView.value =
//             store.listVisitor.value[index].espMulher2017.toString();
//         store.espVidaNegrosView.value =
//             store.listVisitor.value[index].espNegros2017.toString();
//         store.espVidaBrancosView.value =
//             store.listVisitor.value[index].espBrancos2017.toString();
//         break;
//       case YearData.data2018:
//         store.idhmView.value =
//             store.listVisitor.value[index].idhm2018.toString();
//         store.analfabetismoView.value =
//             store.listVisitor.value[index].analfabetismo2018.toString();
//         store.rendaView.value =
//             store.listVisitor.value[index].renda2018.toString();
//         store.espVidaView.value =
//             store.listVisitor.value[index].espVida2018.toString();
//         store.extremaProbrezaView.value =
//             store.listVisitor.value[index].extremaPobreza2018.toString();
//         store.analfabetismoHomemView.value =
//             store.listVisitor.value[index].analfabetismoHomem2018.toString();
//         store.analfabetismoMulherView.value =
//             store.listVisitor.value[index].analfabetismoMulher2018.toString();
//         store.analfabetismoNegrosView.value =
//             store.listVisitor.value[index].analfabetismoNegros2018.toString();
//         store.analfabetismoBrancosView.value =
//             store.listVisitor.value[index].analfabetismoBrancos2018.toString();
//         store.rendaHomemView.value =
//             store.listVisitor.value[index].rendaHomem2018.toString();
//         store.rendaMulherView.value =
//             store.listVisitor.value[index].rendaMulher2018.toString();
//         store.rendaNegrosView.value =
//             store.listVisitor.value[index].rendaNegros2018.toString();
//         store.rendaBrancosView.value =
//             store.listVisitor.value[index].rendaBrancos2018.toString();
//         store.espVidaHomemView.value =
//             store.listVisitor.value[index].espHomem2018.toString();
//         store.espMulherView.value =
//             store.listVisitor.value[index].espMulher2018.toString();
//         store.espVidaNegrosView.value =
//             store.listVisitor.value[index].espNegros2018.toString();
//         store.espVidaBrancosView.value =
//             store.listVisitor.value[index].espBrancos2018.toString();
//         break;
//       case YearData.data2019:
//         store.idhmView.value =
//             store.listVisitor.value[index].idhm2019.toString();
//         store.analfabetismoView.value =
//             store.listVisitor.value[index].analfabetismo2019.toString();
//         store.rendaView.value =
//             store.listVisitor.value[index].renda2019.toString();
//         store.espVidaView.value =
//             store.listVisitor.value[index].espVida2019.toString();
//         store.extremaProbrezaView.value =
//             store.listVisitor.value[index].extremaPobreza2019.toString();
//         store.analfabetismoHomemView.value =
//             store.listVisitor.value[index].analfabetismoHomem2019.toString();
//         store.analfabetismoMulherView.value =
//             store.listVisitor.value[index].analfabetismoMulher2019.toString();
//         store.analfabetismoNegrosView.value =
//             store.listVisitor.value[index].analfabetismoNegros2019.toString();
//         store.analfabetismoBrancosView.value =
//             store.listVisitor.value[index].analfabetismoBrancos2019.toString();
//         store.rendaHomemView.value =
//             store.listVisitor.value[index].rendaHomem2019.toString();
//         store.rendaMulherView.value =
//             store.listVisitor.value[index].rendaMulher2019.toString();
//         store.rendaNegrosView.value =
//             store.listVisitor.value[index].rendaNegros2019.toString();
//         store.rendaBrancosView.value =
//             store.listVisitor.value[index].rendaBrancos2019.toString();
//         store.espVidaHomemView.value =
//             store.listVisitor.value[index].espHomem2019.toString();
//         store.espMulherView.value =
//             store.listVisitor.value[index].espMulher2019.toString();
//         store.espVidaNegrosView.value =
//             store.listVisitor.value[index].espNegros2019.toString();
//         store.espVidaBrancosView.value =
//             store.listVisitor.value[index].espBrancos2019.toString();
//         break;
//       case YearData.data2020:
//         store.idhmView.value =
//             store.listVisitor.value[index].idhm2020.toString();
//         store.analfabetismoView.value =
//             store.listVisitor.value[index].analfabetismo2020.toString();
//         store.rendaView.value =
//             store.listVisitor.value[index].renda2020.toString();
//         store.espVidaView.value =
//             store.listVisitor.value[index].espVida2020.toString();
//         store.extremaProbrezaView.value =
//             store.listVisitor.value[index].extremaPobreza2020.toString();
//         store.analfabetismoHomemView.value =
//             store.listVisitor.value[index].analfabetismoHomem2020.toString();
//         store.analfabetismoMulherView.value =
//             store.listVisitor.value[index].analfabetismoMulher2020.toString();
//         store.analfabetismoNegrosView.value =
//             store.listVisitor.value[index].analfabetismoNegros2020.toString();
//         store.analfabetismoBrancosView.value =
//             store.listVisitor.value[index].analfabetismoBrancos2020.toString();
//         store.rendaHomemView.value =
//             store.listVisitor.value[index].rendaHomem2020.toString();
//         store.rendaMulherView.value =
//             store.listVisitor.value[index].rendaMulher2020.toString();
//         store.rendaNegrosView.value =
//             store.listVisitor.value[index].rendaNegros2020.toString();
//         store.rendaBrancosView.value =
//             store.listVisitor.value[index].rendaBrancos2020.toString();
//         store.espVidaHomemView.value =
//             store.listVisitor.value[index].espHomem2020.toString();
//         store.espMulherView.value =
//             store.listVisitor.value[index].espMulher2020.toString();
//         store.espVidaNegrosView.value =
//             store.listVisitor.value[index].espNegros2020.toString();
//         store.espVidaBrancosView.value =
//             store.listVisitor.value[index].espBrancos2020.toString();
//         break;
//       case YearData.data2021:
//         store.idhmView.value =
//             store.listVisitor.value[index].idhm2021.toString();
//         store.analfabetismoView.value =
//             store.listVisitor.value[index].analfabetismo2021.toString();
//         store.rendaView.value =
//             store.listVisitor.value[index].renda2021.toString();
//         store.espVidaView.value =
//             store.listVisitor.value[index].espVida2021.toString();
//         store.extremaProbrezaView.value =
//             store.listVisitor.value[index].extremaPobreza2021.toString();
//         store.analfabetismoHomemView.value =
//             store.listVisitor.value[index].analfabetismoHomem2021.toString();
//         store.analfabetismoMulherView.value =
//             store.listVisitor.value[index].analfabetismoMulher2021.toString();
//         store.analfabetismoNegrosView.value =
//             store.listVisitor.value[index].analfabetismoNegros2021.toString();
//         store.analfabetismoBrancosView.value =
//             store.listVisitor.value[index].analfabetismoBrancos2021.toString();
//         store.rendaHomemView.value =
//             store.listVisitor.value[index].rendaHomem2021.toString();
//         store.rendaMulherView.value =
//             store.listVisitor.value[index].rendaMulher2021.toString();
//         store.rendaNegrosView.value =
//             store.listVisitor.value[index].rendaNegros2021.toString();
//         store.rendaBrancosView.value =
//             store.listVisitor.value[index].rendaBrancos2021.toString();
//         store.espVidaHomemView.value =
//             store.listVisitor.value[index].espHomem2021.toString();
//         store.espMulherView.value =
//             store.listVisitor.value[index].espMulher2021.toString();
//         store.espVidaNegrosView.value =
//             store.listVisitor.value[index].espNegros2021.toString();
//         store.espVidaBrancosView.value =
//             store.listVisitor.value[index].espBrancos2021.toString();
//         break;
//       default:
//         store.idhmView.value = store.listVisitor.value[0].idhm2017.toString();
//         store.analfabetismoView.value =
//             store.listVisitor.value[0].analfabetismo2017.toString();
//         store.rendaView.value = store.listVisitor.value[0].renda2017.toString();
//         store.espVidaView.value =
//             store.listVisitor.value[0].espVida2017.toString();
//         store.extremaProbrezaView.value =
//             store.listVisitor.value[0].extremaPobreza2017.toString();
//         store.analfabetismoHomemView.value =
//             store.listVisitor.value[0].analfabetismoHomem2017.toString();
//         store.analfabetismoMulherView.value =
//             store.listVisitor.value[0].analfabetismoMulher2017.toString();
//         store.analfabetismoNegrosView.value =
//             store.listVisitor.value[0].analfabetismoNegros2017.toString();
//         store.analfabetismoBrancosView.value =
//             store.listVisitor.value[0].analfabetismoBrancos2017.toString();
//         store.rendaHomemView.value =
//             store.listVisitor.value[0].rendaHomem2017.toString();
//         store.rendaMulherView.value =
//             store.listVisitor.value[0].rendaMulher2017.toString();
//         store.rendaNegrosView.value =
//             store.listVisitor.value[0].rendaNegros2017.toString();
//         store.rendaBrancosView.value =
//             store.listVisitor.value[0].rendaBrancos2017.toString();
//         store.espVidaHomemView.value =
//             store.listVisitor.value[0].espHomem2017.toString();
//         store.espMulherView.value =
//             store.listVisitor.value[0].espMulher2017.toString();
//         store.espVidaNegrosView.value =
//             store.listVisitor.value[0].espNegros2017.toString();
//         store.espVidaBrancosView.value =
//             store.listVisitor.value[0].espBrancos2017.toString();
//         break;
//     }

//   }
// }



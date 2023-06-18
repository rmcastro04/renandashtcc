import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dashboard/stores/store.dart';

import '../app_state.dart';
import '../model/health_model.dart';
import '../model/data_firebase_model.dart';
import '../pages/home/widgets/bar_graph_card.dart';

class HomeStore extends Store {
  ValueNotifier<AppState> state = ValueNotifier<AppState>(AppState());

  ValueNotifier<List<DataFirebaseModel>> listVisitor = ValueNotifier([]);
  ValueNotifier<List<BarGraphModel>> circularProgressData = ValueNotifier([]);
  ValueNotifier<List<HealthModel>> health = ValueNotifier([]);
  ValueNotifier<List<String>> listStates = ValueNotifier([]);
    ValueNotifier<List<String>> listIdhm = ValueNotifier([]);


  int stateSelected = 0;
  int? isSelected;

  int index = 0;

  ValueNotifier<String> idhmView = ValueNotifier<String>("");
  ValueNotifier<String> analfabetismoView = ValueNotifier<String>("");
  ValueNotifier<String> rendaView = ValueNotifier<String>("");
  ValueNotifier<String> espVidaView = ValueNotifier<String>("");
  ValueNotifier<String> espVidaHomemView = ValueNotifier<String>("");
  ValueNotifier<String> espMulherView = ValueNotifier<String>("");
  ValueNotifier<String> espVidaNegrosView = ValueNotifier<String>("");
  ValueNotifier<String> espVidaBrancosView = ValueNotifier<String>("");

  ValueNotifier<String> extremaProbrezaView = ValueNotifier<String>("");
  ValueNotifier<String> analfabetismoHomemView = ValueNotifier<String>("");
  ValueNotifier<String> analfabetismoMulherView = ValueNotifier<String>("");
  ValueNotifier<String> analfabetismoNegrosView = ValueNotifier<String>("");
  ValueNotifier<String> analfabetismoBrancosView = ValueNotifier<String>("");
  ValueNotifier<String> rendaHomemView = ValueNotifier<String>("");
  ValueNotifier<String> rendaMulherView = ValueNotifier<String>("");
  ValueNotifier<String> rendaNegrosView = ValueNotifier<String>("");
  ValueNotifier<String> rendaBrancosView = ValueNotifier<String>("");

  Stream<String> streamDeDados = Stream.fromIterable([]);

  StreamController<String> streamController = StreamController<String>();
}

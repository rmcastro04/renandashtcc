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
  bool isAnalfabetismo = false;
  int index = 2017;
  ValueNotifier<String>? selectedStateText = ValueNotifier<String>("Item 1");

  ValueNotifier<String> idhmView = ValueNotifier<String>("");
  ValueNotifier<String> analfabetismoView = ValueNotifier<String>("");
  ValueNotifier<String> rendaView = ValueNotifier<String>("");
  ValueNotifier<String> espVidaView = ValueNotifier<String>("");
  ValueNotifier<double> espVidaHomemView = ValueNotifier<double>(0);
  ValueNotifier<double> espMulherView = ValueNotifier<double>(0);
  ValueNotifier<double> espVidaNegrosView = ValueNotifier<double>(0);
  ValueNotifier<double> espVidaBrancosView = ValueNotifier<double>(0);

  ValueNotifier<String> extremaProbrezaView = ValueNotifier<String>("");
  ValueNotifier<double> analfabetismoHomemView = ValueNotifier<double>(0);
  ValueNotifier<double> analfabetismoMulherView = ValueNotifier<double>(0);
  ValueNotifier<double> analfabetismoNegrosView = ValueNotifier<double>(0);
  ValueNotifier<double> analfabetismoBrancosView = ValueNotifier<double>(0);
  ValueNotifier<String> rendaHomemView = ValueNotifier<String>("");
  ValueNotifier<String> rendaMulherView = ValueNotifier<String>("");
  ValueNotifier<String> rendaNegrosView = ValueNotifier<String>("");
  ValueNotifier<String> rendaBrancosView = ValueNotifier<String>("");
  ValueNotifier<String> textDataSelected = ValueNotifier<String>("Esperança de Vida ao nascer.");

  ValueNotifier<String> valueDrop = ValueNotifier<String>("");

  Stream<String> streamDeDados = Stream.fromIterable([]);

  StreamController<String> streamController = StreamController<String>();
}

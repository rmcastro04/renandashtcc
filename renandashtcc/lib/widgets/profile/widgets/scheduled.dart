import 'package:flutter/material.dart';
import 'package:flutter_dashboard/model/scheduled_model.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';

import '../../../pages/home/controller/controller.dart';

class Scheduled extends StatefulWidget {
  const Scheduled({super.key});

  @override
  State<Scheduled> createState() => _ScheduledState();
}

class _ScheduledState extends State<Scheduled> {
// final List<ScheduledModel> scheduled = [
//     ScheduledModel(city: 'BRASÍLIA', idh: 0.814),
//     ScheduledModel(city: 'SÃO PAULO', idh: 0.806),
//     ScheduledModel(city: 'SANTA CATARINA', idh: 0.792),
//     ScheduledModel(city: 'MINAS GERAIS', idh: 0.774),
//     ScheduledModel(city: 'ESPIRITO SANTO', idh: 0.771),
//   ];
  Controller controller = GetIt.I.get<Controller>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Scheduled",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 12,
        ),
        for (var i = 0; i < 5; i++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: CustomCard(
              color: Color.fromRGBO(248, 249, 251, 0.89),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${controller.store.dataRankingIdhm.value[i].state}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 37, 37, 37),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'IDHM: ${controller.store.dataRankingIdhm.value[i].idhm.toStringAsFixed(3)}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 37, 37, 37),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/svg/up.svg',
                    color: const Color.fromARGB(255, 1, 233, 79),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dashboard/model/scheduled_model.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';
import 'package:flutter_svg/svg.dart';

class Scheduled extends StatelessWidget {
  Scheduled({Key? key});

  final List<ScheduledModel> scheduled = [
    ScheduledModel(city: 'BRASÍLIA', idh: 0.814),
    ScheduledModel(city: 'SÃO PAULO', idh: 0.806),
    ScheduledModel(city: 'SANTA CATARINA', idh: 0.792),
    ScheduledModel(city: 'MINAS GERAIS', idh: 0.774),
    ScheduledModel(city: 'ESPIRITO SANTO', idh: 0.771),
  ];

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
        for (var i = 0; i < scheduled.length; i++)
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
                          '${scheduled[i].city}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 37, 37, 37),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'IDHM: ${scheduled[i].idh.toStringAsFixed(3)}',
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

import 'package:flutter/material.dart';
import 'package:flutter_dashboard/Responsive.dart';
import 'package:flutter_dashboard/model/health_model.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';
import 'package:flutter_svg/svg.dart';

class ActivityDetailsCard extends StatelessWidget {
  const ActivityDetailsCard({Key? key});

  final List<HealthModel> healthDetails = const [
    HealthModel(
        icon: 'assets/svg/idhm.svg', value: "0,814", title: "IDHM"),
    HealthModel(icon: 'assets/svg/livro.svg', value: "%", title: "ANALFABETISMO"),
    HealthModel( icon: 'assets/svg/renda.svg', value: "%", title: "RENDA"),
    HealthModel(icon: 'assets/svg/vida.svg', value: "%", title: "ESPERANÇA DE VIDA"),
    HealthModel(icon: 'assets/svg/pobre.svg', value: "%", title: "EXTREMA POBREZA"),
   
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: healthDetails.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isMobile(context) ? 2 : 5,
        crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
        mainAxisSpacing: 12.0,
      ),
      itemBuilder: (context, i) {
        return Container(
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
          child: CustomCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  healthDetails[i].icon,
                  height: 30, // Defina o tamanho do ícone aqui
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 4),
                  child: Text(
                    healthDetails[i].value,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 37, 17, 148),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  healthDetails[i].title,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 27, 27, 27),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dashboard/responsive.dart';
import 'package:flutter_dashboard/const.dart';
import 'package:flutter_dashboard/widgets/profile/widgets/scheduled.dart';
//import 'package:flutter_dashboard/widgets/profile/widgets/weightHeightBloodCard.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Responsive.isMobile(context) ? 10 : 30.0),
          topLeft: Radius.circular(Responsive.isMobile(context) ? 10 : 30.0),
        ),
        color: cardBackgroundColor,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const SizedBox(
                height:   50,
              ),
              
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Ranking IDHM Atual",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color.fromARGB(244, 28, 28, 29)),
              ),
              const SizedBox(
                height: 10,
              ),
            
             
              SizedBox(
                height: Responsive.isMobile(context) ? 20 : 40,
              ),
              Scheduled()
            ],
          ),
        ),
      ),
    );
  }
}

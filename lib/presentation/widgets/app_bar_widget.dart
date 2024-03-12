import 'package:flutter/material.dart';
import 'package:pfa_emergency_app/core/colors/colors.dart';
import 'package:pfa_emergency_app/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 158, 158, 158),
            offset: Offset(1.0, 1.0),
            spreadRadius: 1.0,
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      //color: Colors.blue,
      child: const Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Row(
              children: [
                kWidthapp,
                Text(
                  'Welcome Unni,',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(
                  Icons.supervised_user_circle,
                  size: 50,
                ),
              ],
            ),
            Row(
              children: [
                kWidthapp,
                Icon(Icons.location_on_outlined),
                Text(
                  'Kochi,Kerala',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pfa_emergency_app/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          kWidthapp,
          Text(
            'Welcome Unni,',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          Spacer(),
          Icon(
            Icons.supervised_user_circle,
            size: 50,
          ),
          kWidthuser,
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pfa_app/core/colors/colors.dart';


class CardWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const CardWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('clics');
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: appbarColor,
              offset: Offset(1.0, 1.0),
              spreadRadius: 1.0,
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 150,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}

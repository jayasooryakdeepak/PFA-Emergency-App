import 'package:flutter/material.dart';
import 'package:pfa_app/core/colors/colors.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? imageUrl;
  final Widget widget;
  const CardWidget({
    super.key,
    required this.title,
    required this.icon,
    this.imageUrl,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget),
        );
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
            imageUrl != null
                ? Image.asset(
                    imageUrl!,
                    height: 150,
                    width: 150,
                  )
                : Icon(
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

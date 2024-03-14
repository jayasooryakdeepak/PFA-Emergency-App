import 'package:flutter/material.dart';
import 'package:pfa_app/core/colors/colors.dart';
import 'package:pfa_app/core/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneCardWidget extends StatelessWidget {
  final String phoneNumber;
  final String text1;
  final String text2;

  const PhoneCardWidget({
    super.key,
    required this.phoneNumber,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kPhoneCardWidgetHeight,
      decoration: BoxDecoration(
        color: PhoneCardWidgetColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          kWidthapp,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text1,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  text2,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Text(
                  phoneNumber,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          IconButton(
            onPressed: () {
              launchUrl(Uri.parse('tel:$phoneNumber'));
            },
            icon: const Icon(
              Icons.call,
              color: Colors.green,
            ),
          ),
          kWidthapp,
        ],
        
      ),
      
    );
  }
}

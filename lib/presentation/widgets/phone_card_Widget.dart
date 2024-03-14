import 'package:flutter/material.dart';
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
      height: 100,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 243, 193, 193),
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
          const SizedBox(width: 10),
          const Icon(
            Icons.phone,
            size: 30,
            color: Colors.blue,
          ),
          const SizedBox(width: 10),
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
          IconButton(
            onPressed: () {
              launchUrl(Uri.parse('tel:$phoneNumber'));
            },
            icon: const Icon(
              Icons.call,
              color: Colors.green,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

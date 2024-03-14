import 'package:flutter/material.dart';

class ServiceCardWidget extends StatelessWidget {
  final IconData icon;
  final String heading;
  final String subtext;
  final VoidCallback onPressed;

  const ServiceCardWidget({
    super.key,
    required this.icon,
    required this.heading,
    required this.subtext,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 30,
                color: Colors.blue,
              ),
              const SizedBox(height: 10),
              Text(
                heading,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtext,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

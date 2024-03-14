import 'package:flutter/material.dart';

class ServiceCardWidget extends StatelessWidget {
  final IconData icon;
  final String heading;
  final String subtext;

  const ServiceCardWidget({
    super.key,
    required this.icon,
    required this.heading,
    required this.subtext,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 32.0,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              heading,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              subtext,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

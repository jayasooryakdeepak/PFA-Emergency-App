import 'package:flutter/material.dart';

import 'package:pfa_app/presentation/widgets/service_card_widget.dart';

import '../widgets/phone_card_Widget.dart';

class ScreenAmbulance extends StatelessWidget {
  const ScreenAmbulance({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Book Ambulance',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        body: Column(
          children: [
            const PhoneCardWidget(
              phoneNumber: '0123456789',
              text1: 'Call for an Ambulance',
              text2: '24/7 emergency care',
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              children: const [
                ServiceCardWidget(
                  icon: Icons.local_hospital,
                  heading: 'Emergency Care',
                  subtext: '24/7 emergency care for all your medical needs.',
                ),
                ServiceCardWidget(
                  icon: Icons.local_pharmacy,
                  heading: 'Pharmacy',
                  subtext: 'A wide range of medications and over-the-counter.',
                ),
                ServiceCardWidget(
                  icon: Icons.local_dining,
                  heading: 'Cafeteria',
                  subtext:
                      'A variety of food and beverage options to choose from.',
                ),
                ServiceCardWidget(
                  icon: Icons.local_laundry_service,
                  heading: 'Laundry',
                  subtext:
                      'Convenient laundry services for your clothes and linens.',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

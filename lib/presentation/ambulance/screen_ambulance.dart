import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pfa_app/presentation/fire/screen_fire.dart';
import 'package:pfa_app/presentation/widgets/phone_card_Widget.dart';
import 'package:pfa_app/presentation/widgets/service_card_widget.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  pauseAutoPlayOnTouch: true,
                  viewportFraction: 1.0,
                ),
                items: [
                  Image.asset('lib/presentation/home/assets/icon/car-crash.gif'),
                  Image.asset('lib/presentation/home/assets/icon/car-crash.gif'),
                  Image.asset('lib/presentation/home/assets/icon/car-crash.gif'),
                ],
              ),
              const PhoneCardWidget(
                phoneNumber: '9110',
                text1: 'Call for an Ambulance',
                text2: '24/7 emergency care',
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: [
                  ServiceCardWidget(
                    icon: Icons.local_hospital,
                    heading: 'Emergency Care',
                    subtext: '24/7 emergency care for all your medical needs.',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScreenFire(),
                        ),
                      );
                    },
                  ),
                  ServiceCardWidget(
                    icon: Icons.local_pharmacy,
                    heading: 'Pharmacy',
                    subtext: 'A wide range of medications and over-the-counter.',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScreenFire() ,
                        ),
                      );
                    },
                  ),
                  ServiceCardWidget(
                    icon: Icons.local_dining,
                    heading: 'Cafeteria',
                    subtext:
                        'A variety of food and beverage options to choose from.',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScreenFire() ,
                        ),
                      );
                    },
                  ),
                  ServiceCardWidget(
                    icon: Icons.local_laundry_service,
                    heading: 'Laundry',
                    subtext:
                        'Convenient laundry services for your clothes and linens.',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScreenFire(),
                        ),
                      );
                    },
                  ),
                  ServiceCardWidget(
                    icon: Icons.local_dining,
                    heading: 'Cafeteria',
                    subtext:
                        'A variety of food and beverage options to choose from.',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScreenFire() ,
                        ),
                      );
                    },
                  ),
                  ServiceCardWidget(
                    icon: Icons.local_laundry_service,
                    heading: 'Laundry',
                    subtext:
                        'Convenient laundry services for your clothes and linens.',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScreenFire(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

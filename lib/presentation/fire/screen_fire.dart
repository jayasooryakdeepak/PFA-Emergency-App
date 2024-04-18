import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pfa_app/presentation/ambulance/screen_form.dart';
import 'package:pfa_app/presentation/widgets/phone_card_Widget.dart';
import 'package:pfa_app/presentation/widgets/service_card_widget.dart';

class ScreenFire extends StatelessWidget {
   ScreenFire({super.key});

  String serv_type = "Fire";

@override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Fire Service',
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
                  Image.asset('lib/presentation/fire/assets/fire.gif'),
                  Image.asset('lib/presentation/fire/assets/fire-extinguisher.gif'),
                  Image.asset('lib/presentation/fire/assets/fire.gif'),
                ],
              ),
              const PhoneCardWidget(
                phoneNumber: '1010',
                text1: 'Call for Fire and Rescue',
                text2: '24/7 emergency Service',
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: [
                  ServiceCardWidget(
                    icon: Icons.fire_extinguisher,
                    heading: 'Firefighting',
                    subtext: 'Firefighters respond to fires of all sizes, from small kitchen fires to large industrial fires.',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AmbuForm(req_type: 'Firefighting',ser_type: 'Fire',),
                        ),
                      );
                    },
                  ),
                  ServiceCardWidget(
                    icon: Icons.search,
                    heading: 'Search and rescue',
                    subtext: 'Rescue people from collapsed buildings, vehicles, and other dangerous situations.',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenFire() ,
                        ),
                      );
                    },
                  ),
                  ServiceCardWidget(
                    icon: Icons.fire_truck,
                    heading: 'Hazardous materials',
                    subtext:
                        'Safely contain and clean up spills of hazardous materials.',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenFire() ,
                        ),
                      );
                    },
                  ),
                  ServiceCardWidget(
                    icon: Icons.car_rental,
                    heading: 'Rent Fire Truck',
                    subtext:
                        'For Events and Programs',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenFire(),
                        ),
                      );
                    },
                  ),
                  ServiceCardWidget(
                    icon: Icons.woman,
                    heading: 'Fire Inspections',
                    subtext:
                        'Conduct inspections of businesses and homes to identify and correct fire hazards.',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenFire() ,
                        ),
                      );
                    },
                  ),
                  ServiceCardWidget(
                    icon: Icons.warning_rounded,
                    heading: 'Animal rescue',
                    subtext:
                        'For Rescuing animals',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenFire(),
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

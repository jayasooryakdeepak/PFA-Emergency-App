import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pfa_app/presentation/ambulance/screen_form.dart';
import 'package:pfa_app/presentation/fire/screen_fire.dart';
import 'package:pfa_app/presentation/widgets/phone_card_Widget.dart';
import 'package:pfa_app/presentation/widgets/service_card_widget.dart';

class ScreenPolice extends StatelessWidget {
  const ScreenPolice({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Police',
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
                  Image.asset('lib/presentation/police/assets/police-car.gif'),
                  Image.asset('lib/presentation/police/assets/police.gif'),
                  Image.asset('lib/presentation/police/assets/security-guard.gif'),
                ],
              ),
              const PhoneCardWidget(
                phoneNumber: '1000',
                text1: 'Call Police',
                text2: '24/7 Service',
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: [
                  ServiceCardWidget(
                    icon: Icons.local_hospital,

                    heading: 'Emergency Assistance',
                    subtext: '24/7 emergency Assistance',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AmbuForm(),
                        ),
                      );
                    },
                  ),
                  ServiceCardWidget(
                    icon: Icons.local_police_outlined,
                    heading: 'Report  Incident',
                    subtext: 'Report crimes including details like location and type of incident.',
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
                    icon: Icons.fire_truck,
                    heading: 'Location Sharing',
                    subtext:
                        'Request immediate assistance from nearby police officers',
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
                    icon: Icons.car_rental,
                    heading: 'Crime Mapping',
                    subtext:
                        'Access real-time crime data and interactive maps ',
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
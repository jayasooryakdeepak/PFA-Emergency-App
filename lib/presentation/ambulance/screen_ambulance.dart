import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pfa_app/presentation/admin/showdb.dart';
import 'package:pfa_app/presentation/ambulance/screen_form.dart';
import 'package:pfa_app/presentation/fire/screen_fire.dart';
import 'package:pfa_app/presentation/widgets/phone_card_Widget.dart';
import 'package:pfa_app/presentation/widgets/service_card_widget.dart';

class ScreenAmbulance extends StatelessWidget {
  ScreenAmbulance({super.key});

  String ser_type = "Ambulance";

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
                  Image.asset(
                      'lib/presentation/home/assets/icon/car-crash.gif'),
                  Image.asset(
                      'lib/presentation/home/assets/icon/car-crash.gif'),
                  Image.asset(
                      'lib/presentation/home/assets/icon/car-crash.gif'),
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
                          builder: (context) => AmbuForm(
                            req_type: 'Emergency Care',
                            ser_type: ser_type,
                          ),
                        ),
                      );
                    },
                  ),
                  ServiceCardWidget(
                    icon: Icons.airplanemode_on,
                    heading: 'Air Ambulance',
                    subtext: 'Schedule Air Ambulance Fast and easy',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowReq(),
                        ),
                      );
                    },
                  ),
                  ServiceCardWidget(
                    icon: Icons.fire_truck,
                    heading: 'Bulk Ambulance',
                    subtext: 'For emergency multiple ambulance needs',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AmbuForm(
                            req_type: 'Bulk Ambulance',
                            ser_type: ser_type,
                          ),
                        ),
                      );
                    },
                  ),
                  ServiceCardWidget(
                    icon: Icons.car_rental,
                    heading: 'Rent Ambulance',
                    subtext: 'For Events and Travel',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AmbuForm(
                            req_type: 'Rent Ambulance',
                            ser_type: ser_type,
                          ),
                        ),
                      );
                    },
                  ),
                  ServiceCardWidget(
                    icon: Icons.woman,
                    heading: 'Pink Ambulance',
                    subtext: 'Lady Drivers and staffs ',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AmbuForm(
                            req_type: 'Pink Ambulance',
                            ser_type: ser_type,
                          ),
                        ),
                      );
                    },
                  ),
                  ServiceCardWidget(
                    icon: Icons.warning_rounded,
                    heading: 'Animal Ambulance',
                    subtext: 'For transporting animals',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AmbuForm(
                            req_type: 'Animal Ambulance',
                            ser_type: ser_type,
                          ),
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

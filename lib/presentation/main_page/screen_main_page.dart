import 'package:flutter/material.dart';
import 'package:pfa_emergency_app/presentation/ambulance/screen_ambulance.dart';
import 'package:pfa_emergency_app/presentation/fire/screen_fire.dart';
import 'package:pfa_emergency_app/presentation/home/screen_home.dart';
import 'package:pfa_emergency_app/presentation/main_page/widgets/bottom_nav.dart';
import 'package:pfa_emergency_app/presentation/police/screen_police.dart';
import 'package:pfa_emergency_app/presentation/profile/screen_profile.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    ScreenHome(),
    ScreenAmbulance(),
    ScreenFire(),
    ScreenPolice(),
    ScreenProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}

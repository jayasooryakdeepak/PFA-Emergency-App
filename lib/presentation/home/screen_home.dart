import 'package:flutter/material.dart';
import 'package:pfa_app/core/constants.dart';
import 'package:pfa_app/presentation/ambulance/screen_ambulance.dart';
import 'package:pfa_app/presentation/fire/screen_fire.dart';
import 'package:pfa_app/presentation/police/screen_police.dart';
import 'package:pfa_app/presentation/widgets/app_bar_widget.dart';
import 'package:pfa_app/presentation/widgets/card_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBarWidget(),
      ),
      body: ListView(
        children: const [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              kHeightuser,
              Text(
                'Emergency Services',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CardWidget(
                title: 'Health Care',
                icon: Icons.local_hospital,
                imageUrl: 'lib/presentation/home/assets/icon/ambulance.gif',
                widget: ScreenAmbulance(),
              ),
              CardWidget(
                title: 'Fire & Safety',
                icon: Icons.local_fire_department,
                imageUrl: 'lib/presentation/home/assets/icon/fire-truck.gif',
                widget: ScreenFire(),
              ),
            ],
          ),
          SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CardWidget(
                title: 'Accident',
                icon: Icons.local_police,
                imageUrl: 'lib/presentation/home/assets/icon/car-crash.gif',
                widget: ScreenAmbulance(),
              ),
              CardWidget(
                title: 'Police',
                icon: Icons.local_police,
                imageUrl: 'lib/presentation/home/assets/icon/police-car.gif',
                widget: ScreenPolice(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

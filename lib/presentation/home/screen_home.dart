import 'package:flutter/material.dart';
import 'package:pfa_emergency_app/core/constants.dart';
import 'package:pfa_emergency_app/presentation/widgets/app_bar_widget.dart';

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
        ],
      ),
    );
  }
}

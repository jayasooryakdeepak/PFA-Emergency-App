import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfa_emergency_app/core/colors/colors.dart';
import 'package:pfa_emergency_app/presentation/main_page/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: backgroundColor,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              color: textColor,
            ),
            bodyMedium: TextStyle(
              color: textColor,
            ),
          )),
      home: ScreenMainPage(),
    );
  }
}

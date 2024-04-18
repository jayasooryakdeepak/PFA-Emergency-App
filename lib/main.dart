import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfa_app/core/colors/colors.dart';
import 'package:pfa_app/infrastructure/splash_screen/splash_screen.dart';
import 'package:pfa_app/presentation/auth/login_page.dart';
import 'package:pfa_app/presentation/auth/sign_up_page.dart';
import 'package:pfa_app/presentation/main_page/screen_main_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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
        ),
      ),
      routes: {
        '/': (context) => SplashScreen(
              // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
              child: LoginPage(),
            ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => ScreenMainPage(),
      },
      //home: ScreenMainPage(),
    );
  }
}

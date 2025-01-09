import 'package:echanyoba/screens/api_screen.dart';
import 'package:echanyoba/screens/detail_contact.dart';
import 'package:echanyoba/screens/forgot_password.dart';
import 'package:echanyoba/screens/home_screen.dart';
import 'package:echanyoba/service/api_service.dart';
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'package:dio/dio.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginView.id: (context) => LoginView(),
        HomePage.id: (context) => HomePage(),
        ForgotPasswordPage.id: (context) => ForgotPasswordPage(),
        DetailContact.id: (context) => DetailContact(),
        ApiTestScreen.id: (context) => ApiTestScreen(),
      },
    );
  }
}
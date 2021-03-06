import 'package:flutter/material.dart';
import './pantallas/home/home_screen.dart';
import './pantallas/auth/login/login_window.dart';
import './pantallas/auth/signup/signup_window.dart';
import 'componentes/constants.dart';
import 'dart:io';
import 'backend/services/AuthService.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MainLoader());
}

class MainLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
          future: AuthService.getToken(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return HomeScreen();
            } else {
              return LoginWindow();
            }
          }),
      routes: {
        '/home': (context) =>
            HomeScreen(), // <- HomeScreen decidira si estamos logeados o no, retornando a la ruta de /auth/login.
        '/auth/login': (context) =>
            LoginWindow(), // <- LoginWindow esta encargado de iniciar sesion.
        '/auth/signup': (context) =>
            SignUpWindow(), // <- SignUpWindow es para registrarse con el backend.
      },
      theme: ThemeData.dark().copyWith(
        backgroundColor: kBackgroundColor,
        primaryColor: kPrimaryAccentColor,
        dividerColor: kDividerColor,
        accentColor: kAccentColor,
        primaryColorDark: kDarkAccentColor,
        primaryColorLight: kLightAccentColor,
      ),
    );
  }
}

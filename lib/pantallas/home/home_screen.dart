import 'dart:developer';

import 'package:acanmul_app/backend/services/AuthService.dart';
import 'package:acanmul_app/pantallas/home/home_views/home_testing.dart';
import 'package:flutter/material.dart';
import './home_views/home_main.dart';
import './home_views/home_profile.dart';
import './home_views/home_contact.dart';
import 'home_views/debug_screen.dart';
import '../../backend/services/PackageService.dart';
import 'package:acanmul_app/pantallas/details/details.dart';

class HomeScreen extends StatefulWidget {
  //damian was here :v
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

/**
 * PackageService, UbicacionService
 * ---------------------------------------------------
 * Necesitan ser instanciados en singleton o instanciados aqui
 * y pasar sus referencias mas adelantes para evitar el error de 
 * carga inicial del MainView();
 */

class _HomeScreenState extends State<HomeScreen> {
  AuthService authService = AuthService();
  int _selectedIndex = 1;

  static List<Widget> vistas = <Widget>[
    ProfileView(),
    MainView(),
    ContactView(),
    DebugView(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(child: vistas.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: "Contacto"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Debug")
        ],
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        elevation: 5,
        iconSize: 30,
        onTap: _onItemTap,
      ),
    );
  }
}

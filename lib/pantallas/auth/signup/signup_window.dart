import 'package:flutter/material.dart';
import '../../../componentes/constants.dart';
import '../../../componentes/screens/reusable_card.dart';
import '../../../backend/services/AuthService.dart';
import 'dart:convert';

class SignUpWindow extends StatelessWidget {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final phoneTextController = TextEditingController();

  dynamic signup(BuildContext context) async {
    var authService = AuthService();
    final res = await authService.register(
        nameTextController.text,
        emailTextController.text,
        passwordTextController.text,
        phoneTextController.text);

    var data = jsonDecode(res) as Map<String, dynamic>;

    if (data['status'] == 200) {
      AuthService.setToken(data['token']);
      Navigator.pushReplacementNamed(context, '/home');

      return data;
    } else {
      // ALGO PASO, aun no hare el manejo de excepciones
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // gets device size. OBV.

    return Scaffold(
      appBar: AppBar(title: Text('Formulario de Registro')),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.04,
            ),
            ReusableCard(
              color: kLightAccentColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // main content widget list.
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                        keyboardType: TextInputType.name,
                        style: TextStyle(color: kPrimaryTextColor),
                        controller: nameTextController,
                        decoration: InputDecoration(
                          labelText: "Nombre",
                          labelStyle: TextStyle(color: kPrimaryTextColor),
                        )),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                        controller: emailTextController,
                        style: TextStyle(color: kPrimaryTextColor),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "E-Mail",
                          labelStyle: TextStyle(color: kPrimaryTextColor),
                        )),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller: passwordTextController,
                      style: TextStyle(color: kPrimaryTextColor),
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(color: kPrimaryTextColor)),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      controller: phoneTextController,
                      style: TextStyle(color: kPrimaryTextColor),
                      decoration: InputDecoration(
                          labelText: "Telefono",
                          labelStyle: TextStyle(color: kPrimaryTextColor)),
                      obscureText: false,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: size.width * 0.525,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: kDarkAccentColor),
                          onPressed: () {
                            // nada aun
                            signup(context);
                          },
                          child: Text('Registrate!'),
                        ),
                      )),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

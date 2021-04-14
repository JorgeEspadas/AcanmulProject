import 'package:flutter/material.dart';
import '../../../componentes/constants.dart';
import '../../../componentes/reusable_card.dart';
import '../../../backend/APIService.dart';

class SignUpWindow extends StatelessWidget {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final AuthService authService = AuthService();

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
                      decoration: InputDecoration(
                          labelText: "Telefono",
                          labelStyle: TextStyle(color: kPrimaryTextColor)),
                      obscureText: true,
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
                            print('Aun no hace nada xddd');
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
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sort_child_properties_last, unnecessary_new

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mifei/pantallas/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home.dart';

class Registro extends StatelessWidget {
  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final Color logoGreen = Color(0xff25bcbb);

  final TextEditingController correoControler = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usuarioController = TextEditingController();


  void dispose() {
    correoControler.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future registrarse() async {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: correoControler.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1D293F),
          elevation: 0,
        ),
        backgroundColor: primaryColor,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/fondo3.png"),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.topCenter,
          // ignore: prefer_const_constructors
          //margin: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Registrarse',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.poppins(color: Colors.white, fontSize: 26),
                ),
                SizedBox(height: 20),
                Text(
                  'Ingresa tu correo y contraseña en los siguientes campos para poder registrarse',
                  textAlign: TextAlign.center,
                  style:
                    GoogleFonts.poppins(color: Colors.white, fontSize: 13),
                ),
                SizedBox(
                  height: 50,
                ),
                _buildTextField(
                    correoControler, Icons.account_circle, 'Correo'),
                SizedBox(height: 20),
                _buildTextField(passwordController, Icons.lock, 'Contraseña'),
                SizedBox(height: 20),
                 _buildTextField(usuarioController, Icons.person, 'Usuario'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    registrarse();
                  },
                  child: Text(
                    "Registrarse",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20
                    ),  
                  ),
                  // ignore: unnecessary_new
                  style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0)),
                      primary: Color(0xff25bcbb),
                      onPrimary: Colors.white,
                      textStyle: TextStyle(fontSize: 20),
                      minimumSize: Size(360.0, 50)),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(height: 80),
                Positioned(
                  right: 90,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Text(
                      '¿Ya tienes una cuenta?',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildFooterLogo(),
                )
              ],
            ),
          ),
        ));
  }

  _buildFooterLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('MiFEI',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 21,
            fontWeight: FontWeight.w600
          )
        ),
      ],
    );
  }

  _buildTextField(
      TextEditingController controller, IconData icon, String labelText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xff1D293F),
          border: Border.all(color: Color(0xff16A3A2))),
      child: TextField(
        controller: controller,
        style: GoogleFonts.poppins(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }
}

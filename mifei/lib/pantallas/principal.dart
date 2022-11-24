// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unnecessary_new

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mifei/pantallas/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff18203d),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/uv.png",
              height: 200,
            ),
            SizedBox(
              height: 20,
            ),
            //Texts and Styling of them
            Text(
              '¡Bienvenido a MiFEI!',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nosotros te ayudaremos a llegar a tu destino',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 19,
                color: Colors.white,
              ),
              // style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            //Our MaterialButton which when pressed will take us to a new screen named as
            //LoginScreen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Login()));
              },
              child: Text("¡Comienza la aventura!"),
              // ignore: unnecessary_new
              style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0)),
                  primary: Color(0xff15ABA3),
                  onPrimary: Colors.white,
                  textStyle: GoogleFonts.poppins(
                    fontSize: 19
                  ),
                  minimumSize: Size(100.0, 50)),
            )
          ],
        ),
      ),
    );
  }
}

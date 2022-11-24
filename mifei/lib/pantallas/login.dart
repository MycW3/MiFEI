// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sort_child_properties_last, unnecessary_new, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mifei/pantallas/Registro.dart';
import 'package:mifei/pantallas/home.dart';
import 'package:mifei/pantallas/resetPass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Login extends StatelessWidget {
  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);
  final Color logoGreen = Color(0xff25bcbb);

  bool cargando = false;

  final correoControler = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    correoControler.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void iniciar() {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: correoControler.text, password: passwordController.text)
          .then((result) {
        cargando = false;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      }).catchError((err) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.scale,
          headerAnimationLoop: false,
          title: 'Error',
          desc: "Al parece has ingresado credenciales incorrectas",
          btnOkOnPress: () {},
          btnOkIcon: Icons.cancel,
          btnOkColor: Colors.red,
        ).show();
      });
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
                  'Iniciar sesión',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.poppins(color: Colors.white, fontSize: 28),
                ),
                SizedBox(height: 20),
                Text(
                  'Ingresa tu correo y contraseña en los siguientes campos para poder continuar',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.poppins(color: Colors.white, fontSize: 14),
                ),
                SizedBox(
                  height: 50,
                ),
                _buildTextField(
                    correoControler, Icons.account_circle, 'Correo'),
                SizedBox(height: 20),
                _buildTextField(passwordController, Icons.lock, 'Contraseña'),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    iniciar();
                  },
                  child: Text(
                    "Iniciar sesion",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w400
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
                Positioned(
                    left: 50,
                    child: Container(
                      height: 1,
                      width: 310,
                      color: Color(0xff25bcbb),
                    )),
                SizedBox(height: 15),
                ElevatedButton.icon(
                  onPressed: () async{
                    User? user = await SignInWithGoogle(context: context);
                    if(user != null){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home()),
                      );
                    }
                  },
                  icon: Icon(FontAwesomeIcons.google),
                  label: Text(
                    "Iniciar sesion con Google",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  // ignore: unnecessary_new
                  style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0)),
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      textStyle: TextStyle(fontSize: 20),
                      minimumSize: Size(360.0, 50)),
                ),
                SizedBox(height: 80),
                Positioned(
                  right: 90,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecuperarPass()),
                      );
                    },
                    child: Text(
                      '¿Olvidaste tu contraseña?',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(height: 0),
                Positioned(
                  right: 90,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Registro()),
                      );
                    },
                    child: Text(
                      '¿Aun no tienes una cuenta?',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
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
                fontWeight: FontWeight.bold)),
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
  static Future<User?> SignInWithGoogle({required BuildContext context}) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    if(googleSignInAccount != null){
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken
      );

      try{
        final UserCredential userCredential = await auth.signInWithCredential(credential);
        user = userCredential.user;
      }on FirebaseAuthException catch (e){
        if(e.code == 'account-exists-with-different-credential'){
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(
              content: 'The account already exists with a different credential.'
            )
          );
        }else if(e.code == 'invalid-credential'){
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(
              content: 'Error accurred while accessing credentials. Try again.'
            )
          );
        }
      }catch(e){
        ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar(
           content: 'Error occurred using Google Sign-In. Try again.'
          )
        );
      }
    }
    return user;
  }

  static SnackBar customSnackBar({required String content}){
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }
}

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mifei/pantallas/principal.dart';
import 'package:mifei/pantallas/resetPass.dart';

//VARIABLES
final usuario = FirebaseAuth.instance.currentUser;

class eliminarCuenta extends StatefulWidget {
  const eliminarCuenta({Key? key}) : super(key: key);
  State<eliminarCuenta> createState() => _eliminarCuenta();
}

class _eliminarCuenta extends State<eliminarCuenta> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String contra = '';
  String email = usuario!.email!;
  final fieldText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D293F),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Text(
                    'MI FEI',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                  SizedBox(height: 40),
                  Container(width: 150, height: 150, child: avatarPerfil()),
                  SizedBox(height: 20),
                  Text(
                    usuario!.email!,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Debes verificar tu identidad para continuar',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff1D293F),
                        border: Border.all(color: Color(0xff1D293F)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Color(0xff16A3A2))),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              hintText: 'Introduce tu contraseña',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              )),
                          controller: fieldText,
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                          onChanged: (value) => {contra = value},
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RecuperarPass()));
                          },
                          child: Text(
                            '¿Olvidaste tu contraseña?',
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 25),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.red[900],
                          ),
                          child: TextButton(
                            onPressed: () async {
                              try {
                                final user = await auth.signInWithEmailAndPassword(
                                    email: email, password: contra);
                                if (user != null) {
                                  await usuario?.delete();
                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute<Null>(
                                    builder: (BuildContext context){
                                      return new Principal();
                                    }
                                  ), (Route<dynamic> route) => false);
                                }
                              } catch (e) {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.scale,
                                  headerAnimationLoop: false,
                                  title: 'Error',
                                  desc:
                                  'Contraseña incorrecta o cuenta eliminada.',
                                  btnOkIcon: Icons.error,
                                  btnOkColor: Colors.red,
                                ).show();
                                fieldText.clear();
                              }
                            },
                            child: Text(
                              'Eliminar',
                              style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
                  ),
          )
      ),
    );
  }
}

Widget avatarPerfil() => CircleAvatar(
      radius: 144 / 2,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: AssetImage("assets/images/avatar.jpeg"),
    );

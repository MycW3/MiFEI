import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mifei/pantallas/eliminarCuenta.dart';
import 'package:mifei/pantallas/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mifei/pantallas/login.dart';


class Perfil extends StatefulWidget {
  @override
  _Perfil createState() => _Perfil();
}

class _Perfil extends State<Perfil> {
  final usuario = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D293F),
      body: ListView(
        //padding: EdgeInsets.all(50),
        
        children: <Widget>[
          imagenTop(),
          SizedBox(
            height: 120,
          ),
          contenido(),
          SizedBox(
            height: 35,
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 115),
            leading: Icon(Icons.lock, color: Colors.white),
            title: Text("Cerrar sesion",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14
              ),
            ),
            onTap: () => {
              FirebaseAuth.instance.signOut(),
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Login()),
              ),
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 115),
            leading: Icon(Icons.edit, color: Colors.white),
            title: Text(
              "Editar perfil",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14
              ),
            ),
            onTap: () => {},
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 115),
            leading: Icon(Icons.delete, color: Colors.white),
            title: Text(
              "Eliminar cuenta",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14
              ),
            ),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => eliminarCuenta())  
              )
            },
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 55.0,
        backgroundColor: Color(0xff1D293F),
        color: Color(0xffffffff),
        animationDuration: Duration(milliseconds: 500),
        // ignore: prefer_const_literals_to_create_immutables
        onTap: (index) {
          if (index == 0) {
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          } else {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text("Pantalla contribuir"),
                  );
                });
          }
        },
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          Icon(
            Icons.account_circle_rounded,
            color: Color(0xff1D293F),
            size: 25,
          ),
          Icon(
            Icons.home_filled,
            color: Color(0xff1D293F),
            size: 25,
          ),
          Icon(
            Icons.add,
            color: Color(0xff1D293F),
            size: 25,
          ),
        ],
      ),
    );
  }

  Widget imagenTop() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        imagenFondo(),
        Positioned(
          top: 220 - 144 / 2,
          child: avatarPerfil(),
        ),
      ],
    );
  }

  Widget imagenFondo() => Container(
        color: Colors.white,
        child: Image.asset("assets/images/fondo_perfil.png",
            width: double.infinity, height: 200, fit: BoxFit.cover),
      );

  Widget avatarPerfil() => CircleAvatar(
        radius: 144 / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: AssetImage("assets/images/avatar.jpeg"),
      );
      
  Widget contenido() => Column(
    children: [
      Text(
        usuario!.email!,
        style: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Colors.white
          ),
        ),
      SizedBox(
            height: 30,
      ),
      Text(
        "Estudiante de quinto semestre de Tecnologias Computacionales",
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: Colors.white
        ),
        textAlign: TextAlign.center
      ),
    ],
  );
}

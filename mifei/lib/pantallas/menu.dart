// ignore_for_file: prefer_const_constructors, unnecessary_new, use_key_in_widget_constructors, unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mifei/pantallas/acercade.dart';
import 'package:mifei/pantallas/clima.dart';
import 'package:mifei/pantallas/noticia.dart';

class Menu extends StatelessWidget {
  final usuario = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: null,
            accountEmail: Text(
              usuario!.email!,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400
              ),
            ),
            currentAccountPicture: CircleAvatar(
                child: ClipOval(
              child: Image.asset(
                "assets/images/avatar.jpeg",
                fit: BoxFit.cover,
                height: 90,
                width: 90,
              ),
            )),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/fondo3.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text(
              "Historial",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500
              ),
            ),
            onTap: () => {
              
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text(
              "Mis rutas",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500
              ),  
            ),
            onTap: () => {
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text(
              "Noticias",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500
              ),
            ),
            onTap: () => {
              Navigator.push(
                (context),
                MaterialPageRoute(builder: (context) => HomePage())
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.send),
            title: Text(
              "Enviar sugerencias y comentarios",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500
              ),  
            ),
            onTap: () => {_showTextInputDialog(context)},
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text(
              "Acerca de",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500
              ),
            ),
            onTap: () => {
              Navigator.push(
                (context),
                MaterialPageRoute(builder: (context) => Acercade())
              )
            },
          ),
        ],
      ),
    );
  }

  _showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      title: Text(
        "Exito",
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w500
        ),
      ),
      content: Text(
        "Correo enviado correctamente",
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w300
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  final _textFieldController = TextEditingController();
  Future<String?> _showTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            title: Text(
              'Sugerencias o comentarios',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),
            ),
            content: TextField(
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w300
              ),
            controller: _textFieldController,
              decoration: const InputDecoration(hintText: "Ingrese el mensaje"),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff232c51),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  "Cancelar",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500
                  ),
                ),
                onPressed: () => Navigator.pop(context),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff232c51),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Enviar',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500
                  ),
                ),
                onPressed: () => {
                  Navigator.pop(context, _textFieldController.text),
                  _showAlertDialog(context),
                },
              ),
            ],
          );
        });
  }
}

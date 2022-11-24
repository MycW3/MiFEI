// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unnecessary_new

import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mifei/pantallas/home.dart';
import 'package:mifei/pantallas/perfil.dart';

class Contribuir extends StatefulWidget {
  @override
  _Contribuir createState() => _Contribuir();
}

class _Contribuir extends State<Contribuir> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'Eduardo',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Default'
    },
    {
      'name': 'Mari',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Default2'
    },
  ];

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {

                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Color(0xff274979),
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  /*
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(data[i]['pic'] + "$i")), 
                  */
                ),
              ),
              title: Text(
                data[i]['name'],
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
              subtitle: Text(
                data[i]['message'],
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: 13.0,
                ),
              ),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "MiFEI",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Color(0xff274979),
      ),
      body: Container(
        child: CommentBox(
          userImage: "https://i.pinimg.com/originals/ac/4f/c9/ac4fc945af02bc0ddae3a8ac5002e610.jpg",
          child: commentChild(filedata),
          labelText: 'Escribe un comentario...',
          withBorder: false,
          errorText: 'No puede ir vacio',
          sendButtonMethod: () {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              setState(() {
                var value = {
                  'name': 'Prueba',
                  'pic': 'https://i.pinimg.com/originals/ac/4f/c9/ac4fc945af02bc0ddae3a8ac5002e610.jpg',
                  'message': commentController.text
                };
                filedata.insert(0, value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          sendWidget:
              Icon(Icons.send_sharp, size: 30, color: Color(0xff274979)),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 55.0,
        backgroundColor: Colors.white,
        color: Color(0xff274979),
        animationDuration: Duration(milliseconds: 500),
        // ignore: prefer_const_literals_to_create_immutables
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Perfil()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Contribuir()),
            );
          }
        },
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          Icon(
            Icons.account_circle_rounded,
            color: Colors.white,
            size: 25,
          ),
          Icon(
            Icons.home_filled,
            color: Colors.white,
            size: 25,
          ),
          Icon(
            Icons.add,
            color: Colors.white,
            size: 25,
          ),
        ],
      ),
    );
  }
}

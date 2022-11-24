// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, dead_code, equal_keys_in_map, prefer_typing_uninitialized_variables

/*

FUNCION DE CREAR RUTA

var rutaFinal;
                    Ruta.listaRuta.forEach((element) {
                      if ((_dondeEstoy == element.rutaEstoy) &&
                          (_dondeVoy == element.rutaVoy)) {
                        rutaFinal = element.image;
                        print(rutaFinal);
                      }
                    });

*/

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mifei/pantallas/contribuir.dart';
import 'package:searchfield/searchfield.dart';
import 'package:mifei/pantallas/menu.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:mifei/pantallas/perfil.dart';
import 'package:mifei/pantallas/datosMapa.dart';
import 'clima.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

class _Home extends State<Home> {
  final usuario = FirebaseAuth.instance.currentUser;
  String?
      _dondeEstoy; // -> VARIABLE QUE GUARDA EL VALIR DEL COMBOBOX (DONDE ESTOY)
  String? _dondeVoy; // -> VARIABLE QUE GUARDA EL VALIR DEL COMBOBOX (DONDE VOY)
  var imagenDondeEstoy;
  var imagenDondeVoy;
  String rutaFinal = "assets/images/mapa.jpeg";

  List<String> arregloDondeEstoy = [
    'Entrada',
    'Biblioteca',
    'Aula 106'
  ]; // -> ELEMENTOS (DONDE ESTOY) DEL COMBOBOX

  List<String> arregloDondeVoy = [
    'Aula 107',
    'Aula 101',
    'Biblioteca',
    'Entrada',
  ]; //-> ELEMENTOS (DONDE VOY) DEL COMBOBOX

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Menu(),
      body: Container(
        height: 600,
        child: Stack(
          children: <Widget>[
            Container(
              color: Color(0xff274979),
              width: MediaQuery.of(context).size.width,
              height: 100.0,
              child: Center(
                child: Text(
                  "MiFEI",
                  style:
                      GoogleFonts.poppins(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
            Positioned(
              top: 80.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.5), width: 1.0),
                      color: Colors.white),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Color(0xff1D293F),
                        ),
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                      ),
                      Expanded(
                        child: SearchField(
                          hint: "Donde estoy",
                          maxSuggestionsInViewPort: 6,
                          onTap: (estoy) {
                            setState(() {
                              _dondeEstoy = estoy;
                              DondeEstoy.listaDondeEstoy.forEach((element) {
                                if (_dondeEstoy == element.name) {
                                  imagenDondeEstoy = element.image;
                                  print(imagenDondeEstoy);
                                }
                              });
                            });
                          },
                          suggestions: arregloDondeEstoy,
                        ),
                      ),
                      Expanded(
                        child: SearchField(
                          hint: "Donde voy",
                          maxSuggestionsInViewPort: 6,
                          onTap: (voy) {
                            setState(() {
                              _dondeVoy = voy;
                              DondeVoy.listaDondeVoy.forEach((element) {
                                if (_dondeVoy == element.name) {
                                  imagenDondeVoy = element.image;
                                  print(imagenDondeVoy);
                                }
                              });
                            });
                          },
                          suggestions: arregloDondeVoy,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: 130,
                right: 0,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Icon(
                    Icons.wb_cloudy,
                    color: Color(0xff274979),
                  ),
                )),
            Positioned(
                // -> BOTON QUE NO JALA
                top: 170,
                right: 0,
                
                child: TextButton(
                  onPressed: () {
                    Ruta.listaRuta.forEach((element) {
                      if ((_dondeEstoy == element.rutaEstoy) &&
                          (_dondeVoy == element.rutaVoy)) {
                        rutaFinal = element.image;
                        print(rutaFinal);
                      }
                    });
                    setState(() {
                    });
                  },
                  child: Icon(
                    Icons.search,
                    color: Color(0xff274979),
                  ),
                )),
                Positioned(
                  right: 0,
                  top: 210,
                  child: TextButton(
                    onPressed: (() {
                      _showTextInputDialog(context);
                    }),
                    child: Icon(
                      Icons.add,
                      color: Color(0xff274979),
                    ),
                  )
                ),
            SizedBox(
              height: 2,
            ),
            Positioned(
                top: 280,
                left: 5,
                width: 380,
                height: 300,
                child: Container(
                    decoration: BoxDecoration(
                  image: DecorationImage(
                    //image: AssetImage('assets/images/mapa.jpeg'),
                    image: AssetImage(rutaFinal),
                    fit: BoxFit.contain,
                  ),
                ))),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 55.0,
        backgroundColor: Color(0xffffffff),
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
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text("Pantalla de home"),
                  );
                });
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
  Future openDialog() => showDialog(
    context: context,
    builder: (context) =>AlertDialog(
      title: Text('Nueva Ruta'),
      content: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Donde estoy'),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Donde voy'
            ),
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            
          },
          child: Text('Crear')
        )
      ],
    )
  );
  final _textFieldControllerDondeEstoy = TextEditingController();
  final _textFieldControllerDondeVoy = TextEditingController();
  Future<String?> _showTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            title: Text(
              'Nueva Ruta',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w300
                ),
                controller: _textFieldControllerDondeEstoy,
                decoration: const InputDecoration(hintText: "Donde estoy"),
                ),
                TextField(
                  style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w300
                ),
                controller: _textFieldControllerDondeVoy,
                decoration: const InputDecoration(hintText: "Donde voy"),
                ),
              ],
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
                  'Crear',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500
                  ),
                ),
                onPressed: () => {
                  print(_textFieldControllerDondeVoy.text + _textFieldControllerDondeEstoy.text)
                },
              ),
            ],
          );
        });
  }
}

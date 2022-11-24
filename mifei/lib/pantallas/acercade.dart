import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mifei/pantallas/slideItem.dart';
import 'package:mifei/pantallas/slider.dart';

class Acercade extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('MiFEI'),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
          titleTextStyle: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
              // TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          backgroundColor: Color(0xff274979),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: <Widget>[
              Expanded(
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemCount: slideList.length,
                  itemBuilder: ((context, i) => SlideItem(i)),
                ),
              ),
              Text('Version 1.00',
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 8
                ),
              ),
              Text('Derechos reservados UV-FEI©',
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 8
                ),
              )
            ]
          )
        )
      );
  }
}
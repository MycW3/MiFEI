import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mifei/pantallas/slider.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 150,
          ),
          Container(
            width: 200,
            height: 250,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(slideList[index].imageurl),
                    fit: BoxFit.cover)),
          ),
          Text(
            slideList[index].titulo,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 30,
              color: Color(0xff274979),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(slideList[index].descripcion,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: Colors.black,
              )),
        ]);
  }
}

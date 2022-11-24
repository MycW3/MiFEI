import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mifei/pantallas/Theme.dart' as Theme;

class noticiaInformacion extends StatefulWidget{
  const noticiaInformacion({Key? key}) : super(key:key);

  State<noticiaInformacion> createState() => _noticiaInformacion();
}

class _noticiaInformacion extends State<noticiaInformacion>{

    String lorem = '''
      Lorem ipsum dolor sit amet consectetur, adipisicing elit. Repellat obcaecati quasi voluptas, porro unde exercitationem ea odio? Et possimus voluptatem itaque blanditiis praesentium quam adipisci, cum vel aliquid expedita molestiae. Ullam pariatur exercitationem voluptatum amet debitis, laboriosam, quae odio, ratione illo expedita ab distinctio architecto quis recusandae explicabo obcaecati autem error eveniet numquam officiis? Enim fugiat voluptatibus voluptatum sit aliquid!
      Ut reiciendis, minus temporibus earum placeat suscipit quo delectus, aperiam fuga pariatur autem similique porro optio facilis obcaecati. Maxime id asperiores debitis molestias praesentium accusamus? Necessitatibus nihil natus fuga similique.
      Ad assumenda, laudantium officiis adipisci neque eum ipsa! Non deserunt suscipit saepe aperiam iusto cum quaerat exercitationem aliquam maxime harum, alias ea, eum quasi inventore libero. Nostrum mollitia quibusdam dolores! Laboriosam unde voluptatem corrupti repudiandae quam facere eveniet impedit rem sunt eum, autem provident animi perferendis laudantium illo rerum, quis molestias ea dicta exercitationem odio at minus! Quae, delectus dolorum?
      Aut enim minus pariatur tempora cumque labore! Ullam velit fuga corrupti laboriosam laudantium cupiditate ipsa quisquam magnam. Quisquam, at! Nemo temporibus dolorem perspiciatis quo tenetur! Dolor optio earum enim id?Incidunt, alias voluptatum quae dolore, quam doloremque, dolorum eveniet commodi impedit aut ad deleniti! Explicabo asperiores dolorum excepturi dolore dicta dolores, incidunt veritatis dolorem, ea sequi odio ipsa harum provident! Necessitatibus quasi nesciunt, voluptas quaerat repudiandae impedit? Dolorum saepe quidem deleniti obcaecati molestias! Eius, ut expedita aliquid repudiandae iste itaque enim repellat hic ratione cum nostrum ad atque saepe labore.
      ''';

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Información',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff232c51),
      ),
      backgroundColor: Color(0xff232c51),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 120, 
                  height: 120, 
                  child: avatarPerfil()
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'FeedBot',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 42,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'Milkyway Galaxey',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                new Container(
                  color: const Color(0xFF00C6FF),
                  width: 35.0,
                  height: 1.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0)
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Icon(
                      Icons.location_on, size: 14.0,
                      color: Colors.white
                    ),
                    new Container(
                      width: 2,
                    ),
                    new Text(
                      'New York',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 13
                      )
                    ),
                    new Container(
                      width: 24.0
                    ),
                    new Icon(
                      Icons.calendar_month_rounded,
                      size: 14.0,
                      color: Colors.white,
                    ),
                    new Container(
                      width: 4,
                    ),
                    new Text(
                      '20-10-2022',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 13
                      )
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'OVERVIEW',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                      )
                    )
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        new Container(
                          color: const Color(0xFF00C6FF),
                          width: 70.0,
                          height: 1.0,
                          margin: const EdgeInsets.symmetric(vertical: 8.0)
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: new EdgeInsets.only(right: 30, left: 30),
                  child: Text(
                    lorem,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 11
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget avatarPerfil() => CircleAvatar(
    radius: 144 / 2,
    backgroundColor: Colors.grey.shade800,
    backgroundImage: AssetImage("assets/images/avatar.jpeg"),
  );
}
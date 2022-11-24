import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mifei/pantallas/Theme.dart' as Theme;
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mifei/pantallas/noticiaInformacion.dart';

// <<- HOME-PAGE ->>
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => new _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new PlanetList(),
      ],
    );
  }
}

// <<- PLANET-LIST ->>
class PlanetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Flexible(
      child: new Container(
        color: Color(0xff232c51),
        child: new ListView.builder(
          itemExtent: 160.0,
          itemCount: PlanetDao.planets.length,
          itemBuilder: (_, index) => new PlanetRow(PlanetDao.planets[index]),
        ),
      ),
    );
  }
}

// <<- PLANET ->>
class Planet {
  final String id;
  final String name;
  final String location;
  final String distance;
  final String gravity;
  final String description;
  final String image;


  const Planet({required this.id, required this.name, required this.location, required this.distance, required this.gravity,
    required this.description, required this.image});
}

// <<- PLANET-DAO ->>
class PlanetDao {

  static final List<Planet> planets = [
    const Planet(
      id: "1",
      name: "user",
      location: "Milkyway",
      distance: "New York",
      gravity: "20-10-2022",
      description: "Lorem ipsum...",
      image: "assets/images/avatar.jpeg",
    ),
    const Planet(
      id: "2",
      name: "user",
      location: "Milkyway",
      distance: "New York",
      gravity: "20-10-2022",
      description: "Lorem ipsum...",
      image: "assets/images/avatar.jpeg",
    ),
    const Planet(
      id: "3",
      name: "user",
      location: "Milkyway",
      distance: "New York",
      gravity: "20-10-2022",
      description: "Lorem ipsum...",
      image: "assets/images/avatar.jpeg",
    ),
    const Planet(
      id: "4",
      name: "user",
      location: "Milkyway",
      distance: "New York",
      gravity: "20-10-2022",
      description: "Lorem ipsum...",
      image: "assets/images/avatar.jpeg",
    ),
    const Planet(
      id: "5",
      name: "user",
      location: "Milkyway",
      distance: "New York",
      gravity: "20-10-2022",
      description: "Lorem ipsum...",
      image: "assets/images/avatar.jpeg",
    ),
  ];

  static Planet getPlanetById(id) {
    return planets
        .where((p) => p.id == id)
        .first;
  }
}

// <<- PLANET-DETAIL-PAGE ->>
class PlanetDetailPage extends StatelessWidget {

  final Planet planet;

  PlanetDetailPage(String id) :
    planet = PlanetDao.getPlanetById(id);



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new PlanetDetailBody(planet),
        ],
      ),
    );
  }
}

// <<- PLANET-DETAIL-BODY ->>
class PlanetDetailBody extends StatelessWidget {
  final Planet planet;

  PlanetDetailBody(this.planet);

  Widget avatarPerfil() => CircleAvatar(
      radius: 144 / 2,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: AssetImage(planet.image),
    );

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Container(
          color: Color(0xff274979),
          child: new Center(
            child: new Hero(
              tag: 'planet-icon-${planet.id}',
              child: new Image(
                image: new AssetImage(planet.image),
                height: Theme.Dimens.planetHeight,
                width: Theme.Dimens.planetWidth,
              ),
            ),
          ),
        ),
      ]
    );
  }
}
// <<- PLANET-ROW ->>
class PlanetRow extends StatelessWidget {

  final Planet planet;

  PlanetRow(this.planet);

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = new Container(
      alignment: new FractionalOffset(0.0, 0.5),
      margin: const EdgeInsets.only(left: 24.0),
      child: new Hero(
        tag: 'planet-icon-${planet.id}',
        child: new Container(
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: new AssetImage(
                planet.image
              )
            )
          ),
          height: Theme.Dimens.planetHeight,
          width: Theme.Dimens.planetWidth,
        ),
      ),
    );

    final planetCard = new Container(
      margin: const EdgeInsets.only(left: 72.0, right: 24.0),
      decoration: new BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(color: Colors.black,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0))
        ],
      ),
      child: new Container(
        margin: const EdgeInsets.only(top: 16.0, left: 72.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(planet.name, 
              style: GoogleFonts.poppins(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w600,
                fontSize: 24.0
              )
            ),
            new Text(planet.location, 
              style: GoogleFonts.poppins(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w400,
                fontSize: 12.0
              )
            ),
            new Container(
              color: const Color(0xFF00C6FF),
              width: 24.0,
              height: 1.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0)
            ),
            new Row(
              children: <Widget>[
                new Icon(Icons.location_on, size: 14.0,
                  color: Theme.Colors.planetDistance),
                new Text(
                  planet.distance,
                  style: GoogleFonts.poppins(
                    color: Color.fromARGB(102, 0, 0, 0),
                    fontSize: 12
                  )
                ),
                new Container(width: 24.0),
                new Icon(
                  Icons.calendar_month_rounded,
                  size: 14.0,
                  color: Theme.Colors.planetDistance,
                ),
                new Container(
                  width: 2,
                ),
                new Text(
                  planet.gravity,
                  style: GoogleFonts.poppins(
                    color: Color.fromARGB(102, 0, 0, 0),
                    fontSize: 12
                  )
                ),
              ],
            )
          ],
        ),
      ),
    );

    return new Container(
      height: 120.0,
      margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => noticiaInformacion())
          );
        },//=> _navigateTo(context, planet.id),
        child: new Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail,
          ],
        ),
      ),
    );
  }

  // _navigateTo(context, String id) {
  //   Routes.navigateTo(
  //     context,
  //     '/detail/${planet.id}',
  //     transition: TransitionType.fadeIn
  //   );
  //}
}
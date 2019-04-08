import 'package:flutter/material.dart';

class Options extends StatefulWidget {
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
            Colors.green[200],
            Colors.green[400],
            Colors.green[600],
            Colors.green[800],
            Colors.green[900]
          ], tileMode: TileMode.clamp, center: Alignment.center, radius: 1.5),
        ),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0 , bottom: 10.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'SOLITAIRE',
                  style: TextStyle(
                      fontSize: 70.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
              ),
            ),
            _optionCards('K', 'londike', 'assets/menu.png' , 5.0 , '/klondike'),
            _optionCards('S', 'pider', 'assets/menu.png' , 50.0 , '/spider'),
            _optionCards('I', 'nvert', 'assets/menu.png', 50.0, '/invert'),
            Container(
              margin: EdgeInsets.all(10.0),
              width: double.infinity,
              height: 200.0,
              child: Center(
                  child: new Text(
                'More modes coming soon!',
                style: TextStyle(color: Colors.black, fontSize: 20.0 , fontWeight: FontWeight.bold),
              )),
              decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.black)),
            ),
           SizedBox(
             height: 100,
           ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FlatButton(
                  color: Colors.black,
                  child: Text(
                    'Rules',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w300),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/rule');
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _optionCards(String firstLetter, String restName, String imgPath , double rightMargin , String pathName) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, pathName);
      },
      child: Card(
        color: Colors.transparent,
        borderOnForeground: true,
        // shape: Border.all(width: 2.0 , color: Colors.black),
        margin: EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          height: 200.0,
          decoration: ShapeDecoration(
              shape: Border.all(
                width: 5.0,
                color: Colors.blue[900],
              ),
              shadows: [
                BoxShadow(
                  color: Colors.green[200],
                  offset: Offset(-200.0, 0.0),
                  blurRadius: 200.0,
                )
                // spreadRadius: .10)
              ]),
          child: Stack(
            children: <Widget>[
              Container(
                width: 450.0,
                height: 250.0,
                child: ClipPath(
                  clipper: PhotoClipper(),
                  child: Image.asset(
                    imgPath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 200.0),
              Positioned(
                left: 150.0,
                bottom: 2.0,
                child: Text(
                  firstLetter,
                  style: TextStyle(
                      fontSize: 100.0,
                      color: Colors.red,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Positioned(
                right: rightMargin,
                bottom: 25.0,
                child: Text(
                  restName,
                  style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PhotoClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


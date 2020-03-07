import 'dart:async';
import 'package:daticloud/screens/welcomePage.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  void navigationPage() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
  }

  startTime() async {
    var _duration = new Duration(seconds: 6);
    return new Timer(_duration, navigationPage);
  }

  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;

  @override
  void initState() {
    super.initState();
    _fontSizeAnimationController =
        new AnimationController(duration: Duration(seconds: 3), vsync: this);
    _fontSizeAnimation = new CurvedAnimation(
        parent: _fontSizeAnimationController, curve: Curves.bounceOut);
    _fontSizeAnimation.addListener(() => setState(() {}));
    _fontSizeAnimationController.forward();
    startTime();
  }

  @override
  void dispose() {
    _fontSizeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.mail,
                size: _fontSizeAnimation.value * 50,
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "DatiMail",
              style: TextStyle(
                  fontSize: _fontSizeAnimation.value * 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontFamily: 'Montserrat'),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: MediaQuery.of(context).size.height /5,
              width: MediaQuery.of(context).size.width /5,
              child: Image.asset('images/30.gif')
            ),
          ],
        ),
      ),
    );
  }
}

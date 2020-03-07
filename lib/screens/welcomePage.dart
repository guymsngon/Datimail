import 'dart:io';
import 'package:flutter/material.dart';
import 'addaccount.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  var chaine1 = 20.0;
  var chaine2 = 5.0;
  var sizeimage = 50.0;

  Future<bool> _willPopScope() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: <Widget>[
              FlatButton(
                child: Text('Yes'),
                onPressed: () => exit(0),
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              )
            ],
            title: Text('Exit'),
            content: Text(' Do you want to exit the application ?'),
          );
        })??false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopScope,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Spacer(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 140.0,
                    width: 140.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('images/logo.png'),
                      fit: BoxFit.cover,
                    )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(' New from Datimail',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            children: <Widget>[
                              Text(
                                'All your favorite features ',
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                              Text(
                                'in a new interface',
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddAccount()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    child: Center(
                      child: Text(
                        'OK',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

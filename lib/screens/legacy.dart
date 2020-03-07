import 'package:daticloud/screens/setting.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Legacy extends StatefulWidget {
  @override
  _LegacyState createState() => _LegacyState();
}

class _LegacyState extends State<Legacy> {
  // Future<void> _showLegacy() async {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         var legacy = 'contenu du net';
  //         return AlertDialog(
  //           actions: <Widget>[
  //             FlatButton(
  //                 onPressed: () => Navigator.pop(context),
  //                 child: Text('close'))
  //           ],
  //           content: Container(
  //             child: Text(legacy.toString()),
  //           ),
  //         );
  //       });
  // }

  // _takeLegacyRequest()async{
  //   String url = 'https://app.termly.io/document/terms-of-use-for-saas/9697da89-93b4-427a-ad5b-d41243fe5436',
  // }
  void customLaunch(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/logo.png'),
                    fit: BoxFit.cover,
                  )),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Text('Guym\'s Ngon',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('images/avatar.png'),
                            fit: BoxFit.cover,
                          )),
                        ),
                        Text('guymartin@datimail.com',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40.0, left: 10.0, right: 10.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                          text: 'The ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Datimail Terms of Use',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    customLaunch(
                                        'https://app.termly.io/document/terms-of-use-for-saas/9697da89-93b4-427a-ad5b-d41243fe5436');
                                  },
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        ' tells you what to expect when you use our services. By clicking on "I accept", you accept these conditions.',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  )
                                ])
                          ]),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Consult the ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Confidentiality rules ',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    customLaunch(
                                        'https://app.termly.io/document/privacy-policy/6957bc16-55f2-427c-8e66-64d1d4c387a9');
                                  },
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        ' from Daticloud to find out how we process general information when you use our services. You can access your Datimail account (account.datimail.com) at any time to carry out a Confidentiality check-up or modify the confidentiality parameters.',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  )
                                ])
                          ]),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40.0, left: 12.0, right: 10.0),
                child: Row(
                  children: <Widget>[
                    Text(''),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingLogin()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                        child: Center(
                          child: Text(
                            'I accept',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:daticloud/screens/home.dart';
import 'package:flutter/material.dart';

import 'openaccount.dart';

class SettingLogin extends StatefulWidget {
  @override
  _SettingLoginState createState() => _SettingLoginState();
}

class _SettingLoginState extends State<SettingLogin> {
  Future<bool> _restore() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: <Widget>[
              FlatButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage(title: 'principale',)));
                },
              ),
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text('No'),
              )
            ],
            title: Text('Restore'),
            content: Text('you going to restore your account settings '),
          );
        });
  }

  bool _isbackup = false;
  bool _isrestore = false;
  String content = 'Accept';

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
            margin: EdgeInsets.only(left: 12.0, right: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/logo.png'),
                    fit: BoxFit.cover,
                  )),
                ),
                Text('Datimail Services',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                  'guymartin@datimail.com',
                  style: TextStyle(
                    fontSize: 15.0,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: RichText(
                    text: TextSpan(
                        text:
                            'Tap to learn more about each service, such as how to turn it on and off later. The data are used in accordance with  ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Confidentiality rules ',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' of Datimail.',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )
                              ])
                        ]),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  'Backup and storage',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                Divider(
                  color: Colors.blueGrey,
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.cloud_upload,
                              color: Colors.blueGrey,
                            ),
                            Text(
                              '  Save on Daticloud  ',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Switch(
                          onChanged: (val) => setState(() => _isbackup = val),
                          value: _isbackup,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.settings_backup_restore,
                              color: Colors.blueGrey,
                            ),
                            Text(
                              '  restore your configuration  ',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Switch(
                          onChanged: (val) => setState(() {
                            _isrestore = val;
                          }),
                          value: _isrestore,
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: Colors.blueGrey,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Press "Accept" to confirm the selection of these parameters relating to Datimail services. ',
                  style: TextStyle(
                    fontSize: 15.0,
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
                          print(_isrestore);
                          if (_isrestore) {
                            _restore();
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Openaccount()));
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                          ),
                          child: Center(
                            child: Text(
                              'Accept',
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
            )),
      ),
    );
  }
}

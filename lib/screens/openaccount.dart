import 'package:daticloud/screens/home.dart';
import 'package:daticloud/screens/loginId.dart';
import 'package:flutter/material.dart';

class Openaccount extends StatefulWidget {
  @override
  _OpenaccountState createState() => _OpenaccountState();
}

class _OpenaccountState extends State<Openaccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 20,
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  Text('You can now add all of your email addresses. ',
                      style: TextStyle(
                        fontSize: 15.0,
                      )),
                  InkWell(
                    onTap: () {},
                    child: Text('Find out more',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        )),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.blueGrey,
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage(title: 'principale',)));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      Column(
                        children: <Widget>[
                          Text('   Ngon Guy Martin',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              )),
                          Text('   guymartin@datimail.com',
                              style: TextStyle(
                                fontSize: 13.0,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      size: 40.0,
                      color: Colors.blueGrey,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Loginid()));
                      },
                      child: Text('   Add an email address',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage(title: 'principale',)));
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
                    'Access Datimail',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

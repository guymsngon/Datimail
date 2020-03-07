import 'package:daticloud/screens/loginpwd.dart';
import 'package:flutter/material.dart';

class Loginid extends StatefulWidget {
  @override
  _LoginidState createState() => _LoginidState();
}

class _LoginidState extends State<Loginid> {
  final TextEditingController _loginControler =
      TextEditingController(text: 'guymartin@gmail.com');
  final _formkey = GlobalKey<FormState>();
  bool _autovalidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            autovalidate: _autovalidate,
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    height: 150.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('images/logo.png'),
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: 75.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(0.0)),
                    ),
                    child: TextFormField(
                        controller: _loginControler,
                        keyboardType: TextInputType.emailAddress,
                        validator: (String arg) {
                          if (arg.isEmpty) {
                            return 'This field is required';
                          } else {
                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = new RegExp(pattern);
                            if (!regex.hasMatch(arg))
                              return 'Enter a valid email address';
                            else
                              return null;
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'email address',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person_outline,
                              size: 25, color: Colors.blueGrey),
                          hintText: 'Enter your email address',
                          hintStyle:
                              TextStyle(color: Colors.black45, fontSize: 15.0),
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      right: ((MediaQuery.of(context).size.width) -
                              (MediaQuery.of(context).size.width / 1.1)) /
                          2,
                      top: MediaQuery.of(context).size.height / 10.0,
                      bottom: 5.0,
                      left: ((MediaQuery.of(context).size.width) -
                              (MediaQuery.of(context).size.width / 1.1)) /
                          2),
                  child: Row(
                    children: <Widget>[
                      Text('Created account ?',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.blue,
                          )),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          if (_formkey.currentState.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Loginpwd()));
                          } else {
                            setState(() {
                              _autovalidate = true;
                            });
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
                              'Next',
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
      ),
    );
  }
}

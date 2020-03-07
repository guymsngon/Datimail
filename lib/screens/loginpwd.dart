import 'package:daticloud/screens/legacy.dart';
import 'package:flutter/material.dart';

class Loginpwd extends StatefulWidget {
  @override
  _LoginpwdState createState() => _LoginpwdState();
}

class _LoginpwdState extends State<Loginpwd> {
  final passwordControler = TextEditingController(text: 'guymartin');
  final _formkey = GlobalKey<FormState>();
  bool _autovlidate = false;

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
            autovalidate: _autovlidate,
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
                        controller: passwordControler,
                        keyboardType: TextInputType.text,
                        validator: (String arg) {
                          if (arg.isEmpty) {
                            return 'This field is required';
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'password',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock,
                              size: 25, color: Colors.blueGrey),
                          hintText: 'enter your password',
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
                      Text('Forgotten password ?',
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
                                    builder: (context) => Legacy()));
                          } else {
                            setState(() {
                              _autovlidate = true;
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

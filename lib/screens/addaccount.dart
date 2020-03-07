import 'package:daticloud/screens/loginId.dart';
import 'package:flutter/material.dart';

class AddAccount extends StatefulWidget {
  @override
  _AddAccountState createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue ,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/20,),
            child: Center(
              child: Column( 
                children: <Widget>[
                  Text(
                    'You can now add all of your email addresses.',
                    style: TextStyle(
                      fontSize: 15.0,
                    )
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: Text(
                      'Find out more',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      )
                    ),
                  ),
                ], 
              ),
            ),
          ),
          Divider(
            color: Colors.blueGrey,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.add,
                  size: 40.0,
                  color: Colors.blueGrey,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:
                      (context) => Loginid(
                        
                      )
                    ));
                  },
                  child: Text(
                    '   Add an email address',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blue,
                    )
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                child: Center(
                  child: Text(
                    'Access Datimail',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize:25.0,
                      fontWeight: FontWeight.w500
                    ),
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
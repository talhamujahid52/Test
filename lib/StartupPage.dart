import 'dart:math';
import 'package:flutter/material.dart';

class startup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Color(0xFFE7EBEF),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Image.asset("images/org.jpg"),
                  width: 350.0,
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 30.0, 10.0),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(65.0, 10.0, 30.0, 10.0),
                  child: Text(
                    'All your organizations at one place',
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                      color: Color(0xFF5C656B),
                      fontSize: 30.0,
                      letterSpacing: 0.25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(65.0, 10.0, 40.0, 10.0),
                  child: Text(
                    'Share your views & issues with your co-workers & management',
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                      color: Color(0xFF5C656B),
                      fontSize: 18.0,
                      letterSpacing: 0.5,
                    ),
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: 330.0,
                  height: 60.0,
                  child: RaisedButton(
                    color: Colors.blue[900],
                    textColor: Colors.white,
                    child: Text('Login'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/first');
                      print('You tapped on RaisedButton');
                    },
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: 330.0,
                  height: 60.0,
                  child: RaisedButton(
                    color: Colors.white,
                    textColor: Color(0xFF5C656B),
                    child: Text('Sign up'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/second');
                      print('You tapped on RaisedButton');
                    },
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

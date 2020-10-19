import 'package:flutter/material.dart';

class joinorganization extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFE7EBEF),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                  child: Text(
                    'Join Organization',
                    style: TextStyle(
                      fontFamily: 'RobotoMono',
                      color: Color(0xFF5C656B),
                      fontSize: 30.0,
                      letterSpacing: 0.25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 150.0,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 30.0),
                  child: TextField(
                    decoration: new InputDecoration(
                      hintText: 'Enter Organization Code',
                      prefixIcon: const Icon(
                        Icons.group_add,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 150.0,
                ),
                Container(
                  width: 330.0,
                  height: 60.0,
                  child: RaisedButton(
                    color: Colors.blue[900],
                    textColor: Colors.white,
                    child: Text('Join'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/sixth');
                      print('You tapped on RaisedButton');
                    },
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

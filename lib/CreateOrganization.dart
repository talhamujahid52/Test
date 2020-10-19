import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class createOrganization extends StatefulWidget {
  @override
  _createOrganizationState createState() => _createOrganizationState();
}

class _createOrganizationState extends State<createOrganization> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser logedinuser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        logedinuser = user;
        print(logedinuser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Create Organization',
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
                height: 50.0,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 30.0),
                child: TextField(
                  decoration: new InputDecoration(
                    hintText: 'Organization Name',
                    prefixIcon: IconButton(
                      icon: FaIcon(FontAwesomeIcons.city),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 30.0),
                child: TextField(
                  decoration: new InputDecoration(
                    hintText: 'Enter Field',
                    prefixIcon: IconButton(
                      icon: FaIcon(FontAwesomeIcons.search),
                    ),
                  ),
                ),
              ),
              /*Padding(
                padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 30.0),
                child: TextField(
                  decoration: new InputDecoration(
                    hintText: 'Anonymus Posting',
                    prefixIcon: IconButton(
                      icon: FaIcon(FontAwesomeIcons.male),
                    ),
                    suffix: new DropdownButton<String>(
                      items: <String>['Enable', 'Disable'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ),
                ),
              ),*/
              SizedBox(
                height: 50.0,
              ),
              Container(
                width: 330.0,
                height: 60.0,
                child: RaisedButton(
                  color: Colors.blue[900],
                  textColor: Colors.white,
                  child: Text('Generate Code'),
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
    );
  }
}

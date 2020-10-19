import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class addcomplaint extends StatefulWidget {
  @override
  _addcomplaintState createState() => _addcomplaintState();
}

class _addcomplaintState extends State<addcomplaint> {

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

  final _firestore = Firestore.instance;

  String organizationName;
  String title;
  String tag;
  String description;

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
                  'Add Complaint',
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
                height: 30.0,
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
                  onChanged: (value){
                    organizationName =value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 30.0),
                child: TextField(
                  decoration: new InputDecoration(
                    hintText: 'Title',
                    prefixIcon: IconButton(
                      icon: FaIcon(FontAwesomeIcons.heading),
                    ),
                  ),
                  onChanged: (value){
                    title = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 30.0),
                child: TextField(
                  decoration: new InputDecoration(
                    hintText: 'Tags',
                    prefixIcon: IconButton(
                      icon: FaIcon(FontAwesomeIcons.tags),
                    ),
                  ),
                  onChanged: (value){
                    tag = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 30.0),
                child: TextField(
                  decoration: new InputDecoration(
                    hintText: 'Description',
                    prefixIcon: IconButton(
                      icon: FaIcon(FontAwesomeIcons.audioDescription),
                    ),
                  ),
                  onChanged: (value){
                    description = value;
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
                  color: Colors.blue[900],
                  textColor: Colors.white,
                  child: Text('Add Complaint'),
                  onPressed: () {
                    showDialog(context: context, builder: (BuildContext ctx) {
                      return AlertDialog(
                        title: Text("Confirmation"),
                        content: Text("Are you sure you want to  add this?"),
                        actions: <Widget>[
                          FlatButton(child: Text("Cancel"), onPressed: () {Navigator.of(context).pop();},),
                          RaisedButton(child: Text("Confirm"), onPressed: () {
                            _firestore.collection('complaints').add(
                                {
                                  'author' : logedinuser.email,
                                  'Organization Name': organizationName,
                                  'Title' : title,
                                  'Tag' : tag,
                                  'Description' : description,
                                }
                            );
                            Navigator.pushNamed(context, '/sixth');
                            print('You tapped on RaisedButton');
                          },color: Colors.blue,)
                        ],
                      );
                    });
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



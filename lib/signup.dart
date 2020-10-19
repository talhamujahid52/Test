import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  final _auth = FirebaseAuth.instance;

  String name;
  String email;
  String password;
  String dateofbirth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7EBEF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    color: Color(0xFF5C656B),
                    fontSize: 40.0,
                    letterSpacing: 0.25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
                child: Text(
                  'Enter your email and password to get access to your account',
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    color: Color(0xFF5C656B),
                    fontSize: 20.0,
                    letterSpacing: 0.5,
                  ),
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
                child: TextField(
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Enter your Full Name',
                    labelText: 'Full Nname',
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {
                    name = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 30.0),
                child: TextField(
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Enter your Email',
                    labelText: 'Email',
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {
                    email = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 30.0),
                child: TextField(
                  obscureText: true,
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Enter your Password',
                    labelText: 'Password',
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 30.0),
                child: TextField(
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Date Of Birth',
                    labelText: 'D.O.B',
                    prefixIcon: const Icon(
                      Icons.date_range,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {
                    dateofbirth = value;
                  },
                ),
              ),
              Container(
                width: 330.0,
                height: 60.0,
                child: RaisedButton(
                  color: Colors.blue[900],
                  textColor: Colors.white,
                  child: Text('Create Account'),
                  onPressed: () async {
                    try {
                      final newuser = await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                      if (newuser != null) {
                        Navigator.pushNamed(context, '/sixth');
                      }
/*                    print(name);
                      print(email);
                      print(password);*/
                    } catch (e) {
                      print(e);
                    }
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

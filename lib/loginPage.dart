import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;


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
                  'Keep Connected',
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
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
                child: TextField(
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey),
                    ),
                    hintText: 'Enter your Email',
                    labelText: 'Email',
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value){
                    email = value ;
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
                    hintText: 'Enter your Password',
                    labelText: 'Password',
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                  ),
                  obscureText: true,
                  onChanged: (value){
                    password = value;
                  },
                ),
              ),
              SizedBox(
                height: 35.0,
              ),
              Container(
                width: 330.0,
                height: 60.0,
                child: RaisedButton(
                  color: Colors.blue[900],
                  textColor: Colors.white,
                  child: Text('Login'),
                  onPressed: () async{
                    try{
                    final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                    if(user != null){
                      Navigator.pushNamed(context, '/sixth');
                    }}
                    catch(e){
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






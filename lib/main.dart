import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'StartupPage.dart';
import 'signup.dart';
import 'JoinOrganization.dart';
import 'CreateOrganization.dart';
import 'AddComplaint.dart';
import 'newsFeed.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: startup(),
      routes: {
        '/startup': (context) => startup(),
        '/first': (context) => login(),
        '/second': (context) => signup(),
        '/third':  (context) => createOrganization(),
        '/fourth':  (context) => joinorganization(),
        '/fifth':  (context) =>  addcomplaint(),
        '/sixth':  (context) =>  MyHomePage(),
      },
    );
  }
}

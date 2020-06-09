import 'package:diplom/ui/pages/BasicProgramming.dart';
import 'package:diplom/ui/pages/DialogAutorization.dart';
import 'package:diplom/ui/pages/Home.dart';
import 'package:diplom/ui/pages/RoomStudent.dart';
import 'package:diplom/ui/pages/RoomTeacher.dart';
import 'package:diplom/ui/pages/Team.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(BuildContext context) => Home(),
        '/roomstudent':(BuildContext context) => RoomStudent(),
        '/roomteacher':(BuildContext context) => RoomTeacher(),
        '/basicprogramming':(BuildContext context) => BasicProgramming(),
        '/team':(BuildContext context) => Team(),
        '/dialoglogin':(BuildContext context) => DialogLogin(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}


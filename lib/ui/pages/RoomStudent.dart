import 'package:diplom/ui/widgets/myAppBar.dart';
import 'package:flutter/material.dart';

class RoomStudent extends StatefulWidget{
  @override
  _RoomStudentState createState() => _RoomStudentState();
}

class _RoomStudentState extends State<RoomStudent> {
  String _dropdownValue;
  List <String> _dropdownValues = ["Алгоритмы","Циклы","Методы"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  buildAppBar(context),
    );

  }
}
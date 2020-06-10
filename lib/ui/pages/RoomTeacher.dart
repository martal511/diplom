import 'package:diplom/ui/widgets/myAppBar.dart';
import 'package:flutter/material.dart';

class RoomTeacher extends StatefulWidget{
  @override
  _RoomTeacherState createState() => _RoomTeacherState();
}

class _RoomTeacherState extends State<RoomTeacher> {
  String _dropdownValue;
  List <String> _dropdownValues = ["Алгоритмы","Циклы","Методы"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  buildAppBar(context),
    );

  }
}
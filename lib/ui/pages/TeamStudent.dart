import 'package:diplom/ui/widgets/myAppBar.dart';
import 'package:flutter/material.dart';

class TeamStudent extends StatefulWidget{
  @override
  _TeamStudentState createState() => _TeamStudentState();
}

class _TeamStudentState extends State<TeamStudent> {
  @override
  Widget build(BuildContext context) {
    String _dropdownValue;
    List <String> _dropdownValues = ["Алгоритмы","Циклы","Методы"];
    return Scaffold(
      appBar: buildAppBar(context),
      body: Row(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            child: Text('ФОТО'),
          ),
          Text('Ученик'),
        ],
      ),
    );

  }
}
import 'package:diplom/ui/widgets/myAppBar.dart';
import 'package:flutter/material.dart';

class TeamStudent extends StatefulWidget{
  @override
  _TeamStudentState createState() => _TeamStudentState();
}

class _TeamStudentState extends State<TeamStudent> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: buildAppBar(context),
      body: Row(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            child: Text('ФОТО ', style: Theme.of(context).textTheme.bodyText1,),
          ),
          Text('Ученик', ),
        ],
      ),
    );

  }
}
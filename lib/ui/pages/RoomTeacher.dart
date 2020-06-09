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
      appBar: AppBar(
        title: Container(
          height: 30,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(flex: 2,
                child: DropdownButton(
                    hint: Text('Основы программирования'),
                    elevation: 0,
                    value: _dropdownValue,
                    items: _dropdownValues.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Row(
                          children: <Widget>[
                            Text('${value}'),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (String value) {
                      _dropdownValues;
                    }),
              ),
              Expanded(
                child: RaisedButton(
                  child: Text("Команда"),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/team');
                  },
                ),
              ),
              Expanded(
                child: RaisedButton(
                  child: Text("Дом"),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/');
                  },
                ),
              ),
              Expanded(
                  child: RaisedButton(
                    child: Text("Моя комната"),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/dialoglogin');
                    },
                  )),
            ],
          ),
        ),
      ),
    );

  }
}
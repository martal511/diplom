import 'package:flutter/material.dart';

class TeamTeacher extends StatefulWidget{
  @override
  _TeamTeacherState createState() => _TeamTeacherState();
}

class _TeamTeacherState extends State<TeamTeacher> {
  @override
  Widget build(BuildContext context) {
    String _dropdownValue;
    List <String> _dropdownValues = ["Алгоритмы","Циклы","Методы"];
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
        body: Row(
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              child: Text('ФОТО'),
            ),
            Text('Преподаватель'),
          ],
        )
    );

  }
}
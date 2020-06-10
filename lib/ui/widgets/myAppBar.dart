import 'package:firebase/src/firestore.dart';
import 'package:flutter/material.dart';

import 'myDropdownButton.dart';

AppBar buildAppBar(BuildContext context, {DocumentSnapshot valueSnapshot}) {
  return AppBar(
    title: Container(
      height: 30,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: buildDropdownButton(context, valueSnapshot: valueSnapshot),
          ),
          Expanded(
            child: RaisedButton(
              child: Text("Команда"),
              onPressed: () {
                Navigator.of(context).pushNamed('/teamstudent');
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
  );
}

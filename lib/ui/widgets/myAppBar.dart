import 'package:diplom/ui/pages/Autorization.dart';
import 'package:firebase/src/firestore.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import 'myDropdownButton.dart';

AppBar buildAppBar(BuildContext context, {DocumentSnapshot valueSnapshot}) {
  return AppBar(
    actions: <Widget>[
      FlatButton(onPressed: () {
        Navigator.of(context).pushNamed("/profile");
      },
        child: Icon(Icons.account_circle),)
    ],
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
                  authService = new AuthService();
                  authService.checkIsSignedIn().then((_isSignedIn)  {
                    if (_isSignedIn) {
                      store.collection("users").doc(userFB.uid).get().then((
                          value) {
                        if (value.data() == null || value
                            .data()
                            .isEmpty) {
                          store.collection("users").doc(userFB.uid).set({
                            "name": userFB.displayName,
                            "phone": userFB.phoneNumber,
                            "email": userFB.email,
                            "role": "user"
                          }).then((value) =>
                              Navigator.pushNamed(context, '/newuserroom'));
                        } else {
                          userDataBase = value.data();
                          if (userDataBase["role"] == "teacher") {
                            Navigator.pushNamed(context, '/roomteacher');
                          } else if (userDataBase["role"] == "student") {
                            Navigator.pushNamed(context, '/roomstudent');
                          } else {
                            Navigator.pushNamed(context, '/newuserroom');
                          }
                        }
                      });
                    }
                    else {
                      Navigator.of(context).pushNamed('/dialoglogin');
                    }
                  });

                },
              )),
        ],
      ),
    ),
  );
}

import 'package:diplom/ui/widgets/myAppBar.dart';
import 'package:firebase/firestore.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class RoomTeacher extends StatefulWidget {
  @override
  _RoomTeacherState createState() => _RoomTeacherState();
}

class _RoomTeacherState extends State<RoomTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        height: 400,
        width: 800,
        margin: EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: studentsColumn(context),
            ),
            Expanded(
              child: classesColumn(context),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  Widget studentsColumn(BuildContext context) {
    return Container(
      height: 800,
      width: 400,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(" Ученики"),
          ),
          FlatButton(
            onPressed: () {
              showDialog(
                  context: context,
                  child: Dialog(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Введите email"),
                                ),
                                FlatButton(
                                    onPressed: () {
                                      
                                    }, child: Icon(Icons.search))
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                children: <Widget>[

                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ));
            },
            child: Text("Добавить"),
          ),
          FlatButton(
            onPressed: () {},
            child: Text("Показать занятия всех"),
          ),
          Expanded(
            child: Container(
              height: 300,
              child: StreamBuilder(
                stream: store
                    .collection("classes")
                    .where("teacher", "==", getUserId())
                    .onSnapshot,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    List<DocumentSnapshot> classesDataDocs = snapshot.data.docs;

                    return ListView.builder(
                        itemCount: classesDataDocs.length,
                        itemBuilder: (context, item) {
                          return Container(
                              height: 100,
                              child: Column(
                                children: <Widget>[
                                  Text("дата : " +
                                      classesDataDocs[item]
                                          .data()["data"]
                                          .toString()),
                                  Text("студент : " +
                                      classesDataDocs[item].data()["student"]),
                                  Text("тема : " +
                                      classesDataDocs[item]
                                          .data()["themeName"]),
                                ],
                              ));
                        });
                  } else {
                    return Container(
                      child: Text(" нет уроков"),
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget classesColumn(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(" Занятия"),
          ),
          FlatButton(
            onPressed: () {},
            child: Text("Показать все"),
          ),
          Expanded(
            child: Container(
              height: 300,
              child: StreamBuilder(
                stream: store
                    .collection("classes")
                    .where("teacher", "==", getUserId())
                    .onSnapshot,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    List<DocumentSnapshot> classesDataDocs = snapshot.data.docs;

                    return ListView.builder(
                        itemCount: classesDataDocs.length,
                        itemBuilder: (context, item) {
                          return Container(
                              height: 100,
                              child: Column(
                                children: <Widget>[
                                  Text("дата : " +
                                      classesDataDocs[item]
                                          .data()["data"]
                                          .toString()),
                                  Text("студент : " +
                                      classesDataDocs[item].data()["student"]),
                                  Text("тема : " +
                                      classesDataDocs[item]
                                          .data()["themeName"]),
                                ],
                              ));
                        });
                  } else {
                    return Container(
                      child: Text(" нет уроков"),
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:diplom/func/mydb.dart';
import 'package:diplom/ui/widgets/myAppBar.dart';
import 'package:diplom/ui/widgets/myDropdownButton.dart';
import 'package:firebase/firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data.dart';
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
      body: Center(child: Container(
        height: 1000,
        width:1500,
        color: Colors.yellowAccent[100],
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: studentsColumn(context),
            ),
            Expanded(
              child: classesColumn(context),
            ),
            Expanded(
              child: lectionColumn(context),
            ),
          ],
        ),
      ),)
    );
  }

  Widget studentsColumn(BuildContext context) {
    return Container(
      height: 1000,
      width: 500,
      child: Column(
        children: <Widget>[
          Container(
            child: Text(" Ученики", style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.indigo[900],
            ),),
            padding: EdgeInsets.all(20.0),

          ),
          FlatButton(
            onPressed: () {},
            child: Text("Показать занятия всех"),
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
                                    onPressed: () {}, child: Icon(Icons.search))
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                children: <Widget>[],
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

          Expanded(
            child: Container(
              height: 300,
              child: StreamBuilder(
                stream: store
                    .collection("users")
                    .where("role", "==", 'student')
                    .onSnapshot,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    List<DocumentSnapshot> studentsDataDocs = snapshot.data.docs;

                    return ListView.builder(
                        itemCount: studentsDataDocs.length,
                        itemBuilder: (context, item) {
                          return Container(
                              height: 100,
                              child: Column(
                                children: <Widget>[
                                  Text("Имя : " +
                                      studentsDataDocs[item]
                                          .data()["name"]
                                          .toString()),
                                  Text("e-mail : " +
                                      studentsDataDocs[item].data()["email"]),

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
      decoration: BoxDecoration( border: Border.all()),
      height: 1000,
      width:500,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(" Занятия", style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.indigo[900])
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Text("Показать все занятия"),
          ),
          FlatButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_context)  {

                    TextEditingController themeController = TextEditingController();
                    TextEditingController dateController = TextEditingController();
                    TextEditingController statusController = TextEditingController();
                    TextEditingController studentController = TextEditingController();
                    TextEditingController homeworkController = TextEditingController();


                    return Dialog(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 400,
                              height: 40,
                              padding: EdgeInsets.all(8),
                              child: Text("Добавление урока", textAlign: TextAlign.center, style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.indigo[900]
                              ),
                              ),
                            ),
                            Container(
                              width: 400,
                              height: 40,
                              padding: EdgeInsets.all(8),
                              child: buildDropdownStudentsButton(context),
                            ),
                            Container(
                              width: 400,
                              height: 40,
                              padding: EdgeInsets.all(8),
                              child: TextFormField(
                                controller: themeController,
                                decoration: InputDecoration(
                                    hintText: "Введите тему урока"),
                              ),
                            ),
                            Container(
                              width: 400,
                              height: 40,
                              padding: EdgeInsets.all(8),
                              child: TextFormField(
                                controller: dateController,
                                decoration: InputDecoration(
                                    hintText: "Введите дату урока"),
                              ),
                            ),
                            Container(
                              width: 400,
                              height: 40,
                              padding: EdgeInsets.all(8),
                              child: TextFormField(
                                controller: statusController,
                                decoration: InputDecoration(
                                    hintText: "Введите статус урока"),
                              ),
                            ),
                            Container(
                              width: 400,
                              height: 40,
                              padding: EdgeInsets.all(8),
                              child: TextFormField(
                                controller: homeworkController,
                                decoration: InputDecoration(
                                    hintText: "Введите домашнее задание"),
                              ),
                            ),
                            FlatButton (onPressed: () {

                            if(choosenStudent != null) {
                              Map<String, dynamic> newProduct = {
                                "themeName": themeController.text,
                                "data": dateController.text,
                                "status": statusController.text,
                                "student":choosenStudent.id,
                                "dz": homeworkController.text,
                                "teacher": getUserId()
                              };

                              addNewDoc(_context, "classes", newProduct,
                                  whenDone: () {
                                  });
                            }

                            },
                            child: Text("Сохранить"),),

                            Expanded(
                              child: Container(
                                child: Column(
                                  children: <Widget>[],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );

                  });
            },
            child: Text("Добавить"),
          ),
          Expanded(
            child: Container(
              height:800,
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
                            margin: EdgeInsets.all(8.0),
                            padding: EdgeInsets.all(8.0),

                            decoration: BoxDecoration(border: Border.all()),
                              height: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text("Дата : " +
                                      classesDataDocs[item]
                                          .data()["data"]
                                          .toString()),
                                  Text("Студент : " +
                                      classesDataDocs[item].data()["student"]),
                                  Text("Тема : " +
                                      classesDataDocs[item]
                                          .data()["themeName"]),
                                  Text("Домашнее задание : " +
                                      classesDataDocs[item].data()["dz"]),
                                  Text("Статус урока : " +
                                      classesDataDocs[item]
                                          .data()["status"]),
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

  Widget lectionColumn(BuildContext context) {
    return Container(
        height: 1000,
        width: 500,
        child: Column(
        children: <Widget>[
        Container(

        )
        ]
        ),
    );

}
}

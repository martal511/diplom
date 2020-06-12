import 'package:diplom/func/mydb.dart';
import 'package:diplom/ui/widgets/myAppBar.dart';
import 'package:firebase/firestore.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class RoomStudent extends StatefulWidget {
  @override
  _RoomStudentState createState() => _RoomStudentState();
}

class _RoomStudentState extends State<RoomStudent> {
  String _dropdownValue;
  List <String> _dropdownValues = ["Алгоритмы", "Циклы", "Методы"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Center(child: Container(
          height: 1000,
          width:1500,
          color: Colors.yellowAccent[100],
          margin: EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: classesColumn(context),
              ),
              Expanded(
                child: studentsColumn(context),
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
            padding: EdgeInsets.all(20.0),
            child: Text("Итоги занятия ", style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w500,
              color: Colors.indigo[900],

            ),),

          ),
          FlatButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (_context)  {

                    TextEditingController userCommentController = TextEditingController();
                    TextEditingController dateController = TextEditingController();
                    TextEditingController homeWorkStudentController = TextEditingController();


                    return Dialog(
                      child: Container(
                        width: 1600,
                        height: 600,
                        padding: EdgeInsets.all(8),


                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 1500,
                              height: 100,
                              padding: EdgeInsets.all(8),
                              child: Text("Добавление итогов занятия", textAlign: TextAlign.center, style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.indigo[900]

                              ),

                              ),
                            ),

                            Container(
                              width: 1400,
                              height: 100,
                              padding: EdgeInsets.all(8),
                              child: TextFormField(
                                controller: userCommentController,
                                decoration: InputDecoration(
                                    hintText: "Напиши, что нового и интересного сегодня было на уроке. Что понравилось и запомнилось? Какие моменты остались непонятыми и наиболее трудными?"),
                              ),
                            ),

                            Container(
                              width: 1400,
                              height: 100,
                              padding: EdgeInsets.all(8),
                              child: TextFormField(
                                controller: dateController,
                                decoration: InputDecoration(
                                    hintText: "Введите дату урока"),
                              ),
                            ),

                            Container(
                              width: 1400,
                              height: 100,
                              padding: EdgeInsets.all(8),
                              child: TextFormField(
                                controller: homeWorkStudentController,
                                decoration: InputDecoration(
                                    hintText: "Ответ на домашнее задание"),
                              ),
                            ),
                            FlatButton (onPressed: () {
                              Map<String, dynamic> newProduct = {
                                "userComment" : userCommentController.text,
                                "data" : dateController.text,
                                "dsAnswer" : homeWorkStudentController.text,
                                "student":getUserId()

                              };

                              addNewDoc(_context, "classes", newProduct, whenDone: () {

                              });

                            },
                              child: Text("Сохранить",
                                  style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.yellow[900])
                              ),),
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
            child: Text("Добавить",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.yellow[900])
            ),
          ),




          Expanded(
            child: Container(
              height: 300,
              child: StreamBuilder(
                stream: store
                    .collection("classes")
                    .where("student", "==", getUserId())
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
                                  Text("Ответ : " +
                                      studentsDataDocs[item]
                                          .data()["userComment"]
                                          .toString()),
                                  Text("Выполнение домашнего задания : " +
                                      studentsDataDocs[item].data()["dsAnswer"]),

                                ],
                              ));
                        });
                  } else {
                    return Container(
                      child: Text(" нет ответов"),
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
            child: Text("Занятия", style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: Colors.indigo[900])
            ),
          ),


          Expanded(
            child: Container(
              height:800,
              child: StreamBuilder(
                stream: store
                    .collection("classes")
                    .where("student", "==", getUserId())
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
}

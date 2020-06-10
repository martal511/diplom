import 'package:diplom/ui/widgets/myAppBar.dart';
import 'package:firebase/firestore.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

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
      body: Container ( margin: EdgeInsets.all(20.0),
        child:  Row (children: <Widget>[
          Expanded(child:  classesColumn( context),),
          Expanded(child: null,),

        ],

        ) ,
      ),
    );

  }

 Widget classesColumn(BuildContext context) {
    return  Container(
      child:  Column( children: <Widget>[
        Container ( padding:  EdgeInsets.all(20.0), child:  Text ( " Ученики"),),
        FlatButton (onPressed: () {

        },
        child: Text("Показать всех"),),
        Expanded( child:
          StreamBuilder ( stream: store.collection("classes").where("teacher", "=", userFB.uid).onSnapshot,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
             if ( snapshot.hasData) {
               List<DocumentSnapshot> classesDataDocs = snapshot.data.docs;

              return ListView.builder(
                itemCount: classesDataDocs.length,
                  itemBuilder: ( context, item) {

                  return Container( child:
                    Column (
                      children: <Widget>[
                        Text( "дата : " + classesDataDocs[item].data()["data"] ),
                        Text( "студент : " + classesDataDocs[item].data()["student"] ),
                        Text( "тема : " + classesDataDocs[item].data()["themeName"] ),

                      ],
                    )
                  );

                  });

             } else {
               return Container ( child: Text( " нет уроков"),);
             }
            },)
          ,)

      ],),
    );


  }
}
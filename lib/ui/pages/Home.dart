import 'package:diplom/data.dart';
import 'package:diplom/main.dart';
import 'package:diplom/ui/widgets/myAppBar.dart';
import 'package:diplom/ui/widgets/myDropdownButton.dart';
import 'package:firebase/firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    store.collection("lections").onSnapshot.listen((event) {
      if (event.docs.isNotEmpty) {
        setState(() {
          lectionsDataDocs = event.docs;
        });
      }
    });
    store
        .collection("users")
        .where("role", "==", "student")
        .onSnapshot
        .listen((event) {
      if (event.docs.isNotEmpty) {
        setState(() {
          studentsAllDataDocs = event.docs;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Container(
            width: 2000,
            height: 1000,
            padding: EdgeInsets.all(40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(margin: EdgeInsets.all(20.00) , child: Image.asset("mainimage.png")),
                ),
                Expanded(
                  flex: 2,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(40.0),
                          child: Text(
                            "Обучение основам программирования",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.indigo[800],
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Добро пожаловать, дорогой Друг!\n\nМы находимся на сайте, на котором ты можешь познакомиться с основными понятиями программирования.\nА для желающих обучаться в нашем доме есть индивидуальные комнаты.",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.indigo[600],
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Программирование - это удивительная возможность воплотить свои идеи в жизнь.\nГлубоко внутри тебе уже известно, как создавать программы.\nТы Творец, а Код - твой помощник. И вы обязательно подружитесь! \n\nМечтай! Твори! Развивайся! ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.indigo[600],
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ]),
                ),
              ],
            )));
  }
}

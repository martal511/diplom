import 'package:diplom/main.dart';
import 'package:diplom/ui/widgets/myAppBar.dart';
import 'package:flutter/material.dart';

class NewUserRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: buildAppBar(context),
     body: Container(
       padding: EdgeInsets.all(20.0),
       child: Column ( children: <Widget> [
             Container     (
               child: Text("Здравствуй, " +  userDataBase['name'] + " У вас нет еще своей компанты в нашей школе,  что бы ее создать, нужно пройти полную регистрацию :") ,
             ),
              FlatButton ( child: Text ("Я учитель"),  onPressed: ( ) {

              },),
         FlatButton ( child: Text ("Я ученик"),  onPressed: ( ) {

         },)


       ]
       ),
     ),
   );
  }

}
import 'package:flutter/material.dart';

class DialogLogin extends StatefulWidget{
  @override
  _DialogLoginState createState() => _DialogLoginState();
}

class _DialogLoginState extends State<DialogLogin> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerEmail = TextEditingController();
    TextEditingController controllerPassword = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            AlertDialog(
              actions: <Widget>[
                Text('Введите свой E-mail'),
                TextFormField(controller: controllerEmail,),
                Text('Введите свой пароль'),
                TextFormField(controller: controllerPassword,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




//showDialog(context: context, builder: (BuildContext context){
//return AlertDialog(
//actions: <Widget>[
//Text('Введите свой E-mail'),
//TextFormField(controller: controllerEmail,),
//Text('Введите свой пароль'),
//TextFormField(controller: controllerPassword,),
//],
//);
//});
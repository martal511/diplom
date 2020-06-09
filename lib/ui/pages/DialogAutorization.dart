import 'package:flutter/material.dart';

class DialogLogin extends StatefulWidget {
  @override
  _DialogLoginState createState() => _DialogLoginState();
}

class _DialogLoginState extends State<DialogLogin> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerName = TextEditingController();
    TextEditingController controllerSuName = TextEditingController();
    TextEditingController controllerPassword = TextEditingController();
    final  _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Center(
        child: Container(
          child: new Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text('Введите имя'),
                TextFormField(
                  controller: controllerName,
                ),
                Text('Введите фимилию'),
                TextFormField(
                  controller: controllerSuName,
                ),
                Text('Введите секретное слово'),
                TextFormField(
                  controller: controllerPassword,
                ),
                Container(
                  height: 50,
                  child: Center(
                    child: RaisedButton(
                      child: Text('Войти'),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
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

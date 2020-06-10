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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
    );
  }

}

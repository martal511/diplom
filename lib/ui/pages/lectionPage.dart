import 'package:diplom/ui/widgets/myAppBar.dart';
import 'package:firebase/firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LectionPage extends StatefulWidget {
  DocumentSnapshot lectionData;
  LectionPage({this.lectionData});
  @override
  _LectionPageState createState() => _LectionPageState();
}

class _LectionPageState extends State<LectionPage> {
  Map<String, dynamic> lectionMap;



  @override
  void initState() {
    lectionMap = widget.lectionData.data();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: buildAppBar(context, valueSnapshot: widget.lectionData), backgroundColor:  Colors.yellowAccent[100],
      body:
      Container(
        padding: EdgeInsets.all(20),
        child: ListView (
          children: <Widget>[
            Container( padding: EdgeInsets.all(10.0),
              child: Text(lectionMap['title'], textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.indigo[800],
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                      ),
              ),),
            Container( padding: EdgeInsets.all(5.0),
              child: Text(lectionMap['text'], textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.indigo,
                ),
              ),),
            Container(padding: EdgeInsets.all(5.0),
             height: 300,
              width: 400,
              child:Image.network(lectionMap['photoURL']
              ),),
            Container( padding: EdgeInsets.all(5.0),
              child: Text(lectionMap['question'], textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.indigo,
                ),
              ),),




          ],
        ),
      )

      , );
  }
}

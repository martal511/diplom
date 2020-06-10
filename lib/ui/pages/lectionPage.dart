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
    return Scaffold( appBar: buildAppBar(context),  body:
      Container(
        padding: EdgeInsets.all(20),
        child: ListView (
          children: <Widget>[
            Container( padding: EdgeInsets.all(20.0),
              child: Text(lectionMap['title'], textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline3,
              ),),
            Container (
              height: 200,
              width: 300,
              color: Colors.red,
//              decoration: BoxDecoration( image: DecorationImage( )),
              margin: EdgeInsets.all(20.0),),

            Container( padding: EdgeInsets.all(10.0),
              child: Text(lectionMap['text'], textAlign: TextAlign.center,
              ),)

          ],
        ),
      )

      , );
  }
}
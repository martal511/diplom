import 'package:diplom/themes/custom_theme.dart';
import 'package:diplom/themes/themes.dart';
import 'package:diplom/ui/pages/BasicProgramming.dart';
import 'package:diplom/ui/pages/Autorization.dart';
import 'package:diplom/ui/pages/EditProfilePage.dart';
import 'package:diplom/ui/pages/Home.dart';
import 'package:diplom/ui/pages/ProfilePage.dart';
import 'package:diplom/ui/pages/RoomStudent.dart';
import 'package:diplom/ui/pages/RoomTeacher.dart';
import 'package:diplom/ui/pages/TeamStudent.dart';
import 'package:diplom/ui/pages/TeamTeacher.dart';
import 'package:diplom/ui/pages/newUserRoom.dart';
import 'package:diplom/ui/pages/registration.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';


AuthService authService;
bool blIsSignedIn = false;
Firestore store = firestore();
bool isDarkTheme = false;

SharedPreferences prefs;
Map <String, dynamic> curUser;
Map <String, dynamic> userData;
Map <String, dynamic> userDataBase;
User userFB;

bool isReleaseVersion = false; //ПОСТАВИТЬ true перед деплоем, проверять всегда
String debagUserID = "ZyKR4wmcOGYZGAwIzqjoMlrbuUa2";
String getUserId () {
  return isReleaseVersion? userFB.uid: debagUserID;
}



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance().then((value) {
    prefs = value;
    if (prefs != null && prefs.get("isDarkTeme")!= null) {
      isDarkTheme = prefs.get("isDarkTeme");
    }
    if  (prefs != null && prefs.get("userDataList")!= null)
    {
      List <dynamic> userDataList = prefs.get("userDataList");
      curUser = {
        "id": userDataList[0],
        "api_token":     userDataList[1],
        "name" : userDataList[2],
        "phoneNumber" : userDataList[3],
        "role" : userDataList[4],
      };
      userData = curUser;
    } else {
    }
  });

  isDarkTheme = isDarkTheme == null? false : isDarkTheme;
  initializeDateFormatting().then((_) => runApp(
    CustomTheme(
      initialThemeKey: isDarkTheme? MyThemeKeys.DARKFC : MyThemeKeys.LIGHTFC,
      child: MyApp(),
    ),
  ));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(BuildContext context) => Home(),
        '/roomstudent':(BuildContext context) => RoomStudent(),
        '/roomteacher':(BuildContext context) => RoomTeacher(),
        '/basicprogramming':(BuildContext context) => BasicProgramming(),
        '/teamteacher':(BuildContext context) => TeamTeacher(),
        '/teamstudent':(BuildContext context) => TeamStudent(),
        '/dialoglogin':(BuildContext context) => DialogLogin(),
        '/registration':(BuildContext context) => Registration(),
        '/profile':(BuildContext context) => ProfilePage(),
        '/editprofile':(BuildContext context) => EditProfilePage(),
        '/newuserroom':(BuildContext context) => NewUserRoom(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}


import 'package:flutter/material.dart';
import './all_screen/spalsh_screen.dart';
import 'package:myfirst/all_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'all_screen/register_screen.dart';
import 'all_screen/password_recovery.dart';
import 'all_screen/admin_home_screen.dart';
import 'all_screen/admin_event_screen_final.dart';

void main() => runApp(new Myflutter());

class Myflutter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyFlutterState();
}

class MyFlutterState extends State {
  SharedPreferences _prefs;
  static const String key1 = "email";
  static const String key2 = "user";
  String emailPref = "", userPref = "";
  bool alreadyLoggedIn = false;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance()
      ..then((prefs) {
        setState(() => this._prefs = prefs);
        _loadEmailPref();
        _loadUserPref();
      });
  }

  void _loadEmailPref() {
    setState(() {
      this.emailPref = this._prefs.getString(key1);
    });
  }

  void _loadUserPref() {
    setState(() {
      this.userPref = this._prefs.getString(key2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Orientation Week Management',
        theme: ThemeData(primaryColor: Colors.black, accentColor: Colors.grey),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        /*routes: <String, WidgetBuilder>{
          '/Route': (BuildContext context) => new LoginScreen()
//          '/Route': (BuildContext context) => new AdminHome()
//          '/Route': (BuildContext context) => new AdminHomeFinal()

        },*/
        routes: userPref == null && emailPref == null
            ? <String, WidgetBuilder>{
                '/Route': (BuildContext context) => new LoginScreen()
              }
            : userPref == "Student"
                ? <String, WidgetBuilder>{
                    '/Route': (BuildContext context) => new RegisterScreen()
                  }
                : <String, WidgetBuilder>{
                    '/Route': (BuildContext context) =>
                        new AdminHome()
                  });
  }
}

import 'package:flutter/material.dart';
import './all_screen/spalsh_screen.dart';
import 'package:flutter/services.dart';
import 'package:myfirst/all_screen/login_screen.dart';
import 'package:myfirst/all_screen/register_screen.dart';
void main() => runApp(new Myflutter());

class Myflutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      theme: ThemeData(primaryColor: Colors.black,accentColor: Colors.yellowAccent),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      routes: <String,WidgetBuilder>{
        '/LoginScreen':(BuildContext context) => new LoginScreen()
      },
    );
  }
}

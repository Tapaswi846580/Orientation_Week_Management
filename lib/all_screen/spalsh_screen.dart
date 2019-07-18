import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
// Splash screen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible=false;
  startTime() async {
    var _duration = new Duration(
        seconds: 3);
    return new Timer(
        _duration, navigationPage);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 300.0,
                  width: 300.0,
                  child: Image.asset('images/aulogo.jpg',alignment: Alignment.center)),
//              AnimatedOpacity(
//                opacity: !_visible ? 1.0 : 0.0,
//                duration: Duration(seconds: 3),
//                child: const Text("Orientation Week",style: TextStyle(color: Colors.black,fontSize: 30.0),),
//              ),
            ],
          )
        ],
      ),
    );
  }

  void navigationPage() {
    Navigator.of(
        context).pushReplacementNamed(
        '/Route');
  }
  @override
  void initState() {
    super.initState();
    startTime();
  }
}

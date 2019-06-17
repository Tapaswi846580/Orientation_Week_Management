import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible=false;
  startTime() async {
    var _duration = new Duration(
        seconds: 5);
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
              Expanded(
                flex: 5,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: ImagesAssert(),
                      ),

                      Padding(padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                      ),
                      AnimatedOpacity(
                        opacity: !_visible ? 1.0 : 0.0,
                        duration: Duration(seconds: 5),
                        child: const Text("AHMEDABAD",style: TextStyle(color: Color(0xffe71827),fontSize: 40.0),),

                      ),
                      AnimatedOpacity(
                        opacity: !_visible ? 1.0 : 0.0,
                        duration: Duration(seconds: 5),
                        child: const Text("UNIVERSITY",style: TextStyle(color: Color(0xff292664),fontSize: 40.0),),
                      ),
                      Divider(
                        color: Colors.transparent,
                        height: 30.0,
                      ),
                      AnimatedOpacity(
                        opacity: !_visible ? 1.0 : 0.0,
                        duration: Duration(seconds: 5),
                        child: const Text("Orientation Week",style: TextStyle(color: Colors.black,fontSize: 30.0),),
                      ),
                    ],
                  ),
                ),
              ),
              /*Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(backgroundColor: Color(0xffe71827),strokeWidth: 5.0,valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff292664)),),
                  ],
                ),
              ),*/
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
class ImagesAssert extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage assetmage = AssetImage('images/aulogo.png');
    Image image = Image(image: assetmage);
    return Container(height: 90.0,alignment: Alignment.center, child:image);
  }

}
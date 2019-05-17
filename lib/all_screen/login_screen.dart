import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
        primarySwatch: Colors.grey,
        ),
        debugShowCheckedModeBanner: false,

        home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _loginstate();
  }
}

class _loginstate extends State<LoginPage>{
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }
  List<DropdownMenuItem<String>> listdrop = [];
  loaddata()
  {
    listdrop.add(DropdownMenuItem(
      child: Text("Student"),
      value: 'Student',
    ));
    listdrop.add(DropdownMenuItem(
      child: Text('Faculty'),
      value: 'faculty',
    ));
  }
  @override
  Widget build(BuildContext context) {
    loaddata();
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xff558fe0),
                    Color(0xff558fe0)
                  ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(90)
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      child: Icon(
                        Icons.account_circle,
                        size: 90.0,
                        color: Colors.white,
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                              'Sign in',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: 50,
                      padding: EdgeInsets.only(
                        top: 2,left: 16,right: 16,bottom: 8
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 30,

                          )
                        ]
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.email),
                          border: InputBorder.none,
                            hintText: 'Email'
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: 50,

                      padding: EdgeInsets.only(
                          top: 2,left: 16,right: 16,bottom: 8
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 30,

                            )
                          ]
                      ),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: Icon(Icons.vpn_key),
                            border: InputBorder.none,
                            hintText: 'Password',
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: DropdownMenuItem(child: DropdownButton(items: listdrop, onChanged: null)),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0,right: 30.0),
                  child: Text("Lost your Password ?",
                  style: TextStyle(fontSize: 15,
                      color: Colors.indigo,
                      decorationStyle: TextDecorationStyle.solid,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BookButton(),
                )
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text("Ragister Yourself",
                    style: TextStyle(fontSize: 15,
                        color: Colors.indigo,
                        decorationStyle: TextDecorationStyle.solid,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}






class BookButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30.0),
        width: MediaQuery.of(context).size.width/2.5,
        height: 40.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
                color: Colors.blueAccent,
                blurRadius: 8,
            )
          ]
      ),
        child: RaisedButton(
            color: Color(0xff558fe0),
            child: Center(
              child: Text("Sign in",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            elevation: 0.0,
            onPressed: (){
            },
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(50.0))),
            );

  }}


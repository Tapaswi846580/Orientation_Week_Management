import 'dart:convert';
import 'password_recovery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
//import 'package:myfirst/all_screen/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'admin_home_screen.dart';
import 'student_home_screen.dart';
import 'resources.dart';
import 'package:flip_card/flip_card.dart';
import 'registration_full_screen_dialog.dart';
import 'dart:math' as math;
import 'Email.dart';
import 'password_recovery_full_screen_dialog.dart';
// Login screen


var selectedVal = "Student";
GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginState();
  }
}

class _LoginState extends State<LoginPage> {
  SharedPreferences _prefs;
  static const String key1 = "email";
  static const String key2 = "user";
  String emailPref = "", userPref = "";
  bool alreadyLoggedIn = false, isRegisterPage = true;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
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

  Future<Null> removeEmailPref() async {
    await this._prefs.remove(key1);
  }

  Future<Null> removeUserPref() async {
    await this._prefs.remove(key2);
  }

  final List<String> _dropdownValues = [
    "Student",
    "Admin",
  ];

  final emailIdController = TextEditingController();
  final passwordController = TextEditingController();

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Container(
//        child: SingleChildScrollView(
//          child: Column(
//            children: <Widget>[
//              Container(
//                width: MediaQuery.of(context).size.width,
//                height: MediaQuery.of(context).size.height / 3,
//                decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                    begin: Alignment.topCenter,
//                    end: Alignment.bottomCenter,
//                    colors: [Color(0xff85160f), Color(0xff85160f)],
//                  ),
//                  borderRadius: BorderRadius.only(
//                      bottomLeft: Radius.circular(0),
//                      bottomRight: Radius.circular(90)),
//                ),
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Align(
//                      child: Icon(
//                        Icons.account_circle,
//                        size: 90.0,
//                        color: Colors.white,
//                      ),
//                    ),
//                    Align(
//                      alignment: Alignment.bottomCenter,
//                      child: Padding(
//                        padding: const EdgeInsets.only(top: 10),
//                        child: Text(
//                          'Sign In',
//                          style: TextStyle(
//                            color: Colors.white,
//                            fontSize: 30,
//                            fontWeight: FontWeight.bold,
//                          ),
//                        ),
//                      ),
//                    )
//                  ],
//                ),
//              ),
//              Container(
//                padding: EdgeInsets.only(top: 30),
//                child: Column(
//                  children: <Widget>[
//                    Container(
//                      width: MediaQuery.of(context).size.width / 1.2,
//                      height: 50,
//                      padding: EdgeInsets.only(
//                          top: 2, left: 16, right: 16, bottom: 8),
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.all(Radius.circular(10)),
//                          color: Colors.white,
//                          boxShadow: [
//                            BoxShadow(
//                              color: Colors.black12,
//                              blurRadius: 30,
//                            )
//                          ]),
//                      child: TextFormField(
//                        keyboardType: TextInputType.emailAddress,
//                        autocorrect: false,
//                        decoration: InputDecoration(
//                          icon: Icon(Icons.alternate_email),
//                          border: InputBorder.none,
//                          hintText: 'Email*',
//                        ),
//                        controller: emailIdController,
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//              Container(
//                padding: EdgeInsets.only(top: 20),
//                child: Column(
//                  children: <Widget>[
//                    Container(
//                      width: MediaQuery.of(context).size.width / 1.2,
//                      height: 50,
//                      padding: EdgeInsets.only(
//                          top: 2, left: 16, right: 16, bottom: 8),
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.all(Radius.circular(10)),
//                          color: Colors.white,
//                          boxShadow: [
//                            BoxShadow(
//                              color: Colors.black12,
//                              blurRadius: 30,
//                            )
//                          ]),
//                      child: TextField(
//                        obscureText: true,
//                        decoration: InputDecoration(
//                          icon: Icon(Icons.vpn_key),
//                          border: InputBorder.none,
//                          hintText: 'Password*',
//                        ),
//                        controller: passwordController,
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(top: 10.0),
//                      child: Text("(*) Indicates Mandatory Field"),
//                    ),
//                  ],
//                ),
//              ),
//              Container(
//                padding: EdgeInsets.only(top: 20),
//                child: Column(
//                  children: <Widget>[
//                    Container(
//                      width: MediaQuery.of(context).size.width / 2,
//                      height: 50,
//                      padding: EdgeInsets.only(
//                          top: 2, left: 16, right: 16, bottom: 8),
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.all(Radius.circular(10)),
//                          color: Colors.white,
//                          boxShadow: [
//                            BoxShadow(
//                              color: Colors.black12,
//                              blurRadius: 10,
//                            )
//                          ]),
//                      child: DropdownButtonHideUnderline(
//                        child: DropdownButton<String>(
//                          value: selectedVal,
//                          onChanged: (String value) {
//                            setState(() {
//                              selectedVal = value;
//                            });
//                          },
//                          items: _dropdownValues
//                              .map((value) => DropdownMenuItem(
//                                    child: Text(value),
//                                    value: value,
//                                  ))
//                              .toList(),
//                        ),
//                      ),
//                    )
//                  ],
//                ),
//              ),
//              Container(
//                child: Align(
//                  alignment: Alignment.centerRight,
//                  child: Padding(
//                    padding: const EdgeInsets.only(top: 5.0, right: 30.0),
//                    child: FlatButton(
//                      onPressed: () {
//                        Navigator.of(context).push(MaterialPageRoute<Null>(
//                            builder: (BuildContext context) {
//                          return PasswordRecoveryScreen();
//                        }));
//                      },
//                      child: Text(
//                        "Lost your Password ?",
//                        style: TextStyle(
//                            fontSize: 15,
//                            color: Color(0xff85160f),
//                            decorationStyle: TextDecorationStyle.solid,
//                            fontStyle: FontStyle.normal,
//                            fontWeight: FontWeight.bold,
//                            letterSpacing: 1),
//                      ),
//                    ),
//                  ),
//                ),
//              ),
//              Container(
//                height: 80.0,
//                child: Row(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.only(left: 20.0),
//                      child: SignInButton(
//                        emailIdController: emailIdController,
//                        passwordController: passwordController,
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(left: 30.0),
//                      child: Container(
//                        margin: EdgeInsets.only(top: 0.0),
//                        width: MediaQuery.of(context).size.width / 2.5,
//                        height: 35.0,
//                        decoration: BoxDecoration(
//                            color: Colors.white,
//                            borderRadius: BorderRadius.all(Radius.circular(10)),
//                            boxShadow: [
//                              BoxShadow(
//                                //color: Colors.blueAccent,
//                                blurRadius: 0,
//                              )
//                            ]),
//                        child: OutlineButton(
//                          shape: new RoundedRectangleBorder(
//                              borderRadius: new BorderRadius.circular(10.0)),
//                          color: Color(0xff85160f),
//                          onPressed: () {
//                            Navigator.of(context).push(MaterialPageRoute<Null>(
//                                builder: (BuildContext context) {
//                              return  RegisterScreen();
//                            }));
//                          },
//                          child: Center(
//                            child: Text(
//                              "Register",
//                              style: TextStyle(
//                                  fontSize: 20.0,
//                                  color: Colors.black,
//                                  fontWeight: FontWeight.bold),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }


  @override
  Widget build(BuildContext context) {
    Widget alldetails = Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0,top: 0.0),
        child: SingleChildScrollView(
          child: Card(
            elevation: 10.0,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,bottom: 20.0),
                    child: Center(
                      child: Container(
                        child: Image.asset(
                          'images/au.png',
                          height: MediaQuery.of(context).size.height/7,
                          width: MediaQuery.of(context).size.width/2,
                        ),
                      ),
                    ),
                  ),

                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: "Email-Id*",
                      border: InputBorder.none,
                      hintText: 'eg: john.a@ahduni.edu.in',
                    ),
                    controller: emailIdController,
                  ),
                  Divider(
                    height: 10.0,
                    color: Colors.black,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: "Enter Password*",
                      border: InputBorder.none,
                    ),
                    controller: passwordController,
                  ),
                  Divider(
                    height: 10.0,
                    color: Colors.black,
                  ),
//                  Padding(
//                    padding: const EdgeInsets.only(top: 10.0),
//                    child: Text(
//                      "(*) Indicates Mandatory Field",
//                      style: TextStyle(fontWeight: FontWeight.w500, color: Colors.red),
//                    ),
//                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 50,
                          padding: EdgeInsets.only(
                              top: 2, left: 16, right: 16, bottom: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                )
                              ]),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedVal,
                              onChanged: (String value) {
                                HapticFeedback.lightImpact();
                                setState(() {
                                  selectedVal = value;
                                });
                              },
                              items: _dropdownValues
                                  .map((value) => DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              ))
                                  .toList(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, right: 0.0),
                        child: FlatButton(
                          onPressed: () {
//                            Navigator.of(context).push(MaterialPageRoute<Null>(
//                                builder: (BuildContext context) {
//                                  return PasswordRecoveryScreen();
//                                }));
                            HapticFeedback.lightImpact();
                            setState(() {
                              isRegisterPage = false;
                            });
                            cardKey.currentState.toggleCard();
                          },
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "Forgot Password ?",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff85160f),
                                  decorationStyle: TextDecorationStyle.solid,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          child: SignInButton(
                            emailIdController: emailIdController,
                            passwordController: passwordController,
                          ),
                          width: MediaQuery.of(context).size.width/3.5,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width/3.5,
                          child: OutlineButton(
                            onPressed: (){
//                              Navigator.of(context).push(MaterialPageRoute<Null>(
//                                  builder: (BuildContext context) {
//                                    return  RegisterScreen();
//                                  }));
                              HapticFeedback.lightImpact();
                              setState(() {
                                isRegisterPage = true;
                              });
                              cardKey.currentState.toggleCard();
                            },
//                            disabledColor: Color(0xff85160f),
                            color: Color(0xff85160f),
//                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),),
                            borderSide: BorderSide(color: Color(0xff85160f),style: BorderStyle.solid,width: 2),
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20.0),
                              ),
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromRGBO(58, 66, 86, 1.0),
        child: FlipCard(
          key: cardKey,
          flipOnTouch: false,
          direction: FlipDirection.HORIZONTAL, // default
          front: Align(alignment: Alignment.center,child: alldetails,),
          back: Align(
            alignment: Alignment.center,
            child: Align(
              alignment: Alignment.center,
              child: isRegisterPage ?RegisterPage() :PasswordRecoverPage(),
            )
          ),
        ),
      ),
    );
//    return Scaffold(
//      body: Container(
//        height: MediaQuery.of(context).size.height,
//        width: MediaQuery.of(context).size.width,
//        color: Color.fromRGBO(58, 66, 86, 1.0),
////        child: Center(
////          child: SingleChildScrollView(
////            child: Column(
////              mainAxisAlignment: MainAxisAlignment.center,
//////            crossAxisAlignment: CrossAxisAlignment.center,
////              children: <Widget>[
////                alldetails
////              ],
////            ),
////          ),
////        ),
//      child: Center(
//        child: FlipCard(
//          direction: FlipDirection.HORIZONTAL, // default
//          front: alldetails,
//          back: Container(
//            child: Text('Back'),
//          ),
//        ),
//      ),
//      ),
//
//    );
  }
}


class SignInButton extends StatefulWidget {
  final TextEditingController emailIdController;
  final TextEditingController passwordController;
  SignInButton({
    @required this.emailIdController,
    @required this.passwordController,
  });
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SignInButtonState(
        emailIdController: emailIdController,
        passwordController: passwordController);
  }
}

class SignInButtonState extends State {
  final TextEditingController emailIdController;
  final TextEditingController passwordController;
  bool apiCall = false, timedOut = false;
  static final postUrl =
      'http://${Resource.ip}:8080/JavaAPI/rest/services/authenticate';

  SharedPreferences preferences;
  static const String key1 = "email";
  static const String key2 = "user";
  String emailPref = "", userPref = "";
  bool alreadyLoggedIn = false;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance()
      ..then((prefs) {
        setState(() => this.preferences = prefs);
        _loadEmailPref();
        _loadUserPref();
      });
  }

  void _loadEmailPref() {
    setState(() {
      this.emailPref = this.preferences.getString(key1);
    });
  }

  void _loadUserPref() {
    setState(() {
      this.userPref = this.preferences.getString(key2);
    });
  }

  Future<Null> _setEmailPref(String value) async {
    await this.preferences.setString(key1, value);
    _loadEmailPref();
  }

  Future<Null> _setUserPref(String value) async {
    await this.preferences.setString(key2, value);
    _loadUserPref();
  }

  SignInButtonState({
    @required this.emailIdController,
    @required this.passwordController,
  });

  Widget getProperWidget() {
    if (apiCall) {
      return SizedBox(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff85160f)),
          strokeWidth: 3.0,
        ),
        height: 25.0,
        width: 25.0,
      );
    } else {
      return FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          "Sign In",
          style: TextStyle(
              fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Color(0xff85160f),
        child: Center(
          child: getProperWidget(),
        ),
        disabledColor: Color(0xff85160f),
        onPressed: apiCall
            ? null
            : () async {
                if (emailIdController.text.trim().length != 0 &&
                    passwordController.text.trim().length != 0) {
                  String email = emailIdController.text.trim();
                  var emailRegex =
                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
                  RegExp regExp = new RegExp(emailRegex);
                  if (regExp.hasMatch(email) &&
                      email.contains("ahduni.edu.in")) {
                    var data = {
                      'emailId': '${emailIdController.text.trim()}',
                      'password': '${passwordController.text.trim()}',
                      'type': selectedVal,
                    };
                    try {
                      setState(() {
                        apiCall = true;
                      });
                      var post = await http.post(
                        Uri.encodeFull(postUrl),
                        body: json.encode(data),
                        headers: {"Content-Type": "application/json"},
                      ).timeout(
                          Duration(
                            seconds: 20, //Set timeout to 10 seconds
                          ), onTimeout: () {
                        setState(() {
                          timedOut = true;
                        });
                        HapticFeedback.heavyImpact();
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Server Timed Out',
                            style: TextStyle(color: Colors.white),
                          ),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {
                              print(timedOut);
                            },
                            textColor: Colors.white,
                          ),
                          backgroundColor: Color(0xffe71827),
                          duration: Duration(seconds: 3),
                        ));
                      });
                      var res = post.body;
                      if (res == "Valid") {
                        this._setEmailPref(email);
                        this._setUserPref(selectedVal);
                        setState(() {
                          apiCall = false;
                        });

                        selectedVal == "Student"
                            ? Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        StudentHomeScreen()))
                            : Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminHome()));
                      } else if (res == "Invalid") {
                        setState(() {
                          apiCall = false;
                        });
                        HapticFeedback.heavyImpact();
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Invalid Login Credentials',
                            style: TextStyle(color: Colors.white),
                          ),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {},
                            textColor: Colors.white,
                          ),
                          backgroundColor: Color(0xffe71827),
                          duration: Duration(seconds: 3),
                        ));
                      } else if (res == "Error") {
                        setState(() {
                          apiCall = false;
                        });
                        HapticFeedback.heavyImpact();
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Some error has occurred, please contact administrator',
                            style: TextStyle(color: Colors.white),
                          ),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {},
                            textColor: Colors.white,
                          ),
                          backgroundColor: Color(0xffe71827),
                          duration: Duration(seconds: 3),
                        ));
                      } else if(post.statusCode == 404) {
                        setState(() {
                          apiCall = false;
                        });
                        HapticFeedback.heavyImpact();
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Server could not be reached, please try again',
                            style: TextStyle(color: Colors.white),
                          ),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {},
                            textColor: Colors.white,
                          ),
                          backgroundColor: Color(0xffe71827),
                          duration: Duration(seconds: 3),
                        ));
                      }
                      else{
                        setState(() {
                          apiCall = false;
                        });
                        HapticFeedback.heavyImpact();
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Some error has occurred, please contact administrator',
                            style: TextStyle(color: Colors.white),
                          ),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {},
                            textColor: Colors.white,
                          ),
                          backgroundColor: Color(0xffe71827),
                          duration: Duration(seconds: 3),
                        ));
                      }

                    } catch (e) {
                      setState(() {
                        apiCall = false;
                      });
                      if (timedOut == false) {
                        HapticFeedback.heavyImpact();
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Server could not be reached, please contact administrator️',
                            style: TextStyle(color: Colors.white),
                          ),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {},
                            textColor: Colors.white,
                          ),
                          backgroundColor: Color(0xffe71827),
                          duration: Duration(seconds: 3),
                        ));
                      }
                      setState(() {
                        timedOut = false;
                      });
                    }
                  } else {
                    setState(() {
                      apiCall = false;
                    });
                    HapticFeedback.heavyImpact();
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Please enter proper \'ahduni\' email',
                        style: TextStyle(color: Colors.white),
                      ),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {},
                        textColor: Colors.white,
                      ),
                      backgroundColor: Color(0xffe71827),
                      duration: Duration(seconds: 2),
                    ));
                  }
                } else {
                  setState(() {
                    apiCall = false;
                  });
                  // Write logic for invalid input
                  HapticFeedback.heavyImpact();
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(
                      'Please enter all required fields️',
                      style: TextStyle(color: Colors.white),
                    ),
                    action: SnackBarAction(
                      label: 'OK',
                      onPressed: () {},
                      textColor: Colors.white,
                    ),
                    backgroundColor: Color(0xffe71827),
                    duration: Duration(seconds: 2),
                  ));
                }
              },
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0)));
  }
}

class DropDown extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DropDownState();
  }
}

class DropDownState extends State {
  String selectdValue = "Student";
  final List<String> _dropdownValues = [
    "Student",
    "Admin",
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DropdownButton<String>(
      value: selectdValue,
      onChanged: (String value) {
        setState(() {
          selectdValue = value;
        });
      },
      items: _dropdownValues
          .map((value) => DropdownMenuItem(
                child: Text(value),
                value: value,
              ))
          .toList(),
    );
  }
}

      /*Registration page*/
class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _registerState();
  }
}

class _registerState extends State<RegisterPage> {
  SharedPreferences _prefs;
  static const String key1 = "email";
  static const String key2 = "user";
  String emailPref = "", userPref = "";

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
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

  Future<Null> removeEmailPref() async{
    await this._prefs.remove(key1);
  }

  Future<Null> removeUserPref() async{
    await this._prefs.remove(key2);
  }

  final emailIdController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      body: Container(
//        child: SingleChildScrollView(
//          child: Column(
//            children: <Widget>[
//              Container(
//                width: MediaQuery.of(context).size.width,
//                height: MediaQuery.of(context).size.height / 3,
//                decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                    begin: Alignment.topCenter,
//                    end: Alignment.bottomCenter,
//                    colors: [Color(0xff85160f), Color(0xff85160f)],
//                  ),
//                  borderRadius: BorderRadius.only(
//                      bottomLeft: Radius.circular(0),
//                      bottomRight: Radius.circular(90)),
//                ),
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Align(
//                      child: Icon(
//                        Icons.person_add,
//                        size: 90.0,
//                        color: Colors.white,
//                      ),
//                    ),
//                    Align(
//                      alignment: Alignment.bottomCenter,
//                      child: Padding(
//                        padding: const EdgeInsets.only(top: 20),
//                        child: FittedBox(
//                          fit: BoxFit.fitWidth,
//                          child: Text(
//                            'Register Yourself',
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontSize: 30,
//                                fontWeight: FontWeight.bold),
//                          ),
//                        ),
//                      ),
//                    )
//                  ],
//                ),
//              ),
//              Container(
//                padding: EdgeInsets.only(top: 30),
//                child: Column(
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.only(bottom: 10.0),
//                      child: Text("(*) Indicates Mandatory Field"),
//                    ),
//                    Container(
//                      width: MediaQuery.of(context).size.width / 1.2,
//                      height: 50,
//                      padding: EdgeInsets.only(
//                          top: 2, left: 16, right: 16, bottom: 8),
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.all(Radius.circular(10)),
//                          color: Colors.white,
//                          boxShadow: [
//                            BoxShadow(
//                              color: Colors.black12,
//                              blurRadius: 30,
//                            )
//                          ]),
//                      child: TextFormField(
//                        decoration: InputDecoration(
//                            enabled: false,
//                            icon: Icon(Icons.alternate_email),
//                            border: InputBorder.none,
//                            hintText: 'Email*'),
//                        controller: emailIdController,
//                        keyboardType: TextInputType.emailAddress,
//                      ),
//                    )
//                  ],
//                ),
//              ),
//              Container(
//                padding: EdgeInsets.only(top: 30),
//                child: Column(
//                  children: <Widget>[
//                    Container(
//                      width: MediaQuery.of(context).size.width / 1.2,
//                      height: 50,
//                      padding: EdgeInsets.only(
//                          top: 2, left: 16, right: 16, bottom: 8),
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.all(Radius.circular(10)),
//                          color: Colors.white,
//                          boxShadow: [
//                            BoxShadow(
//                              color: Colors.black12,
//                              blurRadius: 30,
//                            )
//                          ]),
//                      child: TextFormField(
//                        obscureText: true,
//                        decoration: InputDecoration(
//                          icon: Icon(Icons.vpn_key),
//                          border: InputBorder.none,
//                          hintText: 'Password*',
//                        ),
//                        controller: passwordController,
//                      ),
//                    )
//                  ],
//                ),
//              ),
//              Container(
//                padding: EdgeInsets.only(top: 30),
//                child: Column(
//                  children: <Widget>[
//                    Container(
//                      width: MediaQuery.of(context).size.width / 1.2,
//                      height: 50,
//                      padding: EdgeInsets.only(
//                          top: 2, left: 16, right: 16, bottom: 8),
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.all(Radius.circular(10)),
//                          color: Colors.white,
//                          boxShadow: [
//                            BoxShadow(
//                              color: Colors.black12,
//                              blurRadius: 30,
//                            )
//                          ]),
//                      child: TextField(
//                        obscureText: true,
//                        decoration: InputDecoration(
//                          icon: Icon(Icons.vpn_key),
//                          border: InputBorder.none,
//                          hintText: 'Confirm Password*',
//                        ),
//                        controller: confirmPasswordController,
//                      ),
//                    )
//                  ],
//                ),
//              ),
//              Align(
//                alignment: Alignment.center,
//                child: Padding(
//                  padding: const EdgeInsets.only(left: 33.0, top: 10.0),
//                  child: Text("Password Should contain 6 or more characters, atleast one letter and one number.",
//                    style: TextStyle(color: Colors.indigo,wordSpacing: 1.0),
//                  ),
//                ),
//              ),
//              Align(
//                  alignment: Alignment.center,
//                  child: Padding(
//                    padding: const EdgeInsets.all(30.0),
//                    child: RegisterButton(
//                      emailIdController: emailIdController,
//                      passwordController: passwordController,
//                      confirmPasswordController: confirmPasswordController,
//                    ),
//                  )),
//            ],
//          ),
//        ),
//      ),
//    );
//  }


  /*height: MediaQuery.of(context).size.height/1.5,*/
  @override
  Widget build(BuildContext context) {
    Widget alldetails = Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: SingleChildScrollView(
          child: Card(
            elevation: 10.0,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,bottom: 0.0),
                    child: Center(
                      child: Container(
                        child: Image.asset(
                          'images/au.png',
                          height: MediaQuery.of(context).size.height/7,
                          width: MediaQuery.of(context).size.width/2,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Text("Register Yourself", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                  ),

                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: "Email-Id*",
                      border: InputBorder.none,
                      hintText: 'eg: john.a@ahduni.edu.in',
                    ),
                    controller: emailIdController,
                  ),
                  Divider(
                    height: 10.0,
                    color: Colors.black,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: "Password*",
                      border: InputBorder.none,
                    ),
                    controller: passwordController,
                  ),
                  Divider(
                    height: 10.0,
                    color: Colors.black,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: "Confirm Password*",
                      border: InputBorder.none,
                    ),
                    controller: confirmPasswordController,
                  ),
                  Divider(
                    height: 10.0,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                    child: Text("Password Should contain 6 or more characters, atleast one letter and one number.",
                      style: TextStyle(color: Colors.indigo),
                    ),
                  ),
//                  Padding(
//                    padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
//                    child: Text(
//                      "(*) Indicates Mandatory Field",
//                      style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red),
//                    ),
//                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 0.0, bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width/3.5,
                          child: SendOTPButton(
                            emailIdController: emailIdController,
                            passwordController: passwordController,
                            confirmPasswordController: confirmPasswordController,
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width/3.5,
                            child: OutlineButton(
                              onPressed: (){
                                HapticFeedback.lightImpact();
                                cardKey.currentState.toggleCard();
                              },
                              color: Color(0xff85160f),
                              borderSide: BorderSide(color: Color(0xff85160f),style: BorderStyle.solid,width: 2),
//                            elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "Back",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
//          mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                alldetails
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SendOTPButton extends StatelessWidget {
  final TextEditingController emailIdController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const SendOTPButton({
    @required this.emailIdController,
    @required this.passwordController,
    @required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    final otpController = TextEditingController();
    return RaisedButton(
      color: Color(0xff85160f),
      child: Center(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            "Send OTP",
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      onPressed: () {
        HapticFeedback.heavyImpact();
        String email = emailIdController.text.trim();
        String password = passwordController.text.trim();
        String confirmPassword = confirmPasswordController.text.trim();
        if (emailIdController.text.trim().length != 0 &&
            passwordController.text.trim().length != 0 &&
            confirmPasswordController.text.trim().length != 0) {
          // Regular Expression for email ID validation
          var emailRegex =
              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
          RegExp regExp = new RegExp(emailRegex);
          if (regExp.hasMatch(email) && email.contains("ahduni.edu.in")) {
            if (password == confirmPassword) {
              // Regular Expression for password validation
              var pswdRegex =
                  r"^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$";
              RegExp regExp1 = new RegExp(pswdRegex);
              if (regExp1.hasMatch(password)) {
                //Generating random number for otp
                var random = new math.Random();
                var otp = random.nextInt(9999);
                var e = new Email();
                e.sendEmail(email, otp);

                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) {
                    return RegistrationFullScreenDialog(
                      emailId: email,
                      password: password,
                      otp: otp,
                    );
                  },
                  fullscreenDialog: true,
                )).then((val){
                  emailIdController.text = "";
                  passwordController.text = "";
                  confirmPasswordController.text="";
                  cardKey.currentState.toggleCard();
                });
              }else{
                HapticFeedback.heavyImpact();
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Password does not match requirements',
                    style: TextStyle(color: Colors.white),
                  ),
                  action: SnackBarAction(
                    label: 'OK',
                    onPressed: () {},
                    textColor: Colors.white,
                  ),
                  backgroundColor: Color(0xffe71827),
                  duration: Duration(seconds: 2),
                ));
              }
            } else {
              HapticFeedback.heavyImpact();
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Password and confirm password should be matched',
                  style: TextStyle(color: Colors.white),
                ),
                action: SnackBarAction(
                  label: 'OK',
                  onPressed: () {},
                  textColor: Colors.white,
                ),
                backgroundColor: Color(0xffe71827),
                duration: Duration(seconds: 2),
              ));
            }
          } else {
            HapticFeedback.heavyImpact();
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(
                'Please enter proper \'ahduni\' email',
                style: TextStyle(color: Colors.white),
              ),
              action: SnackBarAction(
                label: 'OK',
                onPressed: () {},
                textColor: Colors.white,
              ),
              backgroundColor: Color(0xffe71827),
              duration: Duration(seconds: 2),
            ));
          }
        } else {
          HapticFeedback.heavyImpact();
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
              'Please enter all required fields',
              style: TextStyle(color: Colors.white),
            ),
            action: SnackBarAction(
              label: 'OK',
              onPressed: () {},
              textColor: Colors.white,
            ),
            backgroundColor: Color(0xffe71827),
            duration: Duration(seconds: 2),
          ));
        }
      },
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }
}


      /*Password Recover Page*/
class PasswordRecoverPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  PasswordRecoveryState();
  }

}

class PasswordRecoveryState extends State{
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  final emailIdController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//      body: Container(
//        child: SingleChildScrollView(
//          child: Column(
//            children: <Widget>[
//              Container(
//                width: MediaQuery.of(context).size.width,
//                height: MediaQuery.of(context).size.height / 3,
//                decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                    begin: Alignment.topCenter,
//                    end: Alignment.bottomCenter,
//                    colors: [Color(0xff85160f), Color(0xff85160f)],
//                  ),
//                  borderRadius: BorderRadius.only(
//                      bottomLeft: Radius.circular(0),
//                      bottomRight: Radius.circular(90)),
//                ),
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Align(
//                      child: Icon(
//                        Icons.lock_outline,
//                        size: 90.0,
//                        color: Colors.white,
//                      ),
//                    ),
//                    Align(
//                      alignment: Alignment.bottomCenter,
//                      child: Padding(
//                        padding: const EdgeInsets.only(top: 20),
//                        child: FittedBox(
//                          fit: BoxFit.fill,
//                          child: Text(
//                            'Password Recovery',
//                            style: TextStyle(
//                                color: Colors.white,
//                                fontSize: 30,
//                                fontWeight: FontWeight.bold),
//                          ),
//                        ),
//                      ),
//                    )
//                  ],
//                ),
//              ),
//              Container(
//                padding: EdgeInsets.only(top: 30),
//                child: Column(
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.only(bottom: 10.0),
//                      child: Text("(*) Indicates Mandatory Field"),
//                    ),
//                    Container(
//                      width: MediaQuery.of(context).size.width / 1.2,
//                      height: 50,
//                      padding: EdgeInsets.only(
//                          top: 2, left: 16, right: 16, bottom: 8),
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.all(Radius.circular(10)),
//                          color: Colors.white,
//                          boxShadow: [
//                            BoxShadow(
//                              color: Colors.black12,
//                              blurRadius: 30,
//                            )
//                          ]),
//                      child: TextFormField(
//                        decoration: InputDecoration(
//                            enabled: false,
//                            icon: Icon(Icons.alternate_email),
//                            border: InputBorder.none,
//                            hintText: 'Email*'),
//                        controller: emailIdController,
//                        keyboardType: TextInputType.emailAddress,
//                      ),
//                    )
//                  ],
//                ),
//              ),
//              Container(
//                padding: EdgeInsets.only(top: 30),
//                child: Column(
//                  children: <Widget>[
//                    Container(
//                      width: MediaQuery.of(context).size.width / 1.2,
//                      height: 50,
//                      padding: EdgeInsets.only(
//                          top: 2, left: 16, right: 16, bottom: 8),
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.all(Radius.circular(10)),
//                          color: Colors.white,
//                          boxShadow: [
//                            BoxShadow(
//                              color: Colors.black12,
//                              blurRadius: 30,
//                            )
//                          ]),
//                      child: TextFormField(
//                        obscureText: true,
//                        decoration: InputDecoration(
//                          icon: Icon(Icons.vpn_key),
//                          border: InputBorder.none,
//                          hintText: 'New Password*',
//                        ),
//                        controller: passwordController,
//                      ),
//                    )
//                  ],
//                ),
//              ),
//              Container(
//                padding: EdgeInsets.only(top: 30),
//                child: Column(
//                  children: <Widget>[
//                    Container(
//                      width: MediaQuery.of(context).size.width / 1.2,
//                      height: 50,
//                      padding: EdgeInsets.only(
//                          top: 2, left: 16, right: 16, bottom: 8),
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.all(Radius.circular(10)),
//                          color: Colors.white,
//                          boxShadow: [
//                            BoxShadow(
//                              color: Colors.black12,
//                              blurRadius: 30,
//                            )
//                          ]),
//                      child: TextField(
//                        obscureText: true,
//                        decoration: InputDecoration(
//                          icon: Icon(Icons.vpn_key),
//                          border: InputBorder.none,
//                          hintText: 'Confirm Password*',
//                        ),
//                        controller: confirmPasswordController,
//                      ),
//                    )
//                  ],
//                ),
//              ),
//              Align(
//                alignment: Alignment.center,
//                child: Padding(
//                  padding: const EdgeInsets.only(left: 33.0, top: 10.0),
//                  child: Text("Password Should contain 6 or more characters, atleast one letter and one number.",
//                    style: TextStyle(color: Color(0xff85160f),wordSpacing: 1.0),
//                  ),
//                ),
//              ),
//              Align(
//                  alignment: Alignment.center,
//                  child: Padding(
//                    padding: const EdgeInsets.all(30.0),
//                    child: RegisterButton(
//                      emailIdController: emailIdController,
//                      passwordController: passwordController,
//                      confirmPasswordController: confirmPasswordController,
//                    ),
//                  )),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
  @override
  Widget build(BuildContext context) {
    Widget alldetails = Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30.0,top: 0.0),
        child: SingleChildScrollView(
          child: Card(
            elevation: 10.0,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,bottom: 0.0),
                    child: Center(
                      child: Container(
                        child: Image.asset(
                          'images/au.png',
                          height: MediaQuery.of(context).size.height/7,
                          width: MediaQuery.of(context).size.width/2,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Text("Password Recovery", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                  ),

                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: "Email-Id*",
                      border: InputBorder.none,
                      hintText: 'eg: john.a@ahduni.edu.in',
                    ),
                    controller: emailIdController,
                  ),
                  Divider(
                    height: 10.0,
                    color: Colors.black,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: "Password*",
                      border: InputBorder.none,
                    ),
                    controller: passwordController,
                  ),
                  Divider(
                    height: 10.0,
                    color: Colors.black,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: "Confirm Password*",
                      border: InputBorder.none,
                    ),
                    controller: confirmPasswordController,
                  ),
                  Divider(
                    height: 10.0,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                    child: Text("Password Should contain 6 or more characters, atleast one letter and one number.",
                      style: TextStyle(color: Colors.indigo),
                    ),
                  ),
//                  Padding(
//                    padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
//                    child: Text(
//                      "(*) Indicates Mandatory Field",
//                      style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red),
//                    ),
//                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 0.0, bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width/3.5,
                          child: SendOTPButtonPasswordRecovery(
                            emailIdController: emailIdController,
                            passwordController: passwordController,
                            confirmPasswordController: confirmPasswordController,
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width/3.5,
                            child: OutlineButton(
                              onPressed: (){
                                HapticFeedback.lightImpact();
                                cardKey.currentState.toggleCard();
                               },
                              color: Color(0xff85160f),
                              borderSide: BorderSide(color: Color(0xff85160f),style: BorderStyle.solid,width: 2),
//                            elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  "Back",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                alldetails
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SendOTPButtonPasswordRecovery extends StatelessWidget {
  final TextEditingController emailIdController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const SendOTPButtonPasswordRecovery({
    @required this.emailIdController,
    @required this.passwordController,
    @required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    final otpController = TextEditingController();
    return RaisedButton(
      color: Color(0xff85160f),
      child: Center(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            "Send OTP",
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      onPressed: () {
        HapticFeedback.heavyImpact();
        String email = emailIdController.text.trim();
        String password = passwordController.text.trim();
        String confirmPassword = confirmPasswordController.text.trim();
        if (emailIdController.text.trim().length != 0 &&
            passwordController.text.trim().length != 0 &&
            confirmPasswordController.text.trim().length != 0) {
          // Regular Expression for email ID validation
          var emailRegex =
              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
          RegExp regExp = new RegExp(emailRegex);
          if (regExp.hasMatch(email) && email.contains("ahduni.edu.in")) {
            if (password == confirmPassword) {
              // Regular Expression for password validation
              var pswdRegex =
                  r"^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$";
              RegExp regExp1 = new RegExp(pswdRegex);
              if (regExp1.hasMatch(password)) {
                //Generating random number for otp
                var random = new math.Random();
                var otp = random.nextInt(9999);
                var e = new Email();
                e.sendEmail(email, otp);

                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) {
                    return PasswordRecoveryFullScreenDialog(
                      emailId: email,
                      password: password,
                      otp: otp,
                    );
                  },
                  fullscreenDialog: true,
                )).then((val){
                  emailIdController.text = "";
                  passwordController.text = "";
                  confirmPasswordController.text="";
                  cardKey.currentState.toggleCard();
                });
              }else{
                HapticFeedback.heavyImpact();
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Password does not match requirements',
                    style: TextStyle(color: Colors.white),
                  ),
                  action: SnackBarAction(
                    label: 'OK',
                    onPressed: () {},
                    textColor: Colors.white,
                  ),
                  backgroundColor: Color(0xffe71827),
                  duration: Duration(seconds: 2),
                ));
              }
            } else {
              HapticFeedback.heavyImpact();
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Password and confirm password should be matched',
                  style: TextStyle(color: Colors.white),
                ),
                action: SnackBarAction(
                  label: 'OK',
                  onPressed: () {},
                  textColor: Colors.white,
                ),
                backgroundColor: Color(0xffe71827),
                duration: Duration(seconds: 2),
              ));
            }
          } else {
            HapticFeedback.heavyImpact();
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(
                'Please enter proper \'ahduni\' email',
                style: TextStyle(color: Colors.white),
              ),
              action: SnackBarAction(
                label: 'OK',
                onPressed: () {},
                textColor: Colors.white,
              ),
              backgroundColor: Color(0xffe71827),
              duration: Duration(seconds: 2),
            ));
          }
        } else {
          HapticFeedback.heavyImpact();
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(
              'Please enter all required fields',
              style: TextStyle(color: Colors.white),
            ),
            action: SnackBarAction(
              label: 'OK',
              onPressed: () {},
              textColor: Colors.white,
            ),
            backgroundColor: Color(0xffe71827),
            duration: Duration(seconds: 2),
          ));
        }
      },
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }

}
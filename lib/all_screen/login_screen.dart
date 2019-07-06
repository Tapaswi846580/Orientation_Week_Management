import 'dart:convert';
import 'password_recovery.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:myfirst/all_screen/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'admin_home_screen.dart';
import 'student_home_screen.dart';
import 'resources.dart';
import 'registration_full_screen_dialog.dart';

var selectedVal = "Student";

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
  bool alreadyLoggedIn = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff292664), Color(0xff292664)],
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(90)),
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
                          'Sign In',
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
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      padding: EdgeInsets.only(
                          top: 2, left: 16, right: 16, bottom: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 30,
                            )
                          ]),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        decoration: InputDecoration(
                          icon: Icon(Icons.alternate_email),
                          border: InputBorder.none,
                          hintText: 'Email*',
                        ),
                        controller: emailIdController,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      padding: EdgeInsets.only(
                          top: 2, left: 16, right: 16, bottom: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 30,
                            )
                          ]),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: Icon(Icons.vpn_key),
                          border: InputBorder.none,
                          hintText: 'Password*',
                        ),
                        controller: passwordController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text("(*) Indicates Mandatory Field"),
                    ),
                  ],
                ),
              ),
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
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0, right: 30.0),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                          return PasswordRecoveryScreen();
                        }));
                      },
                      child: Text(
                        "Lost your Password ?",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff292664),
                            decorationStyle: TextDecorationStyle.solid,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 80.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: SignInButton(
                        emailIdController: emailIdController,
                        passwordController: passwordController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Container(
                        margin: EdgeInsets.only(top: 0.0),
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: 35.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                //color: Colors.blueAccent,
                                blurRadius: 0,
                              )
                            ]),
                        child: OutlineButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                          color: Color(0xff292664),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute<Null>(
                                builder: (BuildContext context) {
                              return  RegisterScreen();
                            }));
                          },
                          child: Center(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
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
    );
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
          valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff292664)),
          strokeWidth: 3.0,
        ),
        height: 25.0,
        width: 25.0,
      );
    } else {
      return Text(
        "Sign In",
        style: TextStyle(
            fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0.0),
      width: MediaQuery.of(context).size.width / 2.5,
      height: 35.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Color(0xff292664),
              blurRadius: 0,
            )
          ]),
      child: RaisedButton(
          color: Color(0xff292664),
          child: Center(
            child: getProperWidget(),
          ),
          disabledColor: Color(0xff292664),
          onPressed: apiCall
              ? null
              : () async {
                  if (emailIdController.text.length != 0 &&
                      passwordController.text.length != 0) {
                    String email = emailIdController.text;
                    var emailRegex =
                        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
                    RegExp regExp = new RegExp(emailRegex);
                    if (regExp.hasMatch(email) &&
                        email.contains("ahduni.edu.in")) {
                      var data = {
                        'emailId': '${emailIdController.text}',
                        'password': '${passwordController.text}',
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
                              'Invalid Login Credentials :(',
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
                              'Server could not be reached, please contact administrator ⚠️',
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
                        'Please enter all required fields ⚠️',
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
              borderRadius: new BorderRadius.circular(10.0))),
    );
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

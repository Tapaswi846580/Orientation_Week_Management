import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'registration_full_screen_dialog.dart';
import 'dart:math' as math;
import 'Email.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}

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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                    colors: [Color(0xff558fe0), Color(0xff558fe0)],
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
                        Icons.person_add,
                        size: 90.0,
                        color: Colors.white,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'Register Yourself',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text("(*) Indicates Mandatory Field"),
                    ),
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
                        decoration: InputDecoration(
                            enabled: false,
                            icon: Icon(Icons.alternate_email),
                            border: InputBorder.none,
                            hintText: 'Email*'),
                        controller: emailIdController,
                        keyboardType: TextInputType.emailAddress,
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
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: Icon(Icons.vpn_key),
                          border: InputBorder.none,
                          hintText: 'Password*',
                        ),
                        controller: passwordController,
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
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: Icon(Icons.vpn_key),
                          border: InputBorder.none,
                          hintText: 'Confirm Password*',
                        ),
                        controller: confirmPasswordController,
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 33.0, top: 10.0),
                  child: Text("Password Should contain 8 or more characters, Upper & Lower letters and Atleast one number.",
                    style: TextStyle(color: Colors.indigo,wordSpacing: 1.0),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: RegisterButton(
                      emailIdController: emailIdController,
                      passwordController: passwordController,
                      confirmPasswordController: confirmPasswordController,
                    ),
                  )),
/*
              FlatButton(
                  onPressed: () {
                    removeEmailPref();
                    removeUserPref();
                  },
                  child: Text("Clear")),*/
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  final TextEditingController emailIdController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  //final postUrl = "http://172.20.10.2:8080/JavaAPI/rest/services/register";

  const RegisterButton({
    @required this.emailIdController,
    @required this.passwordController,
    @required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    final otpController = TextEditingController();
    return Container(
      margin: EdgeInsets.only(top: 0.0),
      width: MediaQuery.of(context).size.width / 2.5,
      height: 40.0,
      child: RaisedButton(
        color: Color(0xff558fe0),
        child: Center(
          child: FittedBox(
            fit: BoxFit.fitHeight,
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
          String email = emailIdController.text;
          String password = passwordController.text;
          String confirmPassword = confirmPasswordController.text;
          if (emailIdController.text.length != 0 &&
              passwordController.text.length != 0 &&
              confirmPasswordController.text.length != 0) {
            // Regular Expression for email ID validation
            var emailRegex =
                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
            RegExp regExp = new RegExp(emailRegex);
            if (regExp.hasMatch(email) && email.contains("ahduni.edu.in")) {
              if (password == confirmPassword) {
                // Regular Expression for password validation
                var pswdRegex =
                    r"^(?:(?=.*[a-z])(?:(?=.*[A-Z])(?=.*[\d\W])|(?=.*\W)(?=.*\d))|(?=.*\W)(?=.*[A-Z])(?=.*\d)).{8,}$";
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
                        confirmPassword: confirmPassword,
                        otp: otp,
                      );
                    },
                    fullscreenDialog: true,
                  ));
                }else{
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
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 2),
                  ));
                }
              } else {
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
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 2),
                ));
              }
            } else {
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
                backgroundColor: Colors.red,
                duration: Duration(seconds: 2),
              ));
            }
          } else {
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
              backgroundColor: Colors.red,
              duration: Duration(seconds: 2),
            ));
          }
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
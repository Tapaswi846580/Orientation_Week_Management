import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_screen.dart';
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
//                    colors: [Color(0xff292664), Color(0xff292664)],
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
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                    child: Text(
                      "(*) Indicates Mandatory Field",
                      style: TextStyle(fontWeight: FontWeight.w500,color: Colors.red),
                    ),
                  ),

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
                            onPressed: (){},
                            color: Color(0xff292664),
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
      color: Color(0xff292664),
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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
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
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    );
  }
}

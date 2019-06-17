import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math' as math;
import 'Email.dart';
import 'dart:async';

class RegistrationFullScreenDialog extends StatefulWidget {
  final String emailId;
  final String password;
  final String confirmPassword;
  final int otp;

  const RegistrationFullScreenDialog({
    @required this.emailId,
    @required this.password,
    @required this.confirmPassword,
    @required this.otp,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegistrationFullScreenDialogState(
        emailId: emailId,
        password: password,
        confirmPassword: confirmPassword,
        otp: otp);
  }
}

class RegistrationFullScreenDialogState extends State {
  String emailId;
  String password;
  String confirmPassword;
  int otp;
  final postUrl = "http://172.20.10.2:8080/JavaAPI/rest/services/register";
  RegistrationFullScreenDialogState({
    @required this.emailId,
    @required this.password,
    @required this.confirmPassword,
    @required this.otp,
  });

  Timer timer;
  int start = 300;
  bool apiCall = false;
  bool disableButton = false;

  Widget getProperWidgetForOutlineButton() {
    if (apiCall) {
      return SizedBox(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff292664)),
          strokeWidth: 3.0,
        ),
        height: 20.0,
        width: 20.0,
      );
    } else {
      return Text("Resend OTP");
    }
  }

  Widget getProperWidgetForRaisedButton() {
    if (disableButton) {
      return SizedBox(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff292664)),
          strokeWidth: 3.0,
        ),
        height: 20.0,
        width: 20.0,
      );
    } else {
      return Text(
        "Register",
        style: TextStyle(color: Colors.lightGreenAccent),
      );
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    timer = Timer(Duration(seconds: 120), () {
      otp = null;
    });
    final otpController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "One Time Password",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff558fe0),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Please Enter OTP sent on provided email address.",
              style: TextStyle(color: Colors.indigo),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: TextField(
                keyboardType: TextInputType.number,
                style: Theme.of(context).textTheme.title,
                decoration: InputDecoration(
                  labelText: 'OTP',
                  labelStyle: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.black),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
                controller: otpController,
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: FlatButton(
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.indigo),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    OutlineButton(
                      child: getProperWidgetForOutlineButton(),
                      onPressed: apiCall
                          ? null
                          : () {
                              setState(() {
                                apiCall = true;
                              });
                              var random = new math.Random();
                              otp = random.nextInt(9999);
                              var e = new Email();
                              e.sendEmail(emailId, otp).then((result) {
                                result.forEach((sr) {
                                  if (sr.sent) {
                                    //print('Message sent');
                                    setState(() {
                                      apiCall = false;
                                    });
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                              title: Text("Status"),
                                              content: Text(
                                                "OTP Sent !",
                                                style:
                                                    TextStyle(color: Colors.blue),
                                              ),
                                              actions: <Widget>[
                                                FlatButton(
                                                  child: Text('OK',
                                                      style: TextStyle(
                                                          color: Colors.indigo)),
                                                  onPressed: () {
                                                    Navigator.pop(context, 'OK');
                                                  },
                                                )
                                              ],
                                            ));
                                  } else {
                                    setState(() {
                                      apiCall = false;
                                    });
                                    String problem;
                                    for (var p in sr.validationProblems) {
                                      problem = p.code;
                                      //print('Problem: ${p.code}: ${p.msg}');
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                title: Text("Status"),
                                                content: Text(
                                                  "$problem",
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                                actions: <Widget>[
                                                  FlatButton(
                                                    child: Text('OK',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.indigo)),
                                                    onPressed: () {
                                                      otp = null;
                                                      Navigator.pop(
                                                          context, 'OK');
                                                    },
                                                  )
                                                ],
                                              ));
                                    }
                                  }
                                });
                              });
                            },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: RaisedButton(
                        color: Color(0xff558fe0),
                        disabledColor: Color(0xff558fe0),
                        child: getProperWidgetForRaisedButton(),
                        onPressed: disableButton
                            ? null
                            : () async {
                          if (otp.toString() == otpController.text) {
                            setState(() {
                              disableButton = true;
                            });
                            try {
                              var data = {
                                'emailId': emailId,
                                'password': password,
                              };
                              var post = await http.post(
                                Uri.encodeFull( postUrl),
                                body: json.encode(data),
                                headers: {"Content-Type": "application/json"},
                              );
                              var res = post.body;
                              if (res == "Done") {
                                setState(() {
                                  disableButton = false;
                                });
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: Text("Status"),
                                          content: Text(
                                            "Successfully Registered ! 😉",
                                            style: TextStyle(color: Colors.green),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text('OK',
                                                  style: TextStyle(
                                                      color: Colors.indigo)),
                                              onPressed: () {
                                                otp = null;
                                                Navigator.pop(context, 'OK');
                                              },
                                            )
                                          ],
                                        ));
                              } else if (res == "Already Registered") {
                                setState(() {
                                  disableButton = false;
                                });
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: Text("Status"),
                                          content: Text(
                                            "This Email Id is already registered 🙁",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                                child: Text('OK',
                                                    style: TextStyle(
                                                        color: Colors.indigo)),
                                                onPressed: () {
                                                  otp = null;
                                                  Navigator.pop(context, 'OK');
                                                })
                                          ],
                                        ));
                              } else if (res == "Error") {
                                setState(() {
                                  disableButton = false;
                                });
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: Text("Status"),
                                          content: Text(
                                            "Some error has occured, please try again",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                                child: Text('OK',
                                                    style: TextStyle(
                                                        color: Colors.indigo)),
                                                onPressed: () {
                                                  otp = null;
                                                  Navigator.pop(context, 'OK');
                                                })
                                          ],
                                        ));
                              }
                            } catch (e) {
                              setState(() {
                                disableButton = false;
                              });
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                        title: Text("Status"),
                                        content: Text(
                                          "Server could not be reached ⚠️",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                              child: Text('OK',
                                                  style: TextStyle(
                                                      color: Colors.indigo)),
                                              onPressed: () {
                                                otp = null;
                                                Navigator.pop(context, 'OK');
                                              })
                                        ],
                                      ));
                            }
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: Text("Status"),
                                      content: Text(
                                        "OTP did not matched, please try again or generate new one",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                            child: Text('OK',
                                                style: TextStyle(
                                                    color: Colors.indigo)),
                                            onPressed: () {
                                              Navigator.pop(context, 'OK');
                                            }),
                                      ],
                                    ));
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 10.0),
              child: Text(
                "🚨️ Do not share your OTP with anyone❗",
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 1.5,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

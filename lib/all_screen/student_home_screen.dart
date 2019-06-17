import 'package:flutter/material.dart';
import 'package:myfirst/all_screen/image_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';
void main() => runApp(new StudentHomeScreen());

class StudentHomeScreen extends StatefulWidget {
  @override
  _StudentHomeScreenState createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  void choiceAction(String choice) {
    if (choice == "Image Gallery") {
      setState(() {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ImageScreen()));
      });
    } else if (choice == "Sign Out") {
      setState(() {
        _showDialog();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              PopupMenuButton<String>(
                onSelected: choiceAction,
                itemBuilder: (BuildContext context) {
                  return popup.choice.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              ),

            ],
            backgroundColor: Colors.blue,
            title: Text("Schedule"),
            centerTitle: true,
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Divider(
                    indent: 0.0,
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.blue,
                        size: 30.0,
                      )),
                      Align(
                        alignment: Alignment.center,
                        child: Text("23 May",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 20.0)),
                      ),
                      IconButton(
                          icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blue,
                        size: 30.0,
                      )),
                    ],
                  ),
                  Divider(
                    indent: 0.0,
                    height: 20.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Colors.orange,
                            size: 40.0,
                          ),
                          Text(
                            "Ahmedabad University, GICT Building, Central Campus, Navrangpura, Ahmedabad, Gujarat 380009",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                    indent: 0.0,
                    height: 40.0,
                  ),
                  /*Write down your card code here sir*/
                ],
              ),
            ),
          )),
    );
  }
/*for Sign Out*/
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.info_outline,
                color: Colors.deepOrange,
                size: 30.0,
              ),
              new Text("Logging Out"),
            ],
          ),
          content: new Text("Do you want to log out?"),
          actions: <Widget>[
            FlatButton(
              child: Text('Log Out',
                  style: TextStyle(color: Color(0xffe71827))),
              onPressed: () async {
                var pref =
                await SharedPreferences.getInstance();
                pref.clear().then((boolVal) {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                      this.context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                });
              },
            ),
            FlatButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: Text("Cancel", style: TextStyle(color: Colors.black),))
          ],
        );
      },
    );
  }
}

/*For popup menu*/
class popup {
  static const String Images = "Image Gallery";
  static const String SignOut = "Sign Out";
  static const List<String> choice = <String>[Images, SignOut];
}
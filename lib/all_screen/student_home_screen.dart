import 'package:flutter/material.dart';
import 'package:myfirst/all_screen/image_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';
import 'package:http/http.dart' as http;
import 'Events.dart';
import 'dart:convert';
import 'resources.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/services.dart';
import 'package:myfirst/all_screen/important_contact.dart';

Set<String> eventDates = new Set();
List<Event> events;
bool apiCall = false, timedOut = false, isRegistered = true, isPageView = true;
String email,
    grp,
    batch,
    circle,
    facultyAdvisor,
    emailFacultyAdvisor,
    studentMitra,
    emailStudentMitra,
    mobileStudentMitra;

class StudentHomeScreen extends StatefulWidget {
  @override
  _StudentHomeScreenState createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  SharedPreferences prefs;
  PageController _controller = PageController(initialPage: 0, keepPage: false);

  void choiceAction(String choice) {
    if (choice == "Campus Guide") {
      HapticFeedback.lightImpact();
      setState(() {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ImageScreen()));
      });
    } else if (choice == "Sign Out") {
      setState(() {
        HapticFeedback.heavyImpact();
        _showDialog();
      });
    } else if (choice == "Refresh") {
      HapticFeedback.lightImpact();
      setState(() {
        apiCall = true;
        getGroup();
      });
    } else if (choice == "Contact Details") {
      HapticFeedback.lightImpact();
      setState(() {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ContactDeatils()));
      });
    }
  }

  _StudentHomeScreenState() {
    apiCall = true;
    isRegistered = true;
    getGroup();
  }

  Future<bool> getGroup() async {
    var prefs = SharedPreferences.getInstance();
    prefs.then((val) async {
      setState(() {
        email = val.getString("email");
      });
      try {
        final url =
            'http://${Resource.ip}:8080/JavaAPI/rest/services/getGroup/$email';
        await http
            .get(
          Uri.encodeFull(url),
        )
            .then((res) {
          if (res.body == "No Registered") {
            print(res.body);
            setState(() {
              isRegistered = false;
              apiCall = false;
            });
          } else {
            setState(() {
              grp = res.body.split(",")[0];
              batch = res.body.split(",")[1];
              circle = res.body.split(",")[2];
              facultyAdvisor = res.body.split(",")[3];
              emailFacultyAdvisor = res.body.split(",")[4];
              studentMitra = res.body.split(",")[5];
              emailStudentMitra = res.body.split(",")[6];
              mobileStudentMitra = res.body.split(",")[7];
              isRegistered = true;
            });
            getData().then((val) {
              setState(() {
                apiCall = false;
              });
            });
          }
        }).timeout(
                Duration(
                  seconds: 20, //Set timeout to 20 seconds
                ), onTimeout: () {
          setState(() {
            timedOut = true;
          });
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    title: Text("Status"),
                    content: Text(
                      "It takes too long than usual, please referesh.",
                      style: TextStyle(color: Color(0xffe71827)),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('OK',
                            style: TextStyle(color: Color(0xff292664))),
                        onPressed: () {
                          Navigator.pop(context, 'OK');
                        },
                      )
                    ],
                  )).then((val) {
            setState(() {
              apiCall = false;
            });
          });
        });
        return isRegistered;
      } catch (e) {
        setState(() {
          apiCall = false;
        });
        if (timedOut == false) {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    title: Text("Status"),
                    content: Text(
                      "Server could not be reached ⚠️",
                      style: TextStyle(color: Color(0xffe71827)),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('OK',
                            style: TextStyle(color: Color(0xff292664))),
                        onPressed: () {
                          Navigator.pop(context, 'OK');
                        },
                      )
                    ],
                  )).then((val) {
            setState(() {
              apiCall = false;
            });
          });
        }
        setState(() {
          timedOut = false;
        });
        return false;
      }
    });

    return false;
  }

  Future<bool> getData() async {
    try {
      final url =
          'http://${Resource.ip}:8080/JavaAPI/rest/services/getAllEvent';
      await http.get(
        Uri.encodeFull(url),
        headers: {"Content-Type": "application/json"},
      ).then((res) {
        final List parsedList = json.decode(res.body);
        setState(() {
          if (events != null) {
            events.clear();
            eventDates.clear();
          }
          events = parsedList.map((val) => Event.fromJson(val)).toList();
          events.forEach((e) {
            if (e.grp == grp &&
                (e.batch == batch ||
                    e.batch == "BOTH" ||
                    e.batch == "null" ||
                    e.batch == "" ||
                    e.batch == null)) eventDates.add(e.date);
          });
        });
      }).timeout(
          Duration(
            seconds: 20, //Set timeout to 20 seconds
          ), onTimeout: () {
        setState(() {
          timedOut = true;
        });
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  title: Text("Status"),
                  content: Text(
                    "It takes too long than usual, please referesh.",
                    style: TextStyle(color: Color(0xffe71827)),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('OK',
                          style: TextStyle(color: Color(0xff292664))),
                      onPressed: () {
                        Navigator.pop(context, 'OK');
                      },
                    )
                  ],
                )).then((val) {
          setState(() {
            apiCall = false;
          });
        });
      });
      return true;
    } catch (e) {
      setState(() {
        apiCall = false;
      });
      if (timedOut == false) {
        showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  title: Text("Status"),
                  content: Text(
                    "Server could not be reached ⚠️",
                    style: TextStyle(color: Color(0xffe71827)),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('OK',
                          style: TextStyle(color: Color(0xff292664))),
                      onPressed: () {
                        Navigator.pop(context, 'OK');
                      },
                    )
                  ],
                )).then((val) {
          setState(() {
            apiCall = false;
          });
        });
      }
      setState(() {
        timedOut = false;
      });
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.info_outline),
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              title: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[
                                    Center(
                                        child: Icon(
                                      Icons.sentiment_satisfied,
                                      size: 40.0,
                                    )),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30.0),
                                    ),
                                    Center(
                                      child: Text("Information Box"),
                                    ),
                                  ],
                                ),
                              ),

                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      title: Text(
                                        "Your Group",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      subtitle: Text("$grp",style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400)),
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      height: 5.0,
                                    ),

                                    ListTile(
                                      title: Text(
                                        "Your Friend Circle",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      subtitle: Text("$circle",style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400)),
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      height: 5.0,
                                    ),

                                    ListTile(
                                      title: Text(
                                        "Faculty Advisor",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      subtitle: Text("$facultyAdvisor",style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400)),
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      height: 5.0,
                                    ),

                                    ListTile(
                                      title: Text(
                                        "Email of Faculty Advisor",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      subtitle: Text("$emailFacultyAdvisor",style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400)),
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      height: 5.0,
                                    ),

                                    ListTile(
                                      title: Text(
                                        "Student Mitra",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      subtitle: Text("$studentMitra",style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400)),
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      height: 5.0,
                                    ),

                                    ListTile(
                                      title: Text(
                                        "Email of Student Mitra",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      subtitle: Text("$emailStudentMitra",style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400)),
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      height: 5.0,
                                    ),

                                    ListTile(
                                      title: Text(
                                        "Mobile of Student Mitra",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      subtitle: Text("$mobileStudentMitra",style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400)),
                                    ),
                                    Divider(
                                      color: Colors.black,
                                      height: 5.0,
                                    ),

                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('OK',
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 15.0)),
                                  onPressed: () {
                                    Navigator.pop(context, 'OK');
                                  },
                                )
                              ],
                            ));
                  }),
              IconButton(
                color: Colors.white,
                icon: isPageView
                    ? Icon(Icons.format_list_bulleted)
                    : Icon(Icons.pageview),
                onPressed: isPageView
                    ? () {
                  HapticFeedback.lightImpact();
                        setState(() {
                          isPageView = false;
                        });
                      }
                    : () {
                  HapticFeedback.lightImpact();
                        setState(() {
                          isPageView = true;
                        });
                      },
              ),
              PopupMenuButton<String>(
                onSelected: choiceAction,
                itemBuilder: (BuildContext context) {
                  return PopUp.choice.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: choice == "Sign Out"
                          ? Text(
                              choice,
                              style: TextStyle(color: Color(0xffe71827)),
                            )
                          : Text(choice),
                    );
                  }).toList();
                },
              ),
            ],
            backgroundColor: Color(0xff292664),
            title: SingleChildScrollView(scrollDirection: Axis.horizontal,child: Text("Orientation App")),
            bottom: apiCall
                ? MyLinearProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Color(0xff292664)),
                  )
                : null,
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0, // has the effect of softening the shadow
                      spreadRadius:
                          1.0, // has the effect of extending the shadow
//                      offset: Offset(
//                        10.0, // horizontal, move right 10
//                        10.0, // vertical, move down 10
//                      ),
                    )
                  ],
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                ),
                height: 40.0,
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      "Welcome $email",
//                style: TextStyle( color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: Center(
            child: apiCall == false
                ? isRegistered
                    ? events != null
                        ? events.isEmpty
                            ? Text(
                                "No activities are available",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              )
                            : isPageView
                                ? PageView.builder(
                                    controller: _controller,
                                    itemBuilder: _buildEventDatePage,
                                    itemCount: eventDates.length,
                                  )
                                : ListView.builder(
                                    itemBuilder: _buildEventDateExpansionTile,
                                    itemCount: eventDates.length,
                                  )
                        : Text(
                            "Server could not reached, \nplease try again",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          )
                    : Text(
                        "You are not registered by admin,\n please contact administration",
                        style: TextStyle(fontSize: 20.0),
                      )
                : Text(
                    "Please wait...",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
          )),
    );
  }

  Widget _buildEventDateExpansionTile(BuildContext context, int index) {
    return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black))),
          child: ExpansionTile(
            title: Text(
              "${eventDates.elementAt(index)}",
              style: Theme.of(context).textTheme.title,
            ),
            children: events.isEmpty
                ? <Widget>[Text("Please wait...")]
                : createList(eventDates.elementAt(index)),
          ),
        ));
  }

  Widget _buildEventDatePage(BuildContext context, int index) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Divider(
              height: 10.0,
              color: Colors.transparent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xff292664),
                    size: 30.0,
                  ),
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    _controller.previousPage(
                        duration: Duration(milliseconds: 500),
                        curve: Cubic(10, 10, 10, 10));
                  },
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text("${eventDates.elementAt(index)}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                ),
                IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xff292664),
                      size: 30.0,
                    ),
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Cubic(10, 10, 10, 10));
                    }),
              ],
            ),
            Divider(
              color: Colors.transparent,
              indent: 0.0,
              height: 10.0,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Color(0xff292664),
                      size: 40.0,
                    ),
                    Text(
                      "${events.where((e) => e.date == eventDates.elementAt(index)).elementAt(0).venue}",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w400),
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
            Column(
              children: createList(eventDates.elementAt(index)),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> createList(String date) {
    List<Widget> list = new List();
    int p;
    Iterable<Event> dateWiseEvents = events.where((e) =>
        e.date == date &&
        e.grp == grp &&
        (e.batch == batch ||
            e.batch == "BOTH" ||
            e.batch == "null" ||
            e.batch == "" ||
            e.batch == null));

//    var dateWiseEventsList = dateWiseEvents.toList();
//    dateWiseEventsList.sort((a, b) {
//      return a.startTime.compareTo(b.startTime);
//    });
//    dateWiseEventsList.forEach((e) {
//      print("Start ttime: ${e.startTime} ");
//    });
    dateWiseEvents.forEach((e) {
      list.add(Slidable(
        key: Key("${e.id}"),
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        actions: <Widget>[],
        secondaryActions: <Widget>[],
        child: InkWell(
          highlightColor: Color(0xff292664),
          onLongPress: () async {
            HapticFeedback.lightImpact();
            showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      title: Text(
                        e.activity,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      content: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Venue: ${e.venue}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            e.description == "null" || e.description == ""
                                ? Text("\n\nNo description")
                                : Text("\n\n" + e.description),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('OK',
                              style: TextStyle(color: Color(0xff292664))),
                          onPressed: () {
                            Navigator.pop(context, 'OK');
                          },
                        )
                      ],
                    ));
          },
          child: Card(
            elevation: 5.0,
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              title: Text(
                e.activity,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xff292664)),
              ),
              subtitle: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(e.startTime),
                      Text(
                        " TO ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(e.endTime),
                      /*Text(
                        " | ",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Text("Group: ${e.grp}"),
                      Text(
                        " | ",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      e.batch == "null" || e.batch == "" || e.batch == null
                          ? Text("")
                          : Text("${e.batch}"),*/
                    ],
                  ),
                  Row(
                    children: <Widget>[Text("")],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Long press for ",
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10.0),
                      ),
                      Text(
                        "Venue ",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                            color: Colors.black),
                      ),
                      Text(
                        "& ",
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 10.0),
                      ),
                      Text(
                        "Description ",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                            color: Colors.black),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ));
    });
    return list;
  }

/*for Sign Out*/
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.exit_to_app,
                color: Color(0xffe71827),
                size: 30.0,
              ),
            ],
          ),
          content: new Text("Are you sure you want to \nsign out ?"),
          actions: <Widget>[
            FlatButton(
              child:
                  Text('Sign Out', style: TextStyle(color: Color(0xffe71827))),
              onPressed: () async {
                var pref = await SharedPreferences.getInstance();
                pref.clear().then((boolVal) {
                  Navigator.pop(context);
                  Navigator.pushReplacement(this.context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                });
              },
            ),
            FlatButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        );
      },
    );
  }
}

/*For popup menu*/
class PopUp {
  static const List<String> choice = <String>[
    "Refresh",
    "Campus Guide",
    "Contact Details",
    "Sign Out"
  ];
}

const double _kMyLinearProgressIndicatorHeight = 6.0;

class MyLinearProgressIndicator extends LinearProgressIndicator
    implements PreferredSizeWidget {
  MyLinearProgressIndicator({
    Key key,
    double value,
    Color backgroundColor,
    Animation<Color> valueColor,
  }) : super(
          key: key,
          value: value,
          backgroundColor: backgroundColor,
          valueColor: valueColor,
        ) {
    preferredSize = Size(double.infinity, _kMyLinearProgressIndicatorHeight);
  }

  @override
  Size preferredSize;
}

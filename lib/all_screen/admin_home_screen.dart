import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Events.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'admin_full_screen_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';
import 'resources.dart';
import 'admin_insert_full_screen_dialog.dart';
import 'package:flutter/rendering.dart';

final String ip = Resource.ip;
Set<String> eventDates = new Set();
List<Event> events;
bool apiCall = false, timedOut = false;

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  _AdminHomeState() {
    apiCall = true;
    getData().then((val) {
      setState(() {
        apiCall = false;
      });
    });
  }

  String selectedGroupRadio = "Both";
  String selectedBatchRadio = "Both";

  setSelectedGroupRadio(String val) {
    setState(() {
      selectedGroupRadio = val;
      print("Group: $selectedGroupRadio");
    });
  }

  setSelectedBatchRadio(String val) {
    setState(() {
      selectedBatchRadio = val;
      print("Batch: $selectedBatchRadio");
    });
  }

  Future<bool> getData() async {
    try {
      final url = 'http://$ip:8080/JavaAPI/rest/services/getAllEvent';
      await http.get(
        Uri.encodeFull(url),
        headers: {"Content-Type": "application/json"},
      ).then((res) {
        final List parsedList = json.decode(res.body);
        setState(() {
//          apiCall = false;
          if (events != null) {
            events.clear();
            eventDates.clear();
          }
          events = parsedList.map((val) => Event.fromJson(val)).toList();
          events.forEach((e) {
            eventDates.add(e.date);
          });
        });
      }).timeout(
          Duration(
            seconds: 20, //Set timeout to 10 seconds
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
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Activities",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xff292664),
          actions: <Widget>[
            apiCall == false
                ? IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      setState(() {
                        apiCall = true;
                        getData().then((val) {
                          setState(() {
                            apiCall = false;
                          });
                        });
                      });
                    },
                    tooltip: "Refresh",
                    color: Colors.white,
                  )
                : Text(""),
            /*IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          title: Text("Filters"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text("Group"),
                              Divider(
                                color: Colors.black,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Radio(
                                      value: "A",
                                      activeColor: Color(0xff292664),
                                      groupValue: selectedGroupRadio,
                                      onChanged: (val) {
                                        setSelectedGroupRadio(val);
                                      },
                                    ),
                                    Text(
                                      "A",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20.0),
                                    ),
                                    Radio(
                                      value: "B",
                                      activeColor: Color(0xff292664),
                                      groupValue: selectedGroupRadio,
                                      onChanged: (val) {
                                        setSelectedGroupRadio(val);
                                      },
                                    ),
                                    Text(
                                      "B",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20.0),
                                    ),
                                    Radio(
                                      value: "Both",
                                      activeColor: Color(0xff292664),
                                      groupValue: selectedGroupRadio,
                                      onChanged: (val) {
                                        setSelectedGroupRadio(val);
                                      },
                                    ),
                                    Text(
                                      "Both",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20.0),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.transparent,
                              ),
                              Text("Batch"),
                              Divider(
                                color: Colors.black,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Radio(
                                      value: "1",
                                      activeColor: Color(0xff292664),
                                      groupValue: selectedBatchRadio,
                                      onChanged: (val) {
                                        setSelectedBatchRadio(val);
                                      },
                                    ),
                                    Text(
                                      "1",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20.0),
                                    ),
                                    Radio(
                                      value: "2",
                                      activeColor: Color(0xff292664),
                                      groupValue: selectedBatchRadio,
                                      onChanged: (val) {
                                        setSelectedBatchRadio(val);
                                      },
                                    ),
                                    Text(
                                      "2",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20.0),
                                    ),
                                    Radio(
                                      value: "Both",
                                      activeColor: Color(0xff292664),
                                      groupValue: selectedBatchRadio,
                                      onChanged: (val) {
                                        setSelectedBatchRadio(val);
                                      },
                                    ),
                                    Text(
                                      "Both",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            RaisedButton(
                              child: Text('Apply',
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                Navigator.pop(context, 'OK');
                              },
                              color: Color(0xff292664),
                            )
                          ],
                        ));
              },
              tooltip: "Filters",
            ),*/
            /*PopupMenuButton(
              itemBuilder: (context) {
                var list = List<PopupMenuEntry<Object>>();
                list.add(PopupMenuItem(child: Text("Group")));
              },
            ),*/
            /*Log Out Button*/
            IconButton(
              icon: Icon(Icons.power_settings_new),
              color: Color(0xffe71827),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
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
                          content: Text(
                            "Are you sure you want to \nsign out ?",
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Sign Out',
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
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.black),
                                ))
                          ],
                        ));
              },
              tooltip: "Sign Out",
            )
          ],
          bottom: apiCall
              ? MyLinearProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Color(0xff292664)),
                )
              : null,
        ),
        body: Container(
          child: Center(
            child: apiCall == false
                ? events != null
                    ? Stack(
                        children: <Widget>[
                          events.isEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Center(
                                      child: Text(
                                        "No activities are available",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : EventDetailsExpansionTile(),
                          Container(
                            padding: EdgeInsets.all(20.0),
                            alignment: Alignment.bottomRight,
                            child: FloatingActionButton(
                                onPressed: () async {
                                  Navigator.of(context)
                                      .push(new MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return AdminInsertFullscreenDialog();
                                    },
                                    fullscreenDialog: true,
                                  ))
                                      .then((val) {
                                    setState(() {
                                      getData();
                                    });
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 30.0,
                                  color: Color(0xffe71827),
                                ),
                                backgroundColor: Color(0xff292664)),
                          ),
                        ],
                      )
                    : Text(
                        "Server could not reached, please try again",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      )
                : Text(
                    "Please wait...",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
          ),
        ));
  }
}

class EventDetailsExpansionTile extends StatefulWidget {
  List<Event> events = new List();
  //Set<String> eventDates = new Set();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EventDetailsExpansionTileState(/*events: events*/);
  }
}

class EventDetailsExpansionTileState extends State {

  bool undoValue = false;


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

  void deleteEvent(Event e) async {
    final url = 'http://$ip:8080/JavaAPI/rest/services/deleteEvent/${e.id}';
    var delete = await http.delete(
      Uri.encodeFull(url),
      headers: {"Content-Type": "application/json"},
    );
    var res = delete.body;
    if (res == "Error") {
      Scaffold.of(this.context).showSnackBar(
          SnackBar(content: Text("Error occured while deleting event")));
    }
  }

  List<Widget> createList(String date) {
    List<Widget> list = new List();
    int p;
    Iterable<Event> dateWiseEvents = events.where((e) => e.date == date);
    dateWiseEvents.forEach((e) {
      list.add(Slidable(
        key: Key("${e.id}"),
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        actions: <Widget>[
          IconButton(
              tooltip: "Delete",
              icon: Icon(
                Icons.delete,
                color: Color(0xffe71827),
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          title: Text("Action"),
                          content: Text(
                              "Are you sure you want to delete this event ?"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text(
                                "No",
                                style: TextStyle(color: Color(0xff292664)),
                              ),
                              onPressed: () {
                                undoValue = false;
                                Navigator.pop(context);
                              },
                            ),
                            FlatButton(
                              child: Text(
                                "Yes, delete it.",
                                style: TextStyle(color: Color(0xffe71827)),
                              ),
                              onPressed: () {
                                setState(() {
                                  undoValue = false;
                                  p = events.indexWhere((e1) => e1.id == e.id);
                                  events.removeAt(
                                      events.indexWhere((e1) => e1.id == e.id));
                                  dateWiseEvents =
                                      events.where((e) => e.date == date);
                                  if (dateWiseEvents.isEmpty)
                                    eventDates.remove(date);
                                });
                                Navigator.pop(context);
                                Scaffold.of(this.context)
                                    .showSnackBar(SnackBar(
                                      content: Text("Event Deleted"),
                                      action: SnackBarAction(
                                          label: "Undo",
                                          onPressed: () {
                                            setState(() {
                                              events.insert(p, e);
                                              eventDates.add(date);
                                              undoValue = true;
                                            });
                                          }),
                                    ))
                                    .closed
                                    .then((x) {
                                  if (undoValue == false) {
                                    deleteEvent(e);
                                  }
                                });
                              },
                            )
                          ],
                        ));
              })
        ],
        secondaryActions: <Widget>[
          IconButton(
              tooltip: "Update",
              icon: Icon(
                Icons.edit,
                color: Color(0xff292664),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AdminFullscreenDialog(
                      event: e,
                    );
                  },
                  fullscreenDialog: true,
                ))
                    .then((val) {
                  setState(() {
                    getData();
                  });
                });
              })
        ],
        child: InkWell(
          highlightColor: Color(0xff292664),
          onLongPress: () {
            showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      title: Text(e.activity),
                      content: SingleChildScrollView(
                        child: e.description == "null" || e.description == ""
                            ? Text("No description")
                            : Text(e.description),
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
                  Divider(
                    color: Colors.transparent,
                    height: 2.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text(e.startTime),
                      Text(
                        " TO ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(e.endTime),
                      Text(
                        " | ",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: 2.0,
                  ),
                  Row(
                    children: <Widget>[
                      Text("Group: ${e.grp}"),
                      Text(
                        " | ",
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      e.batch == "null" || e.batch == "" || e.batch == null
                          ? Text("")
                          : Text("${e.batch}"),
                    ],
                  ),
                  Divider(
                    color: Colors.transparent,
                    height: 5.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Swipe right to ",
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 10.0),
                        ),
                        Text(
                          "Delete ",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.0,
                              color: Color(0xffe71827)),
                        ),
                        Text(
                          "& left to ",
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 10.0),
                        ),
                        Text(
                          "Update ",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.0,
                              color: Color(0xff292664)),
                        ),
                        Text(
                          ", long press for ",
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
                        ),
                      ],
                    ),
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

  Future<bool> getData() async {
    try {
      final url = 'http://$ip:8080/JavaAPI/rest/services/getAllEvent';
      await http.get(
        Uri.encodeFull(url),
        headers: {"Content-Type": "application/json"},
      ).then((res) {
        final List parsedList = json.decode(res.body);
        setState(() {
          eventDates.clear();
          if (events != null) {
            events.clear();
            eventDates.clear();
          }
          events = parsedList.map((val) => Event.fromJson(val)).toList();
          events.forEach((e) {
            eventDates.add(e.date);
          });
        });
      }).timeout(
          Duration(
            seconds: 10, //Set timeout to 10 seconds
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
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemBuilder: _buildEventDateExpansionTile,
      itemCount: eventDates.length,
    );
  }
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

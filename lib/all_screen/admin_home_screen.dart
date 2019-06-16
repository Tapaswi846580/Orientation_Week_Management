import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Events.dart';
import 'dart:io';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'update_event_full_screen_dialog.dart';

import 'admin_full_screen_dialog.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

final String ip = "192.168.0.106";
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
          if (events != null) events.clear();
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
                  title: Text("Status"),
                  content: Text(
                    "It takes too long than usual, please referesh.",
                    style: TextStyle(color: Color(0xffe71827)),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('OK', style: TextStyle(color: Color(0xff292664))),
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
                  title: Text("Status"),
                  content: Text(
                    "Server could not be reached ⚠️",
                    style: TextStyle(color: Color(0xffe71827)),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('OK', style: TextStyle(color: Color(0xff292664))),
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
            /*IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () => getData(),
              tooltip: "Refresh",
            ),*/
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
            /**/
            IconButton(
              icon: Icon(Icons.power_settings_new),
              color: Colors.white,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: Text("Log Out"),
                          content: Text(
                            "Are you sure you want to \nlog out ?",
                          ),
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
                        ));
              },
              tooltip: "Log Out",
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
                                    Text(
                                      "No events are available",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                )
                              : EventDetailsExpansionTile(
                                  events: events,
                                ),
                          Container(
                            padding: EdgeInsets.all(20.0),
                            alignment: Alignment.bottomRight,
                            child: FloatingActionButton(
                                onPressed: () async {},
                                child: Icon(
                                  Icons.add,
                                  size: 30.0,
                                  color: Color(0xffe71827),
                                ),
                                backgroundColor: Color(0xff292664)),
                          ),
                        ],
                      )
                    : Text("Server could not reached, please try again")
                : Text("Please wait..."),
          ),
        ));
  }
}

class EventDetailsExpansionTile extends StatefulWidget {
  List<Event> events = new List();
  //Set<String> eventDates = new Set();
  EventDetailsExpansionTile({@required this.events});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EventDetailsExpansionTileState(/*events: events*/);
  }
}

class EventDetailsExpansionTileState extends State {
//  List<Events> events = new List();
  bool undoValue = false;
//  EventDetailsExpansionTileState({@required this.events});
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
                      Text("Group: ${e.grp}")
                    ],
                  ),
                  Row(
                    children: <Widget>[Text("")],
                  ),
                  Row(
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
                            fontSize: 10.0),
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
                            fontSize: 10.0),
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
                            fontSize: 10.0),
                      ),
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

  Future<bool> getData() async {
    try {
      final url = 'http://$ip:8080/JavaAPI/rest/services/getAllEvent';
      await http.get(
        Uri.encodeFull(url),
        headers: {"Content-Type": "application/json"},
      ).then((res) {
        final List parsedList = json.decode(res.body);
        setState(() {
          if (events != null) events.clear();
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
                  title: Text("Status"),
                  content: Text(
                    "It takes too long than usual, please referesh.",
                    style: TextStyle(color: Color(0xffe71827)),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('OK', style: TextStyle(color: Color(0xff292664))),
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
                  title: Text("Status"),
                  content: Text(
                    "Server could not be reached ⚠️",
                    style: TextStyle(color: Color(0xffe71827)),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('OK', style: TextStyle(color: Color(0xff292664))),
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

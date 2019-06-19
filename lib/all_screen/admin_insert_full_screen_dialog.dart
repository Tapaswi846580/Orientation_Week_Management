import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'Events.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'resources.dart';

class AdminInsertFullscreenDialog extends StatefulWidget {
  @override
  _AdminInsertFullscreenDialogState createState() =>
      _AdminInsertFullscreenDialogState();
}

class _AdminInsertFullscreenDialogState extends State<AdminInsertFullscreenDialog> {

  final eventNameController = TextEditingController();
  final eventVenueController = TextEditingController();
  final eventDescriptionController = TextEditingController();
  final eventDateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  String selectedRadio = "A";
  bool apiCall = false, timedOut = false;
  static final postUrl =
      'http://${Resource.ip}:8080/JavaAPI/rest/services/addEvent';

  setSelectedRadio(String val) {
    setState(() {
      selectedRadio = val;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff292664),
          title: Text("Add Activity"),
          leading: IconButton(
            icon: new Icon(
              Icons.close,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
//            padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: TextField(
                        keyboardType: TextInputType.text,
//                            style: Theme.of(context).textTheme.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff292664)),

                        decoration: InputDecoration(
                          labelText: 'Activity Title*',
                          labelStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          prefixIcon: Icon(Icons.title),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffe71827)),
                          ),
                        ),
                        controller: eventNameController,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Group: ",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Radio(
                          value: "A",
                          activeColor: Color(0xff292664),
                          groupValue: selectedRadio,
                          onChanged: (val) {
                            setSelectedRadio(val);
                          },
                        ),
                        Text(
                          "A",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 20.0),
                        ),
                        Radio(
                          value: "B",
                          activeColor: Color(0xff292664),
                          groupValue: selectedRadio,
                          onChanged: (val) {
                            setSelectedRadio(val);
                          },
                        ),
                        Text(
                          "B",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 20.0),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: InkWell(
                        onTap: () {
                          showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2018),
                              lastDate: DateTime(2020))
                              .then((dt) {
                            var formatter = DateFormat("dd-MMMM-yyyy");
                            setState(() {
                              eventDateController.text = formatter.format(dt);
                              ;
                            });
                          });
                        },
                        child: /*Text("${event.date}")*/ TextField(
//                      inputType: InputType.date,
//                      format: DateFormat("dd-MMMM-yyyy"),
                          keyboardType: TextInputType.datetime,
                          enabled: false,

                          style: TextStyle(fontWeight: FontWeight.bold),
//                      editable: false,
//                            style: Theme.of(context).textTheme.title,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.date_range),
                            labelText: 'Date*',
                            labelStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffe71827)),
                            ),
                          ),
                          controller: eventDateController,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "From* ",
                                style: TextStyle(fontSize: 18.0),
                              ),
                              Container(
                                width: 120.0,
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.black))
                                ),
                                child: InkWell(
                                  onTap: () {
                                    showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now())
                                        .then((time) {
                                      setState(() {
                                        startTimeController.text =
                                            time.format(context);
                                      });
                                    });
                                  },
                                  child: TextField(
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                    enabled: false,
                                    controller: startTimeController,
                                  ),
                                ),
                              ),
                              Text(
                                "To* ",
                                style: TextStyle(fontSize: 18.0),
                              ),
                              Container(
                                width: 120.0,
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.black))
                                ),
                                child: InkWell(
                                  onTap: () {
                                    showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now())
                                        .then((time) {
                                      setState(() {
                                        endTimeController.text =
                                            time.format(context);
                                      });
                                    });
                                  },
                                  child: TextField(
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                    enabled: false,
                                    controller: endTimeController,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
//                                style: Theme.of(context).textTheme.body1,
                        decoration: InputDecoration(
                          labelText: 'Venue',
                          labelStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffe71827)),
                          ),
                        ),
                        controller: eventVenueController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
//                            style: Theme.of(context).textTheme.body1,
                        decoration: InputDecoration(
                          labelText: 'Event Description',
                          labelStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffe71827)),
                          ),
                        ),
                        controller: eventDescriptionController,
                      ),
                    ),
                    RaisedButton(
                      child: getProperWidget(),
                      onPressed: apiCall
                          ? null
                          : () async {
                        if (eventDateController.text.length != 0 &&
                            selectedRadio.length != 0 &&
                            startTimeController.text.length != 0 &&
                            endTimeController.text.length != 0 &&
                            eventNameController.text.length != 0 &&
                            eventVenueController.text.length != 0) {
                          try {
                            setState(() {
                              apiCall = true;
                            });
                            var data = {
                              'date': '${eventDateController.text}',
                              'grp': '$selectedRadio',
                              'startTime': '${startTimeController.text}',
                              'endTime': '${endTimeController.text}',
                              'activity': '${eventNameController.text}',
                              'description':
                              '${eventDescriptionController.text}',
                              'venue': '${eventVenueController.text}',
                            };
                            var post = await http.post(
                              Uri.encodeFull(postUrl),
                              body: json.encode(data),
                              headers: {
                                "Content-Type": "application/json"
                              },
                            ).timeout(
                                Duration(
                                  seconds: 20, //Set timeout to 20 seconds
                                ), onTimeout: () {
                              setState(() {
                                timedOut = true;
                              });
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                        title: Text("Status"),
                                        content: Text(
                                          "It is taking too long than usual, please try again.",
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text('OK',
                                                style: TextStyle(
                                                    color:
                                                    Color(0xff292664))),
                                            onPressed: () {
                                              Navigator.pop(
                                                  context, 'OK');
                                            },
                                          )
                                        ],
                                      ));
                            });
                            var res = post.body;
                            if (res == "Done") {
                              setState(() {
                                apiCall = false;
                              });
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: Text("Status"),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                        content: Text(
                                          "Activity Added ! 😉",
                                          style: TextStyle(
                                              color: Colors.green),
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text('OK',
                                                style: TextStyle(
                                                    color:
                                                    Color(0xff292664))),
                                            onPressed: () {
                                              Navigator.pop(
                                                  context, 'OK');
                                              Navigator.pop(
                                                  this.context, 'OK');
                                            },
                                          )
                                        ],
                                      ));
                            } else if (res == "Error") {
                              setState(() {
                                apiCall = false;
                              });
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: Text("Status"),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                        content: Text(
                                          "Somethin went wrong, please try again. :(",
                                          style: TextStyle(
                                              color: Color(0xffe71827)),
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text('OK',
                                                style: TextStyle(
                                                    color:
                                                    Color(0xff292664))),
                                            onPressed: () {
                                              Navigator.pop(
                                                  context, 'OK');
                                            },
                                          )
                                        ],
                                      ));
                            }else if(post.statusCode == 404){
                              setState(() {
                                apiCall = false;
                              });
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: Text("Status"),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                        content: Text(
                                          "Server could not be reached, please try again",
                                          style: TextStyle(
                                              color: Color(0xffe71827)),
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text('OK',
                                                style: TextStyle(
                                                    color:
                                                    Color(0xff292664))),
                                            onPressed: () {
                                              Navigator.pop(
                                                  context, 'OK');
                                            },
                                          )
                                        ],
                                      ));
                            }else{
                              setState(() {
                                apiCall = false;
                              });
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: Text("Status"),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                        content: Text(
                                          "Somethin went wrong, please try again. :(",
                                          style: TextStyle(
                                              color: Color(0xffe71827)),
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text('OK',
                                                style: TextStyle(
                                                    color:
                                                    Color(0xff292664))),
                                            onPressed: () {
                                              Navigator.pop(
                                                  context, 'OK');
                                            },
                                          )
                                        ],
                                      ));
                            }
                          } catch (e) {
                            setState(() {
                              apiCall = false;
                            });

                            if (timedOut == false) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: Text("Status"),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                        content: Text(
                                          "Server could not be reached ⚠️",
                                          style: TextStyle(
                                              color:Color(0xffe71827)),
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text('OK',
                                                style: TextStyle(
                                                    color:
                                                    Color(0xff292664))),
                                            onPressed: () {
                                              Navigator.pop(
                                                  context, 'OK');
                                            },
                                          )
                                        ],
                                      ));
                            }
                            setState(() {
                              timedOut = false;
                            });
                          }
                        }else{
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  AlertDialog(
                                    title: Text("Status"),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                    content: Text(
                                      "Please fill up all the mandatory fields.",
                                      style: TextStyle(
                                          color: Color(0xffe71827)),
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('OK',
                                            style: TextStyle(
                                                color:
                                                Color(0xff292664))),
                                        onPressed: () {
                                          Navigator.pop(
                                              context, 'OK');
                                        },
                                      )
                                    ],
                                  ));
                        }
                      },
                      color: Color(0xff292664),
                      disabledColor: Color(0xff292664),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

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
        "Add Activity",
        style: TextStyle(
            fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
      );
    }
  }
}

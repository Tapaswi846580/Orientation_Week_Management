import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'Events.dart';

class UpdateEventFullscreenDialog extends StatefulWidget{
  Event event;

  UpdateEventFullscreenDialog({@required this.event});

  @override
  _UpdateEventFullscreenDialogState createState() => _UpdateEventFullscreenDialogState(event:event);
}

class _UpdateEventFullscreenDialogState extends State<UpdateEventFullscreenDialog> {
  Event event;
  _UpdateEventFullscreenDialogState({@required this.event});
  List<DropdownMenuItem<String>> listdrop = [];
  String Selected = null;
  DateTime date2;
  DateTime date3;
  void loaddata() {
    listdrop = [];
    listdrop.add(
        DropdownMenuItem(
          child: Text(
            'A', textAlign: TextAlign.center,),
          value: 'A',
        ));
    listdrop.add(
        DropdownMenuItem(
          child: Text(
            'B', textAlign: TextAlign.center,),
          value: 'B',
        ));
  }
  String selectedRadio,selectedRadio1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadio = "A";
    selectedRadio1 = "GICT";
  }
  setSelectedRadio(String val){
    setState(() {
      selectedRadio = val;

    });
  }
  setSelectedRadio1(String val){
    setState(() {
      selectedRadio1 = val;

    });
  }
  @override
  Widget build(BuildContext context) {
    loaddata();
    // TODO: implement build
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.blueAccent,
      title: Text("Add Events"),
      centerTitle: true,
      leading: IconButton(
        icon: new Icon(Icons.close, color: Colors.white,size: 30.0,),
        onPressed: () => Navigator.of(context).pop(),
      ),

    ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 50.0,right: 50.0,top: 20.0),
                child: Column(
                  children: <Widget>[
                    new Divider(height: 5.0, color: Colors.black),
                    new Padding(
                      padding: new EdgeInsets.all(8.0),
                    ),
                    new Text(
                      'Select Group',
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Radio(
                          value: "A",
                          activeColor: Colors.green,
                          groupValue: selectedRadio,
                          onChanged: (val){
                            print("Select value $val");
                            setSelectedRadio(val);
                          },
                        ),
                        Text("A",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20.0),),
                        Radio(
                          value: "B",
                          activeColor: Colors.green,
                          groupValue: selectedRadio,
                          onChanged: (val){
                            print("Select value $val");
                            setSelectedRadio(val);
                          },
                        ),
                        Text("B",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20.0),),
                      ],
                    ),
                    new Divider(height: 5.0, color: Colors.black),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0,right: 50.0),
                child: DateTimePickerFormField(
                  inputType: InputType.date,
                  format: DateFormat("dd-MM-yyyy"),
                  initialDate: DateTime(2019, 1, 1),
                  editable: false,
                  decoration: InputDecoration(
                      hintText: 'Select Event Date',
                      labelText: 'Select Event Date',
                      prefixIcon: Icon(Icons.calendar_today,color: Colors.blue,),
                      hasFloatingPlaceholder: false
                  ),
                  onChanged: (dt) {
                    setState(() => date2 = dt);
                    print('Selected date: $date2');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0,right: 50.0),
                child: DateTimePickerFormField(
                  inputType: InputType.time,
                  format: DateFormat("HH:mm"),
                  initialTime: TimeOfDay(hour: 5, minute: 5),
                  editable: true,
                  decoration: InputDecoration(
                      labelText: 'Select Event Time',
                      prefixIcon: Icon(Icons.alarm,color: Colors.blue,),
                      hasFloatingPlaceholder: false
                  ),
                  onChanged: (dt) {
                    setState(() => date3 = dt);
                    print('Selected date: $date3');
                    print('Hour: $date3.hour');
                    print('Minute: $date3.minute');
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.0,right: 50.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.add,color: Colors.blue,),
                    labelText: 'Add Activity',
                  ),
                  maxLines: 5,
                  autofocus: false,
                ),
              ),

            ],
          ),
        ),
      ),
    );

  }

}

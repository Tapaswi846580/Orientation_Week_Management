import 'package:flutter/material.dart';

class AdminHomeFinal extends StatefulWidget {
  @override
  AdminHomeFinalState createState() => new AdminHomeFinalState();
}

class AdminHomeFinalState extends State<AdminHomeFinal> {
  // init the step to 0th position
  int current_step = 0;
  static String s = "welcome flutter xyz";
  List<Step> my_steps = [

    new Step(
        title: Row(
          children: <Widget>[
            Text("23/5/2019"),
            Icon(Icons.arrow_downward,size: 20.0,)
          ],
        ),
        content: Column(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              child: Padding(

                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Event name : "+s.toString(),style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w800),),
                    Divider(
                      color: Colors.black,
                      indent:1.0,
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("23/5/219",style: TextStyle(fontSize: 20.0,color: Colors.green),),
                        Divider(
                          color: Colors.black,
                          indent:30.0,
                          height: 10.0,
                        ),
                        Text("23/5/2019",style: TextStyle(fontSize: 20.0,color: Colors.green),),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      indent:1.0,
                      height: 10.0,
                    ),
                    Text("Okay. Was that hard?Maybe in the beginning, but once you get the hang of rows and columns, you can naturally breakdown layouts in your head.",style: TextStyle(fontSize: 20.0),),
                    Divider(
                      color: Colors.black,
                      indent:1.0,
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        RaisedButton(
                          child: const Text('UpDate'),
                          color: Colors.green,
                          elevation: 4.0,
                          splashColor: Colors.blueGrey,
                          onPressed: () {

                          },
                        ),
                        Divider(
                          height: 10.0,
                          indent: 20.0,
                        ),
                        RaisedButton(
                          child: const Text('Delete'),
                          color: Colors.green,
                          elevation: 4.0,
                          splashColor: Colors.blueGrey,
                          onPressed: () {

                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        isActive: true),

  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Appbar
      appBar: new AppBar(
        // Title
        title: new Text("Simple Material App"),
      ),
      // Body
      body: new Container(
        width: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[

              Stepper(
                currentStep: this.current_step,
                steps: my_steps,
                type: StepperType.vertical,
                onStepTapped: (step) {
                  setState(() {
                    if (current_step < my_steps.length - 1) {
                      current_step = current_step + 1;
                    } else {
                      current_step = 0;
                    }
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (current_step > 0) {
                      current_step = current_step - 1;
                    } else {
                      current_step = 0;
                    }
                  });
                },
                onStepContinue: () {
                  setState(() {
                  });
                },
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                  child: Icon(Icons.add,size: 30.0,),
                  backgroundColor: Color(0xff558fe0),
                ),
              ),

            ],

          )),
    );
  }
  /*void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Update Deatils"),
          content: Column(
            children: <Widget>[
              TextFormField(
                  decoration: InputDecoration(
                    labelText: "hey",
                  ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "hey",
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "hey",
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "hey",
                ),
              ),
            ],
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }*/
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageScreen extends StatefulWidget {
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Image Gallery"),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              /*1st*/
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/1.jpg'),
                  )),
                ),
              ),
              ExpansionTile(
                leading: Icon(
                  Icons.school,
                  color: Colors.redAccent,
                ),
                title: Text(
                  "School of Engineering and Applied Science",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                    child: Text(
                      "Address: Ahmedabad University, GICT Building, Central Campus, Navrangpura, Ahmedabad, Gujarat 380009",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              AllCallMap()._callMe();
                            });
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.phone,
                                color: Colors.blueAccent,
                              ),
                              Text(
                                "Call",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                          indent: 100.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              AllCallMap()._launchMaps();
                            });
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.map,
                                color: Colors.blueAccent,
                              ),
                              Text(
                                "Map",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                    child: Text(
                      "The School of Engineering and Applied Science, Ahmedabad University, "
                      "offers BTech, MTech and PhD programmes in a range of disciplines.",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.black45,
                height: 20.0,
              ),
              /*2*/
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/1.jpg'),
                  )),
                ),
              ),
              ExpansionTile(
                leading: Icon(
                  Icons.school,
                  color: Colors.redAccent,
                ),
                title: Text(
                  "Amrut Mody School of Management",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                    child: Text(
                      "Address: Ahmedabad University, GICT Building, Central Campus, Navrangpura, Ahmedabad, Gujarat 380009",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              AllCallMap()._callMe();
                            });
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.phone,
                                color: Colors.blueAccent,
                              ),
                              Text(
                                "Call",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                          indent: 100.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              AllCallMap()._launchMaps();
                            });
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.map,
                                color: Colors.blueAccent,
                              ),
                              Text(
                                "Map",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                    child: Text(
                      "The Amrut Mody School of Management offers wide-ranging,"
                      " multi-faceted management education through undergraduate,"
                      " graduate and doctoral programmes. We also offer short-term "
                      "certificate programmes for working professionals and other practitioners.",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.black45,
                height: 20.0,
              ),
              /*3*/
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/dbls.jpg'),
                  )),
                ),
              ),
              ExpansionTile(
                leading: Icon(
                  Icons.school,
                  color: Colors.redAccent,
                ),
                title: Text(
                  "Biological & Life Sciences, School of Arts and Sciences, Ahmedabad University",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                    child: Text(
                      "Address: Ahmedabad University Central Campus, Navrangpura, Ahmedabad, Gujarat 380009",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              AllCallMap()._callMeBiological();
                            });
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.phone,
                                color: Colors.blueAccent,
                              ),
                              Text(
                                "Call",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                          indent: 100.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              AllCallMap()._launchMapsBiological();
                            });
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.map,
                                color: Colors.blueAccent,
                              ),
                              Text(
                                "Map",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                    child: Text(
                      "The School of Arts and Sciences at Ahmedabad University is "
                      "in the process of being built, physically and institutionally."
                      " It will help to form the core of the University’s educational "
                      "experience. We will offer undergraduate and graduate learning to"
                      " the highest academic standards in a variety of disciplines, spanning "
                      "the range from visual arts to life sciences, from mathematics to history.",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.black45,
                height: 20.0,
              ),
              /*4*/
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/chm.jpg'),
                  )),
                ),
              ),
              ExpansionTile(
                leading: Icon(
                  Icons.school,
                  color: Colors.redAccent,
                ),
                title: Text(
                  "Centre for Heritage Management (CHM)",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                    child: Text(
                      "Address: Asmita Bhavan, Central Campus, Navrangpura, Ahmedabad, Gujarat 380009",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              AllCallMap()._callMeCHM();
                            });
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.phone,
                                color: Colors.blueAccent,
                              ),
                              Text(
                                "Call",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                          indent: 100.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              AllCallMap()._launchMapsCHM();
                            });
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.map,
                                color: Colors.blueAccent,
                              ),
                              Text(
                                "Map",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                    child: Text(
                      "To foster critical discourses on the broader domain of heritage, and to"
                      " promote a holistic heritage management approach as a guidance"
                      " for sustainable and just social development.",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.black45,
                height: 20.0,
              ),

              /*5*/
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/VS.jpg'),
                  )),
                ),
              ),
              ExpansionTile(
                leading: Icon(
                  Icons.school,
                  color: Colors.redAccent,
                ),
                title: Text(
                  "Venture Studio, Ahmedabad University",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                    child: Text(
                      "Address: AG Teacher's School Campus, Near Hanuman Temple, Commerce Six Road, Navrangpura, Ahmedabad, Gujarat 380009",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              AllCallMap()._callMeVS();
                            });
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.phone,
                                color: Colors.blueAccent,
                              ),
                              Text(
                                "Call",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                          indent: 100.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              AllCallMap()._launchMapsVS();
                            });
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.map,
                                color: Colors.blueAccent,
                              ),
                              Text(
                                "Map",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                    child: Text(
                      "VentureStudio is a startup incubator established by Ahmedabad University "
                      "in active collaboration with Stanford University – Centre for Design Research."
                      " Since its inception in 2011, VentureStudio has helped incubate over 45 "
                      "ventures in domains ranging health, education, energy and the environment "
                      "to the agriculture industry, consumer products, transportation and more",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.black45,
                height: 20.0,
              ),
              /*6*/
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.linearToSrgbGamma(),
                    image: AssetImage('images/scs1.jpg'),
                  )),
                ),
              ),
              ExpansionTile(
                leading: Icon(
                  Icons.school,
                  color: Colors.redAccent,
                ),
                title: Text(
                  "School of Computer Studies, Ahmedabad University",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                    child: Text(
                      "Address: A.G. Campus Commerce Six Roads, University Road, Vasant Vihar, Navrangpura, Ahmedabad, Gujarat 380009",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              AllCallMap()._callMeSCS();
                            });
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.phone,
                                color: Colors.blueAccent,
                              ),
                              Text(
                                "Call",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                          indent: 100.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              AllCallMap()._launchMapsSCS();
                            });
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.map,
                                color: Colors.blueAccent,
                              ),
                              Text(
                                "Map",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                    child: Text(
                      "Currently, we offer a post-graduate Master of Computer Applications programme"
                      " and a five-year integrated MCA programme. Both feature contemporary,"
                      " industry-oriented curricula and aim to prepare students for "
                      "excellent professional careers in the IT industry.",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.black45,
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AllCallMap {
  _callMe() async {
    // Android
    const uri = 'tel:07961911000';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      const uri = 'tel:07961911000';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  _launchMaps() async {
    String googleUrl =
        'https://www.google.com/maps/place/School+of+Engineering+and+Applied+Science/@23.0372641,72.5521125,15z/data=!4m2!3m1!1s0x0:0x4404c5fac85ee456?sa=X&ved=2ahUKEwjMr9Ka-9viAhXCW3wKHRweBiAQ_BIwD3oECA0QCA';
    String appleUrl =
        'https://www.google.com/maps/place/School+of+Engineering+and+Applied+Science/@23.0372641,72.5521125,15z/data=!4m2!3m1!1s0x0:0x4404c5fac85ee456?sa=X&ved=2ahUKEwjMr9Ka-9viAhXCW3wKHRweBiAQ_BIwD3oECA0QCA';
    if (await canLaunch("comgooglemaps://")) {
      print('launching com googleUrl');
      await launch(googleUrl);
    } else if (await canLaunch(appleUrl)) {
      print('launching apple url');
      await launch(appleUrl);
    } else {
      throw 'Could not launch url';
    }
  }

  _callMeBiological() async {
    // Android
    const uri = 'tel:07926302414';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      const uri = 'tel:07926302414';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  _launchMapsBiological() async {
    String googleUrl =
        'https://www.google.com/maps/place/Biological+%26+Life+Sciences,+School+of+Arts+and+Sciences,+Ahmedabad+University/@23.0346833,72.5494589,15z/data=!4m5!3m4!1s0x0:0xc2b805b99f898756!8m2!3d23.0346833!4d72.5494589';
    String appleUrl =
        'https://www.google.com/maps/place/Biological+%26+Life+Sciences,+School+of+Arts+and+Sciences,+Ahmedabad+University/@23.0346833,72.5494589,15z/data=!4m5!3m4!1s0x0:0xc2b805b99f898756!8m2!3d23.0346833!4d72.5494589';
    if (await canLaunch("comgooglemaps://")) {
      print('launching com googleUrl');
      await launch(googleUrl);
    } else if (await canLaunch(appleUrl)) {
      print('launching apple url');
      await launch(appleUrl);
    } else {
      throw 'Could not launch url';
    }
  }

  _callMeCHM() async {
    // Android
    const uri = 'tel:07961911552';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      const uri = 'tel:07961911552';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  _launchMapsCHM() async {
    String googleUrl =
        'https://www.google.com/maps/place/Centre+for+Heritage+Management+(CHM)/@23.0370363,72.5543976,15z/data=!4m2!3m1!1s0x0:0x843f98ec5335701b?sa=X&ved=2ahUKEwjn87WY_dviAhWk6nMBHWMtBR0Q_BIwDnoECAsQCA';
    String appleUrl =
        'https://www.google.com/maps/place/Centre+for+Heritage+Management+(CHM)/@23.0370363,72.5543976,15z/data=!4m2!3m1!1s0x0:0x843f98ec5335701b?sa=X&ved=2ahUKEwjn87WY_dviAhWk6nMBHWMtBR0Q_BIwDnoECAsQCA';
    if (await canLaunch("comgooglemaps://")) {
      print('launching com googleUrl');
      await launch(googleUrl);
    } else if (await canLaunch(appleUrl)) {
      print('launching apple url');
      await launch(appleUrl);
    } else {
      throw 'Could not launch url';
    }
  }

  _callMeVS() async {
    // Android
    const uri = 'tel:07961911000';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      const uri = 'tel:07961911000';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  _launchMapsVS() async {
    String googleUrl =
        'https://www.google.com/maps/place/Venture+Studio,+Ahmedabad+University/@23.039812,72.553569,15z/data=!4m2!3m1!1s0x0:0xfe520db897fc4575?sa=X&ved=2ahUKEwjNq-ft_dviAhV46nMBHf9OAOMQ_BIwCnoECAoQCA';
    String appleUrl =
        'https://www.google.com/maps/place/Venture+Studio,+Ahmedabad+University/@23.039812,72.553569,15z/data=!4m2!3m1!1s0x0:0xfe520db897fc4575?sa=X&ved=2ahUKEwjNq-ft_dviAhV46nMBHf9OAOMQ_BIwCnoECAoQCA';
    if (await canLaunch("comgooglemaps://")) {
      print('launching com googleUrl');
      await launch(googleUrl);
    } else if (await canLaunch(appleUrl)) {
      print('launching apple url');
      await launch(appleUrl);
    } else {
      throw 'Could not launch url';
    }
  }

  _callMeSCS() async {
    // Android
    const uri = 'tel:07961911465';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      const uri = 'tel:07961911465';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  _launchMapsSCS() async {
    String googleUrl =
        'https://www.google.com/maps/place/School+of+Computer+Studies,+Ahmedabad+University/@23.0391398,72.5529802,15z/data=!4m2!3m1!1s0x0:0x1aff36bdd44fd952?sa=X&ved=2ahUKEwiry9Wp_tviAhXTX3wKHceYCMgQ_BIwDnoECAoQCA';
    String appleUrl =
        'https://www.google.com/maps/place/School+of+Computer+Studies,+Ahmedabad+University/@23.0391398,72.5529802,15z/data=!4m2!3m1!1s0x0:0x1aff36bdd44fd952?sa=X&ved=2ahUKEwiry9Wp_tviAhXTX3wKHceYCMgQ_BIwDnoECAoQCA';
    if (await canLaunch("comgooglemaps://")) {
      print('launching com googleUrl');
      await launch(googleUrl);
    } else if (await canLaunch(appleUrl)) {
      print('launching apple url');
      await launch(appleUrl);
    } else {
      throw 'Could not launch url';
    }
  }
}

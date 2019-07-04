import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ImageScreen extends StatefulWidget {
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8E8E8),
      appBar: AppBar(
        backgroundColor: Color(0xff292664),
        title: Text("Campus Guide", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
              ),
              Card(
                child: ExpansionTile(
                  title: Text("Event Venue",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.0),),
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[

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
                            color: Color(0xffe71827),
                          ),
                          title: Text(
                            "School of Computer Studies",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                          ),
                          trailing: Text("Read more..",style: TextStyle(color: Colors.blueAccent,fontSize: 15.0,fontWeight: FontWeight.w600),),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                              child: Text(
                                "Address: A.G. Campus Commerce Six Roads, University Road, Vasant Vihar, Navrangpura, Ahmedabad, Gujarat 380009",
                                style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                              child: Text(
                                "The School of Computer Studies was established in 2000 "
                                    "by the Ahmedabad Education Trust to provide education "
                                    "to students seeking specialised programmes in information technology,"
                                    " creating a focused environment in which to achieve "
                                    "academic excellence and take the first steps to building rewarding careers.",
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.w400),
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
                                              color: Colors.blueAccent),
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
                                              color: Colors.blueAccent),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                        Divider(
                          color: Colors.black45,
                          height: 20.0,
                        ),

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
                            color: Color(0xffe71827),
                          ),
                          title: Text(
                            "GICT Building",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                          ),
                          trailing: Text("Read more..",style: TextStyle(color: Colors.blueAccent,fontSize: 15.0,fontWeight: FontWeight.w600),),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                              child: Text(
                                "Address: Ahmedabad University, GICT Building, Central Campus, Navrangpura, Ahmedabad, Gujarat 380009",
                                style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                              child: Text(
                                "The School of Engineering and Applied Science, Ahmedabad University, "
                                    "offers BTech, MTech and PhD programmes in a range of disciplines.",
                                style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.w400),
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
                                              color: Colors.blueAccent),
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
                                              color: Colors.blueAccent),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
                                  image: AssetImage('images/a2.jpg'),
                                )),
                          ),
                        ),
                        ExpansionTile(
                          leading: Icon(
                            Icons.school,
                            color: Color(0xffe71827),
                          ),
                          title: Text(
                            "Amrut Mody School of Management",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                          ),
                          trailing: Text("Read more..",style: TextStyle(color: Colors.blueAccent,fontSize: 15.0,fontWeight: FontWeight.w600),),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                              child: Text(
                                "Address: Ahmedabad University, GICT Building, Central Campus, Navrangpura, Ahmedabad, Gujarat 380009",
                                style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.w400),
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
                                    fontSize: 20.0, fontWeight: FontWeight.w400),
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
                                              color: Colors.blueAccent),
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
                                              color: Colors.blueAccent),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
                            color: Color(0xffe71827),
                          ),
                          title: Text(
                            "Biological & Life Sciences, School of Arts and Sciences",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                          ),
                          trailing: Text("Read more..",style: TextStyle(color: Colors.blueAccent,fontSize: 15.0,fontWeight: FontWeight.w600),),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                              child: Text(
                                "Address: Ahmedabad University Central Campus, Navrangpura, Ahmedabad, Gujarat 380009",
                                style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                              child: Text(
                                "The Biological and Life Sciences division is part of "
                                    "the new School of Arts and Sciences at Ahmedabad University. "
                                    "It began in 2012 with a vision to nurture science, knowledge "
                                    "and innovation among highly motivated graduate students and "
                                    "researchers looking to break new ground in their chosen specialisations. "
                                    "It currently offers a five-year Integrated MS in Life Sciences, as well as a PhD programme.",
                                style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.w400),
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
                                              color: Colors.blueAccent),
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
                                              color: Colors.blueAccent),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
                            color: Color(0xffe71827),
                          ),
                          title: Text(
                            "Centre for Heritage Management (CHM)",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                          ),
                          trailing: Text("Read more..",style: TextStyle(color: Colors.blueAccent,fontSize: 15.0,fontWeight: FontWeight.w600),),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                              child: Text(
                                "Address: Asmita Bhavan, Central Campus, Navrangpura, Ahmedabad, Gujarat 380009",
                                style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                              child: Text(
                                "The Centre for Heritage Management (CHM) at Ahmedabad University "
                                    "is a unique institution in India, specialising in the niche "
                                    "but very significant study of heritage management. Through "
                                    "our research and study, we aim to promote the conservation "
                                    "and management of the invaluable heritage assets of our communities.",
                                style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.w400),
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
                                              color: Colors.blueAccent),
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
                                              color: Colors.blueAccent),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
                            color: Color(0xffe71827),
                          ),
                          title: Text(
                            "Venture Studio",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                          ),
                          trailing: Text("Read more..",style: TextStyle(color: Colors.blueAccent,fontSize: 15.0,fontWeight: FontWeight.w600),),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                              child: Text(
                                "Address: AG Teacher's School Campus, Near Hanuman Temple, Commerce Six Road, Navrangpura, Ahmedabad, Gujarat 380009",
                                style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.w400),
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
                                    fontSize: 20.0, fontWeight: FontWeight.w400),
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
                                              color: Colors.blueAccent),
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
                                              color: Colors.blueAccent),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
                  ],

                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
              ),
              Card(
                child: ExpansionTile(
                    title: Text("Cafeteria",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.0),),
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                         SizedBox(
                              width: MediaQuery.of(context).size.width/1.1,
                              height: MediaQuery.of(context).size.height / 3,
                              child:Carousel(
                                images: [
                                  AssetImage('images/c1.jpg'),
                                  AssetImage('images/c3.jpg'),
                                  AssetImage('images/c4.jpg'),
                                  AssetImage('images/c5.jpg'),
                                  AssetImage('images/c2.jpg'),
                                ],
                                autoplay: false,
                                dotSize: 4.0,
                                dotSpacing: 15.0,
                                dotColor: Colors.black45,
                                indicatorBgPadding: 5.0,
                                dotBgColor: Colors.white.withOpacity(0.5),
                                borderRadius: true,
                              )
                          ),
                          ExpansionTile(
                            leading: Icon(
                              Icons.school,
                              color: Color(0xffe71827),
                            ),
                            title: Text(
                              "GICT Canteen",
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                            ),
                            trailing: Text("Read more..",style: TextStyle(color: Colors.blueAccent,fontSize: 15.0,fontWeight: FontWeight.w600),),
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                                child: Text(
                                  "Hours : Monday to Saturday 8AM - 8PM",
                                  style: TextStyle(
                                      fontSize: 20.0, fontWeight: FontWeight.bold,),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                                child: Text(
                                  "The big room with a lunch line and tables where Students eat their Lunch",
                                  style: TextStyle(
                                      fontSize: 20.0, fontWeight: FontWeight.w400),
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
                                          AllCallMap()._launchMapsCanteen();
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
                                                color: Colors.blueAccent),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),

                    ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
              ),
              Card(
                child: ExpansionTile(
                  title: Text("University Office",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.0),),
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                            width: MediaQuery.of(context).size.width/1.1,
                            height: MediaQuery.of(context).size.height / 3,
                            child:Carousel(
                              images: [
                                AssetImage('images/u1.jpg'),
                                AssetImage('images/u2.jpg')
                              ],
                              autoplay: false,
                              dotSize: 4.0,
                              dotSpacing: 15.0,
                              dotColor: Colors.black45,
                              indicatorBgPadding: 5.0,
                              dotBgColor: Colors.white.withOpacity(0.5),
                              borderRadius: true,
                            )
                        ),
                        ExpansionTile(
                          leading: Icon(
                            Icons.school,
                            color: Color(0xffe71827),
                          ),
                          title: Text(
                            "Office of Admissions and Financial Aid",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                          ),
                          trailing: Text("Read more..",style: TextStyle(color: Colors.blueAccent,fontSize: 15.0,fontWeight: FontWeight.w600),),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                              child: Text(
                                "Swastik Society, Navrangpura, Ahmedabad, Gujarat 380009",
                                style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10.0, left: 10.0, bottom: 10.0, top: 10.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          AllCallMap()._AUOAF();
                                        });
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            Icons.call,
                                            color: Colors.blueAccent,
                                          ),
                                          Text(
                                            "Call",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.blueAccent),
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
                                          AllCallMap()._launchMapUO();
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
                                                color: Colors.blueAccent),
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
                                          AllCallMap()._AUOAFM();
                                        });
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            Icons.mail,
                                            color: Colors.blueAccent,
                                          ),
                                          Text(
                                            "Mail",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.blueAccent),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
              ),
              Card(
                child: ExpansionTile(
                  title: Text("Medical Room",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.0),),
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                            width: MediaQuery.of(context).size.width/1.1,
                            height: MediaQuery.of(context).size.height / 3,
                            child:Carousel(
                              boxFit: BoxFit.fill,
                              images: [

                                AssetImage('images/s1.jpg'),
                                AssetImage('images/s2.jpg'),
                                AssetImage('images/s3.jpg'),
                              ],
                              autoplay: false,
                              dotSize: 4.0,
                              dotSpacing: 15.0,
                              dotColor: Colors.black45,
                              indicatorBgPadding: 5.0,
                              dotBgColor: Colors.white.withOpacity(0.5),
                              borderRadius: true,
                            )
                        ),
                        ExpansionTile(
                          leading: Icon(
                            Icons.school,
                            color: Color(0xffe71827),
                          ),
                          title: Text(
                            "Office of the Dean of Students",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                          ),
                          trailing: Text("Read more..",style: TextStyle(color: Colors.blueAccent,fontSize: 15.0,fontWeight: FontWeight.w600),),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                              child: Text(
                                "Address: AES Bg.No-2, Commerce Six Rd, Navrangpura, Ahmedabad, Gujarat 380009",
                                style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                              child: Text(
                                "A senior consulting physician, Dr. Gayatri Raval visits daily from Monday to Friday 10:00 am to 3:00 pm",
                                style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10.0, left: 10.0, bottom: 10.0, top: 10.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          AllCallMap()._AUSstu();
                                        });
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            Icons.call,
                                            color: Colors.blueAccent,
                                          ),
                                          Text(
                                            "Call",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.blueAccent),
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
                                          AllCallMap()._launchMapSsetu();
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
                                                color: Colors.blueAccent),
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
                                          AllCallMap()._AUSetuMail();
                                        });
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            Icons.mail,
                                            color: Colors.blueAccent,
                                          ),
                                          Text(
                                            "Mail",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.blueAccent),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
              ),
              Card(
                child: ExpansionTile(
                  title: Text("Bookstore",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.0),),
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                            width: MediaQuery.of(context).size.width/1.1,
                            height: MediaQuery.of(context).size.height / 3,
                            child:Carousel(
                              images: [
                                AssetImage('images/b1.jpg'),
                                AssetImage('images/b2.jpg'),
                                AssetImage('images/b3.jpg'),
                              ],
                              autoplay: false,
                              dotSize: 4.0,
                              dotSpacing: 15.0,
                              dotColor: Colors.black45,
                              indicatorBgPadding: 5.0,
                              dotBgColor: Colors.white.withOpacity(0.5),
                              borderRadius: true,
                            )
                        ),
                        ExpansionTile(
                          leading: Icon(
                            Icons.school,
                            color: Color(0xffe71827),
                          ),
                          title: Text(
                            "University Bookstore",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                          ),
                          trailing: Text("Read more..",style: TextStyle(color: Colors.blueAccent,fontSize: 15.0,fontWeight: FontWeight.w600),),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                              child: Text(
                                "Address: Commerce Six Roads Navrangpura, Ahmedabad - 380009 Gujarat, India.",
                                style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                              child: Text(
                                "Working hours: Monday to Sunday 11:00 am to 9:00 pm (open to public)",
                                style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10.0, left: 10.0, bottom: 10.0, top: 10.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          AllCallMap()._callBookStore();
                                        });
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            Icons.call,
                                            color: Colors.blueAccent,
                                          ),
                                          Text(
                                            "Call",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.blueAccent),
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
                                          AllCallMap()._launchMapBookStore();
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
                                                color: Colors.blueAccent),
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
                                          AllCallMap()._BookStoreMAIL();
                                        });
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            Icons.mail,
                                            color: Colors.blueAccent,
                                          ),
                                          Text(
                                            "Mail",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.blueAccent),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
              ),
              Card(
                child: ExpansionTile(
                  title: Text("Students Housing Facilities",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.0),),
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                            width: MediaQuery.of(context).size.width/1.1,
                            height: MediaQuery.of(context).size.height / 3,
                            child:Carousel(
                              images: [
                                AssetImage('images/h1.jpg'),
                                AssetImage('images/h2.jpg'),
                                AssetImage('images/h3.jpg'),
                                AssetImage('images/h4.jpg'),
                                AssetImage('images/h5.jpg'),
                                AssetImage('images/h6.jpg'),
                                AssetImage('images/h7.jpg'),
                                AssetImage('images/h8.jpg'),
                              ],
                              autoplay: false,
                              dotSize: 4.0,
                              dotSpacing: 15.0,
                              dotColor: Colors.black45,
                              indicatorBgPadding: 5.0,
                              dotBgColor: Colors.white.withOpacity(0.5),
                              borderRadius: true,
                            )
                        ),
                        ExpansionTile(
                          leading: Icon(
                            Icons.school,
                            color: Color(0xffe71827),
                          ),
                          title: Text(
                            "Ahemdabad University Hostel",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                          ),
                          trailing: Text("Read more..",style: TextStyle(color: Colors.blueAccent,fontSize: 15.0,fontWeight: FontWeight.w600),),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                              child: Text(
                                "Address: Ahmedabad University, GICT Building, Central Campus, Navrangpura, Ahmedabad, Gujarat 380009",
                                style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.w400),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                              child: Wrap(
                                direction: Axis.horizontal,
                                children: <Widget>[
                                  Text("* Wi-Fi enabled rooms.",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.0,color: Colors.green),),
                                  Text("* Common areas with lounge furniture.",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.0,color: Colors.green),),
                                  Text("* Well-equipped gym including treadmills, cross-trainers, cycles, home gym, bench press, chest press, yoga mats, leg machines, weights and plates.",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.0,color: Colors.green),),
                                  Text("* Reading room with casual seating and book racks.",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.0,color: Colors.green),),
                                  Text("* Biometric access systems and CCTV surveillance for security.",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.0,color: Colors.green),),
                                  Text("* Unlimited laundry and professional housekeeping services on daily basis.",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20.0,color: Colors.green),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10.0, left: 10.0, bottom: 10.0, top: 10.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
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
                                                color: Colors.blueAccent),
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
                                          AllCallMap()._HOSMAIL();
                                        });
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Icon(
                                            Icons.mail,
                                            color: Colors.blueAccent,
                                          ),
                                          Text(
                                            "Mail",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.blueAccent),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
              ),
              Card(
                child: ExpansionTile(
                  title: Text("Library",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20.0),),
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                            width: MediaQuery.of(context).size.width/1.1,
                            height: MediaQuery.of(context).size.height / 4,
                            child:Carousel(
                              images: [
                                AssetImage('images/l1.jpeg'),
                                AssetImage('images/l2.jpg'),
                                AssetImage('images/l3.jpg'),
                                AssetImage('images/l4.jpg'),
                                AssetImage('images/l5.jpg'),
                              ],
                              autoplay: false,
                              dotSize: 4.0,
                              dotSpacing: 15.0,
                              dotColor: Colors.black45,
                              indicatorBgPadding: 5.0,
                              dotBgColor: Colors.white.withOpacity(0.5),
                              borderRadius: true,
                            )
                        ),
                        ExpansionTile(
                          leading: Icon(
                            Icons.school,
                            color: Color(0xffe71827),
                          ),
                          title: Text(
                            "Central Library",
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                          ),
                          trailing: Text("Read more..",style: TextStyle(color: Colors.blueAccent,fontSize: 15.0,fontWeight: FontWeight.w600),),
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 20.0, left: 20.0, bottom: 20.0, top: 10.0),
                              child: Text(
                                "Address: Ahmedabad University, GICT Building, Central Campus, Navrangpura, Ahmedabad, Gujarat 380009",
                                style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.w400),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 10.0, left: 10.0, bottom: 10.0, top: 10.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(right: 60.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              AllCallMap()._callMe();
                                            });
                                          },
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
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
                                                      color: Colors.blueAccent),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 60.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              AllCallMap()._launchMaps();
                                            });
                                          },
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
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
                                                      color: Colors.blueAccent),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 0.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              AllCallMap()._LIBMAIL();
                                            });
                                          },
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Column(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.mail,
                                                  color: Colors.blueAccent,
                                                ),
                                                Text(
                                                  "Mail",
                                                  style: TextStyle(
                                                      fontSize: 20.0,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.blueAccent),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(0.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                    columns:<DataColumn>[
                                      DataColumn(label: Text("Day",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.0,color: Colors.black),)),
                                      DataColumn(label: Text("During Semester",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.0,color: Colors.black))),
                                      DataColumn(label: Text("During Vacation",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.0,color: Colors.black))),
                                    ],
                                  rows:<DataRow>[
                                    DataRow(
                                      cells: <DataCell>[
                                        DataCell(Text("Monday - Friday")),
                                        DataCell(Text("8.00 AM – 8.00 PM")),
                                        DataCell(Text("9.00 AM – 5.00 PM")),
                                      ],
                                    ),
                                    DataRow(
                                      cells: <DataCell>[
                                        DataCell(Text("Saturday")),
                                        DataCell(Text("9.00 AM – 5.00 PM")),
                                        DataCell(Text("9.00 AM – 1.00 PM")),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
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

  _LIBMAIL() async {
    // Android
    const uri = 'mailto:rahul.kanani@ahduni.edu.in';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      const uri = 'mailto:rahul.kanani@ahduni.edu.in';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  _HOSMAIL() async {
    // Android
    const uri = 'mailto:abhinav.chaturvedi@ahduni.edu.in';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      const uri = 'mailto:abhinav.chaturvedi@ahduni.edu.in';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  _launchMapsCanteen() async {
    String googleUrl =
        'https://www.google.com/maps/dir/23.0492335,72.5559743/school+of+engineering+and+applied+science+cafeteria/@23.0420057,72.544125,15z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x395e84ecd18c11b3:0x840303acd17d55c3!2m2!1d72.5523896!2d23.0369239';
    String appleUrl =
        'https://www.google.com/maps/dir/23.0492335,72.5559743/school+of+engineering+and+applied+science+cafeteria/@23.0420057,72.544125,15z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x395e84ecd18c11b3:0x840303acd17d55c3!2m2!1d72.5523896!2d23.0369239';
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

  /*book store*/
  _callBookStore() async {
    // Android
    const uri = 'tel:07961911234';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      const uri = 'tel:07961911234';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  _launchMapBookStore() async {
    String googleUrl =
        'https://www.google.com/maps/dir//23.0393973,72.5552639/@23.039397,72.555264,15z?hl=en-US';
    String appleUrl =
        'https://www.google.com/maps/dir//23.0393973,72.5552639/@23.039397,72.555264,15z?hl=en-US';
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

  _BookStoreMAIL() async {
    // Android
    const uri = 'mailto:bookstore@ahduni.edu.in';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      const uri = 'mailto:bookstore@ahduni.edu.in';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }
  /*book store end*/

/*University office*/
  _AUOAF() async {
    // Android
    const uri = 'tel:07961911217';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      const uri = 'tel:07961911217';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  _AUOAFM() async {
    // Android
    const uri = 'mailto:ugadmissions@ahduni.edu.in';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      const uri = 'mailto:ugadmissions@ahduni.edu.in';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  _launchMapUO() async {
    String googleUrl =
        'https://www.google.com/maps/dir//Ahmedabad+University+Office+of+Admissions+and+Financial+Aid,+Swastik+Society,+Navrangpura,+Ahmedabad,+Gujarat+380009/@23.0394744,72.5531561,17z/data=!4m8!4m7!1m0!1m5!1m1!1s0x395e848cebfba2f3:0x4144ce4e6646a897!2m2!1d72.5553096!2d23.0393918';
    String appleUrl =
        'https://www.google.com/maps/dir//Ahmedabad+University+Office+of+Admissions+and+Financial+Aid,+Swastik+Society,+Navrangpura,+Ahmedabad,+Gujarat+380009/@23.0394744,72.5531561,17z/data=!4m8!4m7!1m0!1m5!1m1!1s0x395e848cebfba2f3:0x4144ce4e6646a897!2m2!1d72.5553096!2d23.0393918';
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

/*University office end*/


/*Madical room start*/
  _AUSstu() async {
    // Android
    const uri = 'tel:07961911247';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      const uri = 'tel:07961911247';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  _AUSetuMail() async {
    // Android
    const uri = 'mailto:wellness@ahduni.edu.in';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      const uri = 'mailto:wellness@ahduni.edu.in';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  _launchMapSsetu() async {
    String googleUrl =
        'https://www.google.com/maps/dir/23.0492335,72.5559743/medical+room+of+ahmedabad+university/@23.0440524,72.5508328,16z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x395e848d5f86040f:0x7a0cc8b624851642!2m2!1d72.5561086!2d23.0392097';
    String appleUrl =
        'https://www.google.com/maps/dir/23.0492335,72.5559743/medical+room+of+ahmedabad+university/@23.0440524,72.5508328,16z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x395e848d5f86040f:0x7a0cc8b624851642!2m2!1d72.5561086!2d23.0392097';
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

/*Medical room end*/
}

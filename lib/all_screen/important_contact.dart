import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDeatils extends StatefulWidget {
  @override
  _ContactDeatilsState createState() => _ContactDeatilsState();
}

class _ContactDeatilsState extends State<ContactDeatils> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff292664),
        title: Text("Important Contact Details",style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("Samved Hospital",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
              subtitle: Text("Tap to call"),
              onTap: () => AllCallEmail()._AUSamved(),
              trailing: IconButton(
                  icon: Icon(Icons.location_on, color: Color(0xff292664)),
                  onPressed: () => AllCallEmail()._launchMapsamved()),
            ),
            Divider(
              color: Colors.black,
            ),

            ListTile(
              title: Text("Medical Room",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
              subtitle: Text("Tap to call"),
              onTap: () => AllCallEmail()._AUSstu(),
              trailing: IconButton(
                  icon: Icon(Icons.mail, color: Color(0xff292664)),
                  onPressed: () => AllCallEmail()._AUSetuMail()),
            ),
            Divider(
              color: Colors.black,
            ),

            ListTile(
              title: Text("University Office",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
              subtitle: Text("Tap to call"),
              onTap: () => AllCallEmail()._AUO(),
              trailing: IconButton(
                  icon: Icon(Icons.mail, color: Color(0xff292664)),
                  onPressed: () => AllCallEmail()._AUMail()),
            ),
            Divider(
              color: Colors.black,
            ),

            ListTile(
              title: Text("Counselor Office",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
              subtitle: Text("Tap to call"),
              onTap: () => AllCallEmail()._AUOC(),
              trailing: IconButton(
                  icon: Icon(Icons.mail, color: Color(0xff292664)),
                  onPressed: () => AllCallEmail()._AUCMail()),
            ),
            Divider(
              color: Colors.black,
            ),

            ListTile(
              title: Text("AURIS Support",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
              trailing: IconButton(
                  icon: Icon(Icons.mail, color: Color(0xff292664)),
                  onPressed: () => AllCallEmail()._AUAM()),
            ),
            Divider(
              color: Colors.black,
            ),

            ListTile(
              title: Text("Programme Office",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
              subtitle: Text("Tap to call"),
              onTap: () => AllCallEmail()._AUSstu(),// Pending che
              trailing: IconButton(
                  icon: Icon(Icons.mail, color: Color(0xff292664)),
                  onPressed: () => AllCallEmail()._AUSetuMail()),// pending che
            ),
            Divider(
              color: Colors.black,
            ),

            ListTile(
              title: Text("Office of Admission and Financial Aids",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
              subtitle: Text("Tap to call"),
              onTap: () => AllCallEmail()._AUOAF(),
              trailing: IconButton(
                  icon: Icon(Icons.mail, color: Color(0xff292664)),
                  onPressed: () => AllCallEmail()._AUOAFM()),
            ),
            Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class AllCallEmail {
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

  _AUSamved() async {
    // Android
    const uri = 'tel:07926420285';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      const uri = 'tel:07926420285';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  _launchMapsamved() async {
    String googleUrl =
        'https://www.google.com/maps?q=samved+hospital&um=1&ie=UTF-8&sa=X&ved=0ahUKEwi7iqb7-YvjAhUU4o8KHe0mARcQ_AUIECgB';
    String appleUrl =
        'https://www.google.com/maps?q=samved+hospital&um=1&ie=UTF-8&sa=X&ved=0ahUKEwi7iqb7-YvjAhUU4o8KHe0mARcQ_AUIECgB';
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

  _AUO() async {
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

  _AUMail() async {
    // Android
    const uri = 'mailto:info@ahduni.edu.in';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      const uri = 'mailto:info@ahduni.edu.in';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

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

  _AUOC() async {
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

  _AUCMail() async {
    // Android
    const uri = 'mailto:info@ahduni.edu.in';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      const uri = 'mailto:info@ahduni.edu.in';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  _AUA() async {
    // Android
    const uri = 'tel:07961911201';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      const uri = 'tel:07961911201';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  _AUAM() async {
    // Android
    const uri = 'mailto:support.auris@ahduni.edu.in';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      const uri = 'mailto:support.auris@ahduni.edu.in';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }
}

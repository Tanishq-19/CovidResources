import 'dart:convert';

import 'package:covidresource/avaibility.dart';
import 'package:covidresource/citysearch.dart';
import 'package:covidresource/contact.dart';
import 'package:covidresource/requirment.dart';
import 'package:covidresource/updatepage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:http/http.dart' as https;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Constants.prefs.getString("setCity") == null
          ? CitySearch()
          : HomePage(),
      title: 'Flutter Demo',
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var page = 0;
  var data;
  void initState() {
    super.initState();
    //fetchData();
    checkUpdate();
  }

  // fetchData() async {
  //   var response = await https.get(Uri.https(
  //       "fathomless-taiga-09466.herokuapp.com",
  //       "/meerut/oxygen available/covid/0"));
  //   var myData = jsonDecode(response.body);
  //   data = jsonEncode(myData[0]);
  //   print(data);
  //   setState(() {});
  // }

  checkUpdate() async {
    var response = await https
        .get(Uri.https("fathomless-taiga-09466.herokuapp.com", "/update"));
    data = jsonDecode(response.body);
    //data = jsonEncode(myData);
    print(data['update']);
    setState(() {});
  }

  Future<void> share() async {
    await FlutterShare.share(
      title: 'India Unites Against Covid',
      text:
          'This is a link to a non-profit app dedicated to provide the informational tweets for avaibility and requirements of corona resources like oxyzen, remdesivir, hospital beds, ventilators etc. in your own city. Please share this app as much as you can so that this app could reach someone needy!',

      linkUrl: data['current'],
      //chooserTitle: 'Example Chooser Title',
    );

    @override
    // ignore: unused_element
    void initState() {
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff14213D),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xff14213D),
        color: Color(0xff242E41),
        items: <Widget>[
          Icon(
            Icons.add_moderator,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.enhanced_encryption,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          page = index;
          print(page);
          setState(() {});
        },
      ),
      appBar: AppBar(
        title: Text("India Unites Against Covid"),
        centerTitle: true,
        backgroundColor: Color(0xff242E41),
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xff14213D),
          child: Column(
            children: [
              Container(
                color: Color(0xff242E41),
                height: 180,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      child: Image(
                        image: NetworkImage(
                            "https://images.unsplash.com/45/eDLHCtzRR0yfFtU0BQar_sylwiabartyzel_themap.jpg?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1057&q=80"),
                        fit: BoxFit.cover,
                        color: Colors.black54,
                        colorBlendMode: BlendMode.darken,
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 80.0, bottom: 10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                                Text(
                                  Constants.prefs.getString("setCity"),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            OutlineButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CitySearch())),
                              child: Text(
                                'Change City',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: data == null
                          ? CircularProgressIndicator()
                          : (data['update']
                              ? Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1.0,
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            5.0) //                 <--- border radius here
                                        ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Update the app with latest version",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                        OutlineButton(
                                          onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UpdatePage(data))),
                                          child: Text(
                                            'Update',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1.0,
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            5.0) //                 <--- border radius here
                                        ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: Text(
                                            "You are using the latest version",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        OutlineButton(
                                          onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UpdatePage(data))),
                                          child: Text(
                                            'Details',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                    ),
                    Column(
                      children: [
                        OutlineButton(
                          onPressed: share,
                          child: Text(
                            "Share this app",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        OutlineButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ContactPage())),
                          child: Text(
                            "Contact us",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: page == 0 ? Availability() : Requirement(),
    );
  }
}

class Constants {
  static SharedPreferences prefs;
}


// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   get http => null;

//   void initState() {
//     super.initState();
//     //fetchData();
//   }

//   fetchData() async {
//     var params = {
//       "name": "#meerut",
//     };

//     //print(myData['slok']);
//     // var reschapters = await http
//     //     .get(Uri.https('vedicscripturesapi.herokuapp.com', '/gita/chapters'));
//     // chapters = jsonDecode(reschapters.body);
//     //
//     var response = await http.post(
//       "vedicscripturesapi.herokuapp.com/",
//       body: json.encode(params),
//     );
//     var myData = jsonDecode(response);
//     print(myData);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

import 'dart:convert';

import 'package:covidresource/avaibility.dart';
import 'package:covidresource/citysearch.dart';
import 'package:covidresource/requirment.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xffE8B8F4),
        color: Color(0xffD972FF),
        items: <Widget>[
          Icon(Icons.add_moderator, size: 30),
          Icon(Icons.enhanced_encryption, size: 30),
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
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xffD972FF),
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              children: [
                Text(Constants.prefs.getString("setCity")),
                OutlineButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CitySearch())),
                  child: Text('Change City'),
                )
              ],
            ),
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

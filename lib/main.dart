import 'dart:convert';
import 'dart:ffi';

import 'package:covidresource/avaibility.dart';
import 'package:covidresource/requirment.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:twitter_api/twitter_api.dart';
import 'package:covidresource/key.dart';
import 'package:http/http.dart' as https;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
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
  var page;

  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var data = {
      "city": "meerut",
      "resources": "covid oxygen",
      "no_of_tweets": "1"
    };
    final body = json.encode(data);
    // var params = {
    //   "name": "#meerut",
    // };

    //print(myData['slok']);
    // var reschapters = await http
    //     .get(Uri.https('vedicscripturesapi.herokuapp.com', '/gita/chapters'));
    // chapters = jsonDecode(reschapters.body);
    //

    // var response = await http.post(
    //   "https://fathomless-taiga-09466.herokuapp.com/meerut/''/covid/7",
    // );
    // var response = await https.get(Uri.https(
    //     "fathomless-taiga-09466.herokuapp.com", "/meerut/''/covid/7"));
    // var myData = jsonDecode(response.body);
    // print(myData[0]);

    final String apiUrl = "https://fathomless-taiga-09466.herokuapp.com/";

    final response = await https.post(apiUrl,
        headers: {
          "Content-Type": "application/json",
          "Access-Control_Allow_Origin": "GET"
        },
        body: body);

    var myData = jsonDecode(response.body);
    print(myData);
    setState(() {});
  }

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
        ),
      ),
      body: page == 0 ? Avaibility() : Requirement(),
    );
  }
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

import 'dart:convert';
import 'dart:ffi';

import 'package:covidresource/avaibility.dart';
import 'package:covidresource/requirment.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:twitter_api/twitter_api.dart';
import 'package:covidresource/key.dart';

void main() => runApp(MyApp());
//   final _twitterOauth = new twitterApi(
//       consumerKey: consumerApiKey,
//       consumerSecret: consumerApiSecret,
//       token: accessToken,
//       tokenSecret: accessTokenSecret);

// // Make the request to twitter
//   Future twitterRequest = _twitterOauth.getTwitterRequest(
//     // Http Method
//     "GET",
//     // Endpoint you are trying to reach
//     "statuses/user_timeline.json",
//     // The options for the request
//     options: {
//       "user_id": "19025957",
//       "screen_name": "TTCnotices",
//       "count": "20",
//       "trim_user": "true",
//       "tweet_mode": "extended", // Used to prevent truncating tweets
//     },
//   );

//   // Wait for the future to finish
//   var res = await twitterRequest;

//   // Print off the response
//   print(res.statusCode);
//   print(res.body);

//   // Convert the string response into something more useable
//   var tweets = json.decode(res.body);
//   print(tweets);

// Creating the twitterApi Object with the secret and public keys
// These keys are generated from the twitter developer page
// Dont share the keys with anyone

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
  get http => null;

  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    // var params = {
    //   "name": "#meerut",
    // };

    //print(myData['slok']);
    // var reschapters = await http
    //     .get(Uri.https('vedicscripturesapi.herokuapp.com', '/gita/chapters'));
    // chapters = jsonDecode(reschapters.body);
    //
    var response = await http.post(
      "https://fathomless-taiga-09466.herokuapp.com/meerut/''/covid/7",
    );
    var myData = jsonDecode(response);
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
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
        ],
        onTap: (index) {
          page = index;
          print(page);
          setState(() {});
        },
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

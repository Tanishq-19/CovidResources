import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:twitter_api/twitter_api.dart';
import 'package:covidresource/key.dart';

Future main() async {
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
  runApp(MyApp());
}

// Creating the twitterApi Object with the secret and public keys
// These keys are generated from the twitter developer page
// Dont share the keys with anyone

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
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
    return Container();
  }
}

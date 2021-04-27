import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tweet_ui/embedded_tweet_view.dart';
import 'package:tweet_ui/models/api/tweet.dart';
import 'package:http/http.dart' as https;

class Avaibility extends StatefulWidget {
  @override
  _AvaibilityState createState() => _AvaibilityState();
}

class _AvaibilityState extends State<Avaibility> {
  var myData, response;
  @override
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
    response = await https.get(Uri.https(
        "fathomless-taiga-09466.herokuapp.com", "/meerut/''/covid/7"));
    myData = jsonDecode(response.body);
    // print(myData[0]);

    // final String apiUrl = "https://fathomless-taiga-09466.herokuapp.com/";

    // final uri = Uri.https('fathomless-taiga-09466.herokuapp.com', '/', data);
    // final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    // final response = await https.get(uri, headers: headers);

    // var myData = jsonDecode(response.body);
    print(myData[0]);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8B8F4),
      body: Center(
        child: myData == null
            ? CircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Avaibilities",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  EmbeddedTweetView.fromTweet(
                    Tweet.fromRawJson(response.body),
                  ),
                ],
              ),
      ),
      // appBar: AppBar(
      //   title: Text("Avaibility"),
      // ),
    );
  }
}

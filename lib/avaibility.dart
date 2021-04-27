import 'package:flutter/material.dart';
import 'package:tweet_ui/embedded_tweet_view.dart';
import 'package:tweet_ui/models/api/tweet.dart';
import 'package:covidresource/main.dart';

class Avaibility extends StatefulWidget {
  Avaibility(this.data);
  var data;
  @override
  _AvaibilityState createState() => _AvaibilityState();
}

class _AvaibilityState extends State<Avaibility> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8B8F4),
      body: Center(
        child: Column(
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
              Tweet.fromRawJson(widget.data
                  // {"created_at": "Mon Nov 12 13:00:38 +0000 2018", "id": 1061967001177018368, ...
                  ),
              // darkMode: true,
            )
          ],
        ),
      ),
      // appBar: AppBar(
      //   title: Text("Avaibility"),
      // ),
    );
  }
}

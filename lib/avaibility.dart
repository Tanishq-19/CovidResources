import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:tweet_ui/embedded_tweet_view.dart';
import 'package:tweet_ui/models/api/tweet.dart';

class Availability extends StatefulWidget {
  @override
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  var data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var response = await https.get(Uri.https(
        "fathomless-taiga-09466.herokuapp.com",
        "/meerut/oxygen available/covid/10"));
    var myData = jsonDecode(response.body);

    data = myData;
    print(data.length);
    //print(jsonEncode(data).length);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8B8F4),
      body: Center(
        child: data == null
            ? CircularProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Availability",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: EmbeddedTweetView.fromTweet(
                                Tweet.fromRawJson(jsonEncode(data[index])),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                    // EmbeddedTweetView.fromTweet(
                    //   Tweet.fromRawJson(data),
                    // ),
                  ],
                ),
              ),
      ),
    );
  }
}

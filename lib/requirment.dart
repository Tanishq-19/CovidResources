import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:tweet_ui/embedded_tweet_view.dart';
import 'package:tweet_ui/models/api/tweet.dart';

class Requirement extends StatefulWidget {
  @override
  _RequirementState createState() => _RequirementState();
}

class _RequirementState extends State<Requirement> {
  var data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var response = await https.get(Uri.https(
        "fathomless-taiga-09466.herokuapp.com",
        "/meerut/oxygen need help/covid/10"));
    var myData = jsonDecode(response.body);
    data = myData;
    print(jsonEncode(data).length);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8B8F4),
      body: Center(
        child: data == null
            ? CircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Requirements",
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
                        itemCount: 10,
                        //data.length,
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
                ],
              ),
      ),
    );
  }
}

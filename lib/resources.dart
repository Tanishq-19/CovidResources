import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Resources extends StatefulWidget {
  @override
  _ResourcesState createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  var data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var response = await https
        .get(Uri.https("fathomless-taiga-09466.herokuapp.com", "/new"));
    data = jsonDecode(response.body);
    //data = jsonEncode(myData);
    print(data[0]);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff14213D),
      appBar: AppBar(
        title: Text(
          'More Resources',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xff242E41),
      ),
      body: data == null
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => _launchURL(data[index]['link']),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.5,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(data[index]['name'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.lightBlue,
                                        fontSize: 20,
                                      )),
                                ),
                                Text(data[index]['description'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('Click here to browse...',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.blue,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

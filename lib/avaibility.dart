import 'dart:convert';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:tweet_ui/embedded_tweet_view.dart';
import 'package:tweet_ui/models/api/tweet.dart';
import 'package:url_launcher/url_launcher.dart';

class Availability extends StatefulWidget {
  @override
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  final formKey = new GlobalKey<FormState>();
  // String _course;

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      setState(() {});
      print('Done');
      // performLogin();
    }
  }

  var data;

  TextEditingController _resourcesTEC;
  @override
  void initState() {
    super.initState();

    _resourcesTEC = TextEditingController();
    fetchData(' ');
  }

  fetchData(String resources) async {
    var response = await https.get(Uri.https(
        "fathomless-taiga-09466.herokuapp.com",
        "/meerut available/$resources/covid/50"));
    var myData = jsonDecode(response.body);
    data = myData;

    print(data[0]['entities']['urls'][0]['expanded_url']);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _buildFeedbackDialog() async {
      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 10,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            content: SingleChildScrollView(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      splashRadius: 20,
                      icon: Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.grey[200],
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Text(
                    "Select the resources and city",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Search for the requirement\nfrom the above",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () {
                            //TODO: submit feedback
                            fetchData('Ramdesivir');
                            Navigator.pop(context);
                          },
                          color: Colors.black,
                          child: Text(
                            "Ramdesivir",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: RaisedButton(
                          onPressed: () {
                            //TODO: submit feedback
                            fetchData('Favipiravir');
                            Navigator.pop(context);
                          },
                          color: Colors.black,
                          child: Text(
                            "Favipiravir",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () {
                            //TODO: submit feedback
                            fetchData('oxygen');
                            Navigator.pop(context);
                          },
                          color: Colors.black,
                          child: Text(
                            "oxygen",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () {
                            //TODO: submit feedback
                            fetchData('Ventillator');
                            Navigator.pop(context);
                          },
                          color: Colors.black,
                          child: Text(
                            "Ventillator",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () {
                            //TODO: submit feedback
                            fetchData('plasma');
                            Navigator.pop(context);
                          },
                          color: Colors.black,
                          child: Text(
                            "plasma",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () {
                            //TODO: submit feedback
                            fetchData('toclizumab');
                            Navigator.pop(context);
                          },
                          color: Colors.black,
                          child: Text(
                            "toclizumab",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            onPressed: () {
                              //TODO: submit feedback
                              fetchData('ICU');
                              Navigator.pop(context);
                            },
                            color: Colors.black,
                            child: Text(
                              "ICU",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          onPressed: () {
                            //TODO: submit feedback
                            fetchData('beds');
                            Navigator.pop(context);
                          },
                          color: Colors.black,
                          child: Text(
                            "beds",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () {
                        //TODO: submit feedback
                        fetchData('Food');
                        Navigator.pop(context);
                      },
                      color: Colors.black,
                      child: Text(
                        "Food",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // TextField(
                  //   controller: _resourcesTEC,
                  //   style: TextStyle(
                  //     color: Colors.grey[200],
                  //     fontSize: 15,
                  //   ),
                  //   maxLines: 5,
                  //   cursorColor: Colors.amber,
                  //   autofocus: true,
                  //   keyboardType: TextInputType.multiline,
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(
                  //       borderSide: BorderSide.none,
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     filled: true,
                  //     fillColor: Colors.black,
                  //     hintText: "Write here",
                  //     hintStyle: TextStyle(
                  //       color: Colors.grey[400],
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // RaisedButton(
                  //   onPressed: () {
                  //     //TODO: submit feedback

                  //     Navigator.pop(context);
                  //   },
                  //   color: Colors.black,
                  //   child: Icon(
                  //     Icons.arrow_forward,
                  //     color: Colors.grey[200],
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Thank you for the submitt",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    String dropValue1;
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
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Availability",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    OutlineButton(
                      autofocus: true,
                      onPressed: () {
                        _buildFeedbackDialog();
                      },
                      child: Text(
                        "Tap here",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),

                    // Padding(
                    //   padding:
                    //       const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                    //   child: DropdownSearch<String>(
                    //     mode: Mode.MENU,
                    //     showSelectedItem: true,
                    //     items: ['delhi', 'meerut'],
                    //     label: "City",
                    //     hint: "City Select",
                    //     // popupItemDisabled: (String s) =>
                    //     //   s.startsWith('I'),
                    //     onChanged: print,
                    //     selectedItem: "None",
                    //     popupBackgroundColor: Colors.deepOrange[400],
                    //     popupBarrierColor: Colors.black26,
                    //     searchBoxDecoration: InputDecoration(
                    //       // contentPadding:
                    //       //     EdgeInsets.fromLTRB(10, 0, 10, 0),
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.grey[300]),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.blue),
                    //       ),
                    //       border: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.grey[300]),
                    //       ),
                    //     ),
                    //     validator: (val) =>
                    //         val == "None" ? "Please select the category" : null,
                    //   ),
                    // ),
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
                                child: GestureDetector(
                                  onTap: () => _launchURL(data[index]
                                      ['entities']['urls'][0]['expanded_url']),
                                  child: EmbeddedTweetView.fromTweet(
                                    Tweet.fromRawJson(
                                      jsonEncode(data[index]),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ))
                  ],
                ),
              ),
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

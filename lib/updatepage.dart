import 'package:covidresource/key.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdatePage extends StatefulWidget {
  UpdatePage(this.data);
  var data;
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff14213D),
      appBar: AppBar(
        title: Text("Update Version: ${widget.data['version']}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: widget.data['update']
                  ? Text(
                      "Update features:",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )
                  : Text(
                      "Current features:",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                widget.data['feature'],
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
                child: widget.data['update'] && version < widget.data['version']
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: OutlineButton(
                          onPressed: () => _launchURL(widget.data['link']),
                          child: Text("Update",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                        ),
                      )
                    : null)
          ],
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

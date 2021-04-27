import 'package:flutter/material.dart';

class Avaibility extends StatefulWidget {
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
          ],
        ),
      ),
      // appBar: AppBar(
      //   title: Text("Avaibility"),
      // ),
    );
  }
}

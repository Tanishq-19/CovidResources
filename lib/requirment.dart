import 'package:flutter/material.dart';

class Requirement extends StatefulWidget {
  @override
  _RequirementState createState() => _RequirementState();
}

class _RequirementState extends State<Requirement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8B8F4),
      appBar: AppBar(
        title: Text("Requirement"),
      ),
    );
  }
}

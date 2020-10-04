import 'package:covid19/Dashboard.dart';
import 'package:flutter/material.dart';

import 'About.dart';

void main() {
  runApp(CovidHome());
}

class CovidHome extends StatefulWidget {
  @override
  _CovidHomeState createState() => _CovidHomeState();
}

class _CovidHomeState extends State<CovidHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Dashboard());
//    return MaterialApp(home: Cover());
  }
}

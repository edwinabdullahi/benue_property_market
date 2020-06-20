import 'package:flutter/material.dart';
class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => new _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: new AppBar(
        backgroundColor: Colors.purple,
        title: new Text('About Page'),
      ),
    );
  }
}

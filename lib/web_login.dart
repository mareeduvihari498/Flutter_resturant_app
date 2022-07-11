import 'package:flutter/material.dart';

class Weblogin extends StatefulWidget {
  const Weblogin({Key? key}) : super(key: key);

  @override
  State<Weblogin> createState() => _WebloginState();
}

class _WebloginState extends State<Weblogin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(title: Text('Dwaraka Bawarchi'),),
        body: Center(child: Text('Login')),
         ),
    );
    
  }
}
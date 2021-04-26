import 'package:flutter/material.dart';

class Nosotros extends StatelessWidget{
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Quienes somos"), backgroundColor: Colors.orange,
      ),
      body: new Center(
        child: new Text("Los mejores productos de belleza"),
      ),
    );
  }
}
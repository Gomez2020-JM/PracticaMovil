import 'package:flutter/material.dart';

class Soporte extends StatelessWidget{
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Soporte"),backgroundColor: Colors.orange
      ),
      body: new Center(
        child: new Text("En Mantenimiento...!"),
      ),
    );
  }
}
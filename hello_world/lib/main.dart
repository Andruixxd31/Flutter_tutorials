import 'package:flutter/material.dart'; //imports the main class
import 'package:hello_world/login.dart';
//Flutter uses widgets to handle everything in the framework
//The widgets follow a hierierchy

void main() {
  runApp(MyApp());
}

//The widget has no state and will not be changed
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //overriding the build methos
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Andre\'s App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange, //primary color
        visualDensity: VisualDensity
            .adaptivePlatformDensity, //adptating the density depending on the device and os
      ),
      //home is the homepage of the app... duh
      //It receives widgets
      home: LoginPage(),
    );
  }
}

//* Example of a statefulWidget
// Has two classes
// 1 takes constructor arguments
// 2 class handles the state

//* Another Example of a StatelessWidget
// class TestWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text("Hello World Again");
//   }
// }

import 'package:flutter/material.dart'; //imports the main class
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    //we need to return a widget
    //Scaffold can hold other widgets inside it
    //Scaffold gives the structure of the page
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello World!"),
        ),
        body: TextInputWidget()

        //* Example of a Column Widget with a Type Widget list
        //Column Widget to organize the widgets from the list type Widget
        // body: Column(children: <Widget>[
        //   TestWidget(),
        //   TestWidget(),
        //   TestWidget()
        // ]), //AppBar and title is a widget
        );
    //* Flutter show its own comments to show where widgets ends
  }
}

//* Example of a statefulWidget
// Has two classes
// 1 takes constructor arguments
// 2 class handles the state

class TextInputWidget extends StatefulWidget {
  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

// A State class has an underscore as a prefix
//The widget is rendered once by the program we need to updated to show changes
class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();
  String text = " ";

  //When we disposed the widget we clean the controller inside it
  @override
  void dispose() {
    super.dispose(); //dispose the parent Widget
    controller.dispose(); //dispose the controller
  }

  void changeText(text) {
    setState(() {
      //changes the states and forces to refresh the widget
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
          controller: this.controller,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.message), labelText: "Type a message"),
          onChanged: (text) => this.changeText(text)),
      Text(this.text)
    ]);
  }
}

//* Another Example of a StatelessWidget
// class TestWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text("Hello World Again");
//   }
// }

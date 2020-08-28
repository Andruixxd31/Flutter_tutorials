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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";

  void changeText(String text) {
    this.setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    //we need to return a widget
    //Scaffold can hold other widgets inside it
    //Scaffold gives the structure of the page
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello World!"),
        ),
        body: Column(
          //we omith the () in changeText to not call the function and have
          //it in a variable instead that will be passed to callback
          children: <Widget>[TextInputWidget(this.changeText), Text(this.text)],
        ));
    //* Flutter show its own comments to show where widgets ends
  }
}

//* Example of a statefulWidget
// Has two classes
// 1 takes constructor arguments
// 2 class handles the state
class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  //Constructor
  //Callback will be equal to the function changeText
  TextInputWidget(this.callback);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

// A State class has an underscore as a prefix
//The widget is rendered once by the program we need to updated to show changes
class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();
  //When we disposed the widget we clean the controller inside it
  @override
  void dispose() {
    super.dispose(); //dispose the parent Widget
    controller.dispose(); //dispose the controller
  }

  void click() {
    //widget accesses the class TextInputWidget
    widget.callback(controller.text);
    //clears the input field
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: this.controller,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.message),
            labelText: "Type a message",
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              splashColor: Colors.deepOrange,
              tooltip: "post message",
              onPressed: this.click,
            )));
  }
}

//* Another Example of a StatelessWidget
// class TestWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text("Hello World Again");
//   }
// }

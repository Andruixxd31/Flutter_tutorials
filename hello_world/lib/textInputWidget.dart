import 'package:flutter/material.dart';

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
    //puls the keuboard down
    FocusScope.of(context).unfocus();
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

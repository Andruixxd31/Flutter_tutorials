import 'package:flutter/material.dart';
import 'post.dart';
import 'postList.dart';
import 'textInputWidget.dart';

class MyHomePage extends StatefulWidget {
  final String name;

  MyHomePage(this.name);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    this.setState(() {
      posts.add(new Post(text, widget.name));
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
          children: <Widget>[
            //Expanded fills an entire area
            Expanded(child: PostList(this.posts)),
            TextInputWidget(this.newPost)
          ],
        ));
    //* Flutter show its own comments to show where widgets ends
  }
}

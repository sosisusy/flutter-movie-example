import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_example/pages/home/homepage.dart';

class Routes extends StatefulWidget {
  Routes({Key key}) : super(key: key);

  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  String appName = "Movie | ", title = "Home";

  void handleTitleChange(String title) {
    setState(() {
      title = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName + title,
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

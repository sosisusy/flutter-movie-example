import 'package:flutter/material.dart';

class MainBanner extends StatelessWidget {
  MainBanner({Key key, this.height}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      brightness: Brightness.dark,
      backgroundColor: Colors.transparent,
      expandedHeight: height,
      flexibleSpace: Container(
        height: height + MediaQuery.of(context).padding.top + 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: Text(
            "Movie App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontFamily: "Pacifico",
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_example/widgets/back_image.dart';
import 'package:movie_example/widgets/main_banner.dart';
import 'package:movie_example/widgets/movie_list.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double mainBannerHeight = 200;
  final String movieDataUrl =
      "https://yts.mx/api/v2/list_movies.json?sort_by=rating";

  bool isLoading = true;
  Map<String, dynamic> movieData;

  @override
  Widget build(BuildContext context) {
    if (isLoading) return Center(child: CircularProgressIndicator());

    return Scaffold(
      body: Stack(
        children: [
          BackImage(
            height: mainBannerHeight,
            imageUrl:
                "https:\/\/yts.mx\/assets\/images\/movies\/The_Dark_Knight_2008\/background.jpg",
          ),
          CustomScrollView(
            slivers: [
              MainBanner(height: mainBannerHeight),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          MovieList(
                            title: "Featured",
                            itemWidth: 150,
                            itemData: movieData["data"]["movies"],
                          ),
                          MovieList(
                            title: "Featured",
                            itemWidth: 150,
                            itemData: movieData["data"]["movies"],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> fetchMovies() async {
    final response = await http.get(movieDataUrl);

    if (response.statusCode != 200) {
      throw Exception("Failed to load data");
    }

    setState(() {
      movieData = json.decode(response.body);
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }
}

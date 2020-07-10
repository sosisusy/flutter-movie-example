import 'package:flutter/material.dart';
import 'package:movie_example/widgets/movie_list_item.dart';

class MovieList extends StatelessWidget {
  MovieList({
    Key key,
    this.title: "",
    this.itemData,
    this.itemHeight: 200,
    this.itemWidth: 145,
  }) : super(key: key);

  final itemData;
  final double itemHeight, itemWidth;
  final String title;
  final double marginHorizontal = 20;

  // 리스트 헤더 빌드
  Container _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: marginHorizontal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ),
          ),
          Row(
            children: [
              Text(
                "See All",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 14,
              )
            ],
          ),
        ],
      ),
    );
  }

  // 리스트 빌드
  Container _buildList() {
    return Container(
      height: 272,
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          double left = 8, right = 8;
          if (index == 0) {
            left = marginHorizontal;
          }
          if (index == itemData.length - 1) {
            right = marginHorizontal;
          }

          return MovieListItem(
            marginLeft: left,
            marginRight: right,
            width: itemWidth,
            height: itemHeight,
            title: itemData[index]["title"],
            postImageUrl: itemData[index]["medium_cover_image"],
            rating: itemData[index]["rating"] * 1.0,
            category: itemData[index]["genres"][0],
            size: itemData[index]["torrents"][0]["size"],
          );
        },
        itemCount: itemData.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: Column(
        children: [
          _buildHeader(),
          _buildList(),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[100],
                  width: 2,
                ),
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: marginHorizontal),
          )
        ],
      ),
    );
  }
}

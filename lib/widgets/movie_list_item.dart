import 'package:flutter/material.dart';

class MovieListItem extends StatelessWidget {
  MovieListItem({
    Key key,
    this.marginLeft,
    this.marginRight,
    this.width,
    this.height,
    this.postImageUrl,
    this.rating,
    this.title,
    this.category,
    this.size,
  }) : super(key: key);

  final double marginLeft, marginRight, width, height;
  final String postImageUrl, title, category, size;
  final double rating;

  // 카테고리 박스 빌드
  Container _buildCategoryBox() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(vertical: 2),
      width: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[600]),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          category,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }

  // 이미지 포스터
  Container _buildPoster() {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[600].withOpacity(0.4),
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          child: Image(
            image: NetworkImage(postImageUrl),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: marginLeft, right: marginRight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 포스터
          _buildPoster(),

          // 영화제목
          Container(
            margin: EdgeInsets.only(top: 5),
            width: width,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
          ),

          // 용량
          Text(
            "Size $size",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 13,
              color: Colors.grey[600],
            ),
          ),

          // bottom
          Container(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildCategoryBox(),
                Row(
                  children: [
                    Icon(
                      Icons.favorite_border,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "$rating",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

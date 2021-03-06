import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BackImage extends StatelessWidget {
  const BackImage({
    Key key,
    this.height,
    this.imageUrl,
  }) : super(key: key);

  final String imageUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height + MediaQuery.of(context).padding.top ??
          MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  final List<String> images = [
    "http://www.listercarterhomes.com/wp-content/uploads/2013/11/dummy-image-square.jpg",
    "http://www.listercarterhomes.com/wp-content/uploads/2013/11/dummy-image-square.jpg",
    "http://www.listercarterhomes.com/wp-content/uploads/2013/11/dummy-image-square.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.network(images[index], fit: BoxFit.cover);
        },
      ),
    );
  }
}

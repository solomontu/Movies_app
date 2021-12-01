import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart'; 
  Widget buildMovieGridView(
      Map<String, dynamic>? data, Orientation orientation) {
    List<Map<String, dynamic>> movieList = [];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: data!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 3 : 4),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
            child: GridTile(
                footer: Text("${data['results'][index]['original_title']}"),
                child: CachedNetworkImage(
                  imageUrl: "http://via.placeholder.com/120x50",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          // colorFilter: const ColorFilter.mode(
                          //     Colors.red, BlendMode.colorBurn)
                              ),
                    ),
                  ),
                  placeholder: (context, url) => const Center(
                      child: SizedBox(
                          width: 10,
                          height: 10,
                          child: CircularProgressIndicator())),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )),
          );
        },
      ),
    );
  }
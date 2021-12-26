import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget buildMovieGridView(Map<String, dynamic>? data, Orientation orientation) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 3.0),
    child: GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: data!['results']!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (orientation == Orientation.portrait) ? 3 : 4),
      itemBuilder: (BuildContext context, int index) {
        return Container(
            margin: const EdgeInsets.all(4),
            height: 300,
            width: 50,
            color: const Color(0xFF323441),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: Container(
                  height: 200,
                  // width: 70,
                  color: const Color(0xFF323441),
                  child: CachedNetworkImage(
                    imageUrl: "http://image.tmdb.org/t/p/w500"+data['results'][index]['poster_path'],
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
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    "${data['results'][index]['original_title']}",
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ));
      },
    ),
  );
}

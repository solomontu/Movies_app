import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/business_logic/models.dart/services/service_locator.dart';
import 'package:movies/business_logic/models.dart/view_model/movies_view_model.dart';
import 'package:movies/ui/Home/uitil_widgets/coommon.dart';
import 'package:movies/util/constants.dart';

class TopRated extends StatefulWidget {
  const TopRated({Key? key}) : super(key: key);

  @override
  _TopRatedState createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  final MovieViewModel _movieViewModel = getIt<MovieViewModel>();
  Future<Map<String, dynamic>?>? _moviesDataFuture;

  Future<Map<String, dynamic>?>? getTopRatedMovies() async {
    _moviesDataFuture = _movieViewModel.getTopRatedMovies(token);
    return _moviesDataFuture;
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Material(
      color: const Color(0xFF323441),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // color: const Color(0xFF70aaae),
        child: FutureBuilder<Map<String, dynamic>?>(
          future: getTopRatedMovies(),
          builder: (BuildContext context,
              AsyncSnapshot<Map<String, dynamic>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.data == null) {
              return const Center(child: Text("Error connecting to server"));
            } else {
              return buildMovieGridView(snapshot.data, orientation);
            }
          },
        ),
      ),
    );
  }


}

import 'package:flutter/material.dart';
import 'package:movies/ui/Home/popular.dart';
import 'package:movies/ui/Home/top_rated.dart';
import 'package:movies/ui/Home/upcoming.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: Text(
            widget.title,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: Icon(Icons.search),
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'POPUAR'),
              Tab(text: 'TOP-RATED'),
              Tab(text: 'UPCOMING'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Popular(),
            TopRated(),
            UpComing(),
          ],
        ),
      ),
    );
  }
}

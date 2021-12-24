import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movie_app/widgets/movie_card.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({Key? key}) : super(key: key);

  @override
  _NowPlayingState createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  List MoviesList = [];
  bool isLoading = true;

  Future getMovies() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed'));

    var jsonData = jsonDecode(response.body);
    var movies = jsonData['results'];
    movies.forEach((movie) {
      setState(() {
        MoviesList.add(movie);
      });
    });

    // print(MoviesList[]);
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    print("calling");
    getMovies();
  }

  Future<void> reFresh() {
    return getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            onRefresh: () => reFresh(),
            child: ListView.builder(
                itemCount: MoviesList.length,
                itemBuilder: (context, movie) {
                  final item = MoviesList[movie]['id'].toString();
                  return Dismissible(
                    key: Key(item),
                    onDismissed: (diresction) {
                      setState(() {
                        MoviesList.removeAt(movie);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Movie deleted')));
                    },
                    // Show a red background as the item is swiped away.
                    background: Container(color: Colors.red),
                    child: MovieCard(
                        imgUrl: MoviesList[movie]['poster_path'],
                        title: MoviesList[movie]['original_title'],
                        desc: MoviesList[movie]['overview'],
                        id: MoviesList[movie]['id']),
                  );
                }),
          );
  }
}

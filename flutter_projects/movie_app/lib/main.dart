import 'package:flutter/material.dart';
import 'package:movie_app/screens/now_playing.dart';
import 'package:movie_app/screens/top_rated.dart';
import 'package:movie_app/widgets/bottom_app_bar.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bottom Navigation",
      home: BottomNavigation()));
}

// popular movie api
// https://api.themoviedb.org/3/movie/popular?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed

// particular movie info by id 
// https://api.themoviedb.org/3/movie/{movie_id}?api_key=<<api_key>>&language=en-US

// backdrop image or detail page image 
// https://image.tmdb.org/t/p/original/lNyLSOKMMeUPr1RsL4KcRuIXwHt.jpg


// top rated movies 
// https://api.themoviedb.org/3/movie/top_rated?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed
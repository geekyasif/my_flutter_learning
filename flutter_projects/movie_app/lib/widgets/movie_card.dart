import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/movie_detail.dart';

class MovieCard extends StatefulWidget {
  String imgUrl;
  String title;
  String desc;
  int id;

  MovieCard(
      {Key? key,
      required this.imgUrl,
      required this.title,
      required this.desc,
      required this.id})
      : super(key: key);

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(widget.id);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetail(id: widget.id)));
      },
      child: Container(
        height: 200.0,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          // boxShadow: [
          //   // BoxShadow(
          //   //   color: Colors.grey.withOpacity(0.8),
          //   //   spreadRadius: 0.4,
          //   //   blurRadius: 6,
          //   //   offset: Offset(0, 2), // changes position of shadow
          //   ),
          // ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "https://image.tmdb.org/t/p/w185/${widget.imgUrl}",
              // fit: BoxFit.cover,
              // width: 200.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              // padding: EdgeInsets.all(10.0),
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      widget.desc,
                      style: TextStyle(
                          letterSpacing: 0.5, color: Colors.grey[700]),
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

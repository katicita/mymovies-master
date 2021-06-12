import 'package:flutter/material.dart';
import 'package:mymovies/model/movie_model.dart';
import 'package:mock_data/mock_data.dart';

class DetailMovie extends StatefulWidget {
  final MovieModel movieModel;

  DetailMovie({Key key, this.movieModel}) : super(key: key);

  @override
  _DetailMovieState createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        widget.movieModel.title,
      )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              // child: ClipRRect(
              // borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                widget.movieModel.urlImage,
                fit: BoxFit.cover,
              ),
              // ),
            ),
            SizedBox(
              height: 11,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    widget.movieModel.title,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    mockString(150),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(mockString(100),
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mymovies/model/movie_model.dart';
import 'package:mymovies/provider/data_provider.dart';
import 'package:mymovies/services/api_data.dart';
import 'package:mymovies/view/popular_movie_card.dart';
import 'package:mymovies/view/trending_movie_card.dart';
import 'package:provider/provider.dart';

import 'detail_movie.dart';

///Widget que muestra el home de todas las peliculas
class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  DataProvider _dataProvider;

  List<MovieModel> _moviesPopular;
  List<MovieModel> _moviesTrending;

  @override
  Widget build(BuildContext context) {
    _dataProvider = Provider.of<DataProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    int _current = 0;

    _moviesPopular = _dataProvider.moviesPopular;
    _moviesTrending = _dataProvider.moviesTrending;

    return FutureBuilder(
        future: getPopularMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MovieModel> _moviesPopular = snapshot.data;
            // List<MovieModel> _moviesTrending = snapshot.data;

            _moviesPopular = snapshot.data;
            // _dataProvider.moviesPopular = snapshot.data;

            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SafeArea(
                    child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text("My Movies",
                            style: Theme.of(context).textTheme.headline4)),
                  ),
                  SizedBox(height: 15),
                  Section(
                    title: "Trending Movies",
                    child: Column(children: [
                      CarouselSlider(
                        items: _moviesPopular
                            .map((movie) => TrendingMovieCard(
                                  movie: movie,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailMovie(
                                                movieModel: movie,
                                              )),
                                    );
                                  },
                                ))
                            .toList(),
                        options: CarouselOptions(
                            autoPlay: true,
                            enlargeCenterPage: true,
                            aspectRatio: 2.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Section(
                    title: "Popular Movies",
                    child: Container(
                      child: GridView.count(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(10.0),
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                        children: _moviesPopular
                            .map((movie) => PopularMovieCard(
                                  movie: movie,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailMovie(
                                                movieModel: movie,
                                              )),
                                    );
                                  },
                                ))
                            .toList(),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text("My Movies",
                          style: Theme.of(context).textTheme.headline4)),
                  SizedBox(height: 15),
                  Section(
                    title: "Trending Movies",
                    child: Container(
                      height: size.height * 0.3,
                      color: Colors.grey,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 5.0,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text("Failed to upload movies"),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Section(
                    title: "Popular Movies",
                    child: Container(
                      height: size.height * 0.3,
                      color: Colors.grey,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 5.0,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text("Failed to upload movies"),
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}

class Section extends StatelessWidget {
  final String title;
  final Widget child;

  const Section({Key key, this.title, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

// Future<bool> loadMoviesData(
//     List<MovieModel> _moviesPopular, List<MovieModel> _moviesTrending) async {
//   if (_moviesPopular.isEmpty) {
//     getPopularMovies();
//   }
//   if (_moviesTrending.isEmpty) {
//     getPopularMovies();
//   }
//   return true;
// }

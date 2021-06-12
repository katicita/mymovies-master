import 'dart:math';

///El modelo de una pelicula.
/// [urlImage] y [numWatches] son llenados por defecto ya que no se tienen esos datos
class MovieModel {
  final id;
  final String title;
  final int year;
  final String urlImage;
  final int watchers;
  final String description;

  MovieModel({
    this.id,
    this.title,
    this.year,
    this.watchers,
    this.urlImage,
    this.description = "asd asd asd asd asd asd asd",
  });

  List<MovieModel> jsontoModel(var json){
    Random random = new Random();
    List<MovieModel> _listMovies = [];

    MovieModel _movieModel;

    for (var item in json) {
      int randomNumber = random.nextInt(1000);

      _movieModel = MovieModel(
        title: item['Title'],
        year: int.parse(item['Year']) ,
        urlImage: item['Poster'],
        watchers: randomNumber,
      );
      _listMovies.add(_movieModel);
    }
    return _listMovies;
  }
}

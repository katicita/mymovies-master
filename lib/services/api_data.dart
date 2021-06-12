import 'dart:math';
import 'package:mymovies/model/movie_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

///Metodo que obtiene los datos del Api
Future<List<MovieModel>> getPopularMovies() async {
  List<MovieModel> _listMovies = [];
  Random random = new Random();

  // Uri uri = Uri.parse('https://api.trakt.tv/movies/popular');
  Uri uri2 = Uri.parse('http://www.omdbapi.com/?s=Batman&page=2&apikey=564727fa');
  http.Response response = await http.get(uri2);
  if (response.statusCode == 200) {
    String body = utf8.decode(response.bodyBytes);
    final jsonData = jsonDecode(body);

    MovieModel _movieModel;
    for (var item in jsonData["Search"]) {
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
  } else {
    throw Exception("Connection failure");
  }
}


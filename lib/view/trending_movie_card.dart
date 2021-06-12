import 'package:flutter/material.dart';
import 'package:mymovies/model/movie_model.dart';

/// Widget que muestra la carta de cada pelicula en tendencia
class TrendingMovieCard extends StatelessWidget {
  final MovieModel movie;
  final VoidCallback onPressed;

  const TrendingMovieCard({Key key, this.movie, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2.5,
            )
          ],
        ),
        constraints: BoxConstraints(minWidth: 150),
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
          horizontal: 7,
          vertical: 5.0,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  movie.urlImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Colors.black45,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 3.0),
                    Text(
                      'Watchers: ' + (movie.watchers).toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

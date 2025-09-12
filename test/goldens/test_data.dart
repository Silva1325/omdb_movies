

import 'package:omdb_movies/src/features/movies/domain/omdb_movie/omdb_movie.dart';
import 'package:omdb_movies/src/features/movies/domain/omdb_movies_response/omdb_movies_response.dart';
import 'package:omdb_movies/src/features/movies/domain/omdb_rating/omdb_rating.dart';

class MoviesData {

  static OMDBMoviesResponse movies(){
    List<OMDBMovie> movies = [MoviesData.movie1()];
    return OMDBMoviesResponse(
      search: movies,
      totalResults: "${movies.length}",
    );
  }

  static OMDBMovie movie1(){
    return OMDBMovie(
      title: 'Breaking Bad',
      year: '2008–2013',
      rated: 'TV-MA',
      released: '20 Jan 2008',
      runtime: '49 min',
      genre: 'Crime, Drama, Thriller',
      director: 'N/A',
      writer: 'Vince Gilligan',
      actors: 'Bryan Cranston, Aaron Paul, Anna Gunn',
      plot: 'A chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine with a former student.',
      language: 'English, Spanish',
      country: 'United States',
      awards: 'Won 2 Golden Globes. 164 wins & 247 nominations total',
      poster: 'https://m.media-amazon.com/images/M/MV5BYmQ4YWMxYjUtNjZmYi00MDQ1LWFjMjMtNjA5ZDdiYjdiODU5XkEyXkFqcGdeQXVyMTMzNDExODE5._V1_SX300.jpg',
      metascore: 'N/A',
      ratings: [
        OMDBRating(source: 'Internet Movie Database', value: '9.5/10'),
      ],
      imdbRating: '9.5',
      imdbVotes: '2,068,781',
      imdbId: 'tt0903747',
      type: 'series',
      totalSeasons: '5',
      response: 'True',
    );
  }

}
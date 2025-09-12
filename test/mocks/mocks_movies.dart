
import 'package:mocktail/mocktail.dart';
import 'package:omdb_movies/src/features/movies/data/movies_repository/movies_repository.dart';
import 'package:omdb_movies/src/features/movies/domain/omdb_movie/omdb_movie.dart';
import 'package:omdb_movies/src/features/movies/domain/omdb_movies_response/omdb_movies_response.dart';


class MockOMDBMoviesResponse extends Mock implements OMDBMoviesResponse {}

class MockOMDBMovie extends Mock implements OMDBMovie {}

class MockOMDBMoviesRepository extends Mock implements OMDBMoviesRepository {}

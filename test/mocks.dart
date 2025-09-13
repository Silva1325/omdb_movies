
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:omdb_movies/src/features/movies/data/movies_repository/movies_repository.dart';

class MockDioClient extends Mock implements Dio {}

class MockOMDBMoviesRepository extends Mock implements OMDBMoviesRepository {}


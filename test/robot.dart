import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:omdb_movies/main.dart';
import 'package:omdb_movies/src/features/movies/data/movies_repository/movies_repository.dart';
import 'package:omdb_movies/src/features/movies/domain/omdb_movie/omdb_movie.dart';
import 'package:omdb_movies/src/features/movies/domain/omdb_movies_response/omdb_movies_response.dart';
import 'features/movies/data/movies_data.dart';
import 'goldens/golden_robot.dart';
import 'mocks.dart';

class Robot {
  final WidgetTester tester;
  final GoldenRobot goldenRobot;

  Robot(this.tester) : goldenRobot = GoldenRobot(tester);

  Future<void> pumpMyApp() async {
    final mockOMDBMoviesRepository = MockOMDBMoviesRepository();

    _stubMoviesRepositoryMethods(mockOMDBMoviesRepository);

    final container = ProviderContainer(
      overrides: [
        moviesRepositoryProvider.overrideWithValue(mockOMDBMoviesRepository),
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(container: container, child: MyApp()),
    );

    await tester.pumpAndSettle();
  }

  void _stubGetMovies(MockOMDBMoviesRepository mockOMDBMoviesRepository) {
    /*
    when(
      () => mockOMDBMoviesRepository.getMovies(
        queryData: any(named: 'queryData'),
        cancelToken: any(named: 'cancelToken'),
      ),
    ).thenAnswer((_) async => await Future.value(MockOMDBMoviesResponse()));
    */
    when(
      () => mockOMDBMoviesRepository.getMovies(
        queryData: any(named: 'queryData'),
        cancelToken: any(named: 'cancelToken'),
      ),
    ).thenAnswer((_) async {
      return OMDBMoviesResponse.fromJson(MoviesData.moviesListJson());
    });
  }

  void _stubGetMovie(MockOMDBMoviesRepository mockOMDBMoviesRepository) {
    when(
      () => mockOMDBMoviesRepository.getMovie(
        movieId: any(named: 'movieId'),
        plotType: any(named: 'plotType'),
        cancelToken: any(named: 'cancelToken'),
      ),
    ).thenAnswer(
      (_) async => OMDBMovie.fromJson(MoviesData.interstellarMovieJson()),
    );
  }

  void _stubMoviesRepositoryMethods(
    MockOMDBMoviesRepository mockOMDBMoviesRepository,
  ) {
    _stubGetMovies(mockOMDBMoviesRepository);
    _stubGetMovie(mockOMDBMoviesRepository);
  }
}

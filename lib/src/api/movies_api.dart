import '../features/movies/data/movies_repository/movies_repository.dart';

class MoviesAPI {
  final String apiKey;

  MoviesAPI(this.apiKey);

  static const _apiBaseUrl = 'www.omdbapi.com';

  Map<String, dynamic> moviesParameters({
    MoviesQueryData? queryData,
    String? movieId,
    PlotType? plotType,
  }) {
    Map<String, dynamic> parameters = {'apikey': apiKey};

    if (queryData != null) {
      parameters.addAll({'page': '${queryData.page}', 's': queryData.query});
    }

    if (movieId != null) {
      parameters.addAll({'i': movieId});
    }

    if (plotType != null) {
      parameters.addAll({'plot': plotType.value});
    }

    return parameters;
  }

  Uri movies({
    MoviesQueryData? queryData,
  }) => _buildUri(
    queryParameters: moviesParameters(
      queryData: queryData,
    )
  );

  Uri movie({
    String? movieId,
    PlotType? plotType,
  }) => _buildUri(
      queryParameters: moviesParameters(
          movieId: movieId,
          plotType: plotType
      )
  );

  Uri _buildUri({required Map<String, dynamic> queryParameters}) {
    return Uri(
      scheme: 'https',
      host: _apiBaseUrl,
      queryParameters: queryParameters,
    );
  }
}

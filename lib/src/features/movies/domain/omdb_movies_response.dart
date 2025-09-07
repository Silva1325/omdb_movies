
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:omdb_movies/src/features/movies/domain/omdb_movie.dart';
part 'omdb_movies_response.freezed.dart';
part 'omdb_movies_response.g.dart';

@freezed
abstract class OMDBMoviesResponse with _$OMDBMoviesResponse {
  const factory OMDBMoviesResponse({
    @JsonKey(name: 'Search') required List<OMDBMovie>? search,
    @JsonKey(name: 'totalResults') required String? totalResults,
    @JsonKey(name: 'Error') required String? error,
  }) = _OMDBMoviesResponse;

  factory OMDBMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$OMDBMoviesResponseFromJson(json);
}

extension OMDBMoviesResponseX on OMDBMoviesResponse {
  //@late
  bool get isEmpty => !hasResults();

  bool hasResults() {
    return search != null && search!.isNotEmpty;
  }

  int searchTotalResults(){
    return totalResults != null ? int.parse(totalResults!) : 0;
  }

  bool hasErrors() {
    return error != null;
  }
}
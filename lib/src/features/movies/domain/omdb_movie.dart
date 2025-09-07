import 'package:freezed_annotation/freezed_annotation.dart';
import 'omdb_rating.dart';

part 'omdb_movie.freezed.dart';
part 'omdb_movie.g.dart';

@freezed
abstract class OMDBMovie with _$OMDBMovie {
  const factory OMDBMovie({
    @JsonKey(name: 'Title') required String? title,
    @JsonKey(name: 'Year') required String? year,
    @JsonKey(name: 'Rated') required String? rated,
    @JsonKey(name: 'Released') required String? released,
    @JsonKey(name: 'Runtime') required String? runtime,
    @JsonKey(name: 'Genre') required String? genre,
    @JsonKey(name: 'Director') required String? director,
    @JsonKey(name: 'Writer') required String? writer,
    @JsonKey(name: 'Actors') required String? actors,
    @JsonKey(name: 'Plot') required String? plot,
    @JsonKey(name: 'Language') required String? language,
    @JsonKey(name: 'Country') required String? country,
    @JsonKey(name: 'Awards') required String? awards,
    @JsonKey(name: 'Poster') required String? poster,
    @JsonKey(name: 'Metascore') required String? metascore,
    @JsonKey(name: 'Ratings') required List<OMDBRating>? ratings,
    @JsonKey(name: 'imdbRating') required String? imdbRating,
    @JsonKey(name: 'imdbVotes') required String? imdbVotes,
    @JsonKey(name: 'imdbID') required String? imdbId,
    @JsonKey(name: 'Type') required String? type,
    @JsonKey(name: 'totalSeasons') String? totalSeasons,
    @JsonKey(name: 'Response') required String? response,
  }) = _OMDBMovie;

  factory OMDBMovie.fromJson(Map<String, Object?> json) =>
      _$OMDBMovieFromJson(json);
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'omdb_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OMDBMovie _$OMDBMovieFromJson(Map<String, dynamic> json) => _OMDBMovie(
  title: json['Title'] as String?,
  year: json['Year'] as String?,
  rated: json['Rated'] as String?,
  released: json['Released'] as String?,
  runtime: json['Runtime'] as String?,
  genre: json['Genre'] as String?,
  director: json['Director'] as String?,
  writer: json['Writer'] as String?,
  actors: json['Actors'] as String?,
  plot: json['Plot'] as String?,
  language: json['Language'] as String?,
  country: json['Country'] as String?,
  awards: json['Awards'] as String?,
  poster: json['Poster'] as String?,
  metascore: json['Metascore'] as String?,
  ratings: (json['Ratings'] as List<dynamic>?)
      ?.map((e) => OMDBRating.fromJson(e as Map<String, dynamic>))
      .toList(),
  imdbRating: json['imdbRating'] as String?,
  imdbVotes: json['imdbVotes'] as String?,
  imdbId: json['imdbID'] as String?,
  type: json['Type'] as String?,
  totalSeasons: json['totalSeasons'] as String?,
  response: json['Response'] as String?,
);

Map<String, dynamic> _$OMDBMovieToJson(_OMDBMovie instance) =>
    <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'Rated': instance.rated,
      'Released': instance.released,
      'Runtime': instance.runtime,
      'Genre': instance.genre,
      'Director': instance.director,
      'Writer': instance.writer,
      'Actors': instance.actors,
      'Plot': instance.plot,
      'Language': instance.language,
      'Country': instance.country,
      'Awards': instance.awards,
      'Poster': instance.poster,
      'Metascore': instance.metascore,
      'Ratings': instance.ratings,
      'imdbRating': instance.imdbRating,
      'imdbVotes': instance.imdbVotes,
      'imdbID': instance.imdbId,
      'Type': instance.type,
      'totalSeasons': instance.totalSeasons,
      'Response': instance.response,
    };

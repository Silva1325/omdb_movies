// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'omdb_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OMDBMoviesResponse _$OMDBMoviesResponseFromJson(Map<String, dynamic> json) =>
    _OMDBMoviesResponse(
      search: (json['Search'] as List<dynamic>?)
          ?.map((e) => OMDBMovie.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: json['totalResults'] as String?,
    );

Map<String, dynamic> _$OMDBMoviesResponseToJson(_OMDBMoviesResponse instance) =>
    <String, dynamic>{
      'Search': instance.search,
      'totalResults': instance.totalResults,
    };

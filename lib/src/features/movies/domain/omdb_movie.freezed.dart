// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'omdb_movie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OMDBMovie {

@JsonKey(name: 'Title') String? get title;@JsonKey(name: 'Year') String? get year;@JsonKey(name: 'Rated') String? get rated;@JsonKey(name: 'Released') String? get released;@JsonKey(name: 'Runtime') String? get runtime;@JsonKey(name: 'Genre') String? get genre;@JsonKey(name: 'Director') String? get director;@JsonKey(name: 'Writer') String? get writer;@JsonKey(name: 'Actors') String? get actors;@JsonKey(name: 'Plot') String? get plot;@JsonKey(name: 'Language') String? get language;@JsonKey(name: 'Country') String? get country;@JsonKey(name: 'Awards') String? get awards;@JsonKey(name: 'Poster') String? get poster;@JsonKey(name: 'Metascore') String? get metascore;@JsonKey(name: 'Ratings') List<OMDBRating>? get ratings;@JsonKey(name: 'imdbRating') String? get imdbRating;@JsonKey(name: 'imdbVotes') String? get imdbVotes;@JsonKey(name: 'imdbID') String? get imdbId;@JsonKey(name: 'Type') String? get type;@JsonKey(name: 'totalSeasons') String? get totalSeasons;@JsonKey(name: 'Response') String? get response;
/// Create a copy of OMDBMovie
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OMDBMovieCopyWith<OMDBMovie> get copyWith => _$OMDBMovieCopyWithImpl<OMDBMovie>(this as OMDBMovie, _$identity);

  /// Serializes this OMDBMovie to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OMDBMovie&&(identical(other.title, title) || other.title == title)&&(identical(other.year, year) || other.year == year)&&(identical(other.rated, rated) || other.rated == rated)&&(identical(other.released, released) || other.released == released)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.director, director) || other.director == director)&&(identical(other.writer, writer) || other.writer == writer)&&(identical(other.actors, actors) || other.actors == actors)&&(identical(other.plot, plot) || other.plot == plot)&&(identical(other.language, language) || other.language == language)&&(identical(other.country, country) || other.country == country)&&(identical(other.awards, awards) || other.awards == awards)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.metascore, metascore) || other.metascore == metascore)&&const DeepCollectionEquality().equals(other.ratings, ratings)&&(identical(other.imdbRating, imdbRating) || other.imdbRating == imdbRating)&&(identical(other.imdbVotes, imdbVotes) || other.imdbVotes == imdbVotes)&&(identical(other.imdbId, imdbId) || other.imdbId == imdbId)&&(identical(other.type, type) || other.type == type)&&(identical(other.totalSeasons, totalSeasons) || other.totalSeasons == totalSeasons)&&(identical(other.response, response) || other.response == response));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,title,year,rated,released,runtime,genre,director,writer,actors,plot,language,country,awards,poster,metascore,const DeepCollectionEquality().hash(ratings),imdbRating,imdbVotes,imdbId,type,totalSeasons,response]);

@override
String toString() {
  return 'OMDBMovie(title: $title, year: $year, rated: $rated, released: $released, runtime: $runtime, genre: $genre, director: $director, writer: $writer, actors: $actors, plot: $plot, language: $language, country: $country, awards: $awards, poster: $poster, metascore: $metascore, ratings: $ratings, imdbRating: $imdbRating, imdbVotes: $imdbVotes, imdbId: $imdbId, type: $type, totalSeasons: $totalSeasons, response: $response)';
}


}

/// @nodoc
abstract mixin class $OMDBMovieCopyWith<$Res>  {
  factory $OMDBMovieCopyWith(OMDBMovie value, $Res Function(OMDBMovie) _then) = _$OMDBMovieCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Title') String? title,@JsonKey(name: 'Year') String? year,@JsonKey(name: 'Rated') String? rated,@JsonKey(name: 'Released') String? released,@JsonKey(name: 'Runtime') String? runtime,@JsonKey(name: 'Genre') String? genre,@JsonKey(name: 'Director') String? director,@JsonKey(name: 'Writer') String? writer,@JsonKey(name: 'Actors') String? actors,@JsonKey(name: 'Plot') String? plot,@JsonKey(name: 'Language') String? language,@JsonKey(name: 'Country') String? country,@JsonKey(name: 'Awards') String? awards,@JsonKey(name: 'Poster') String? poster,@JsonKey(name: 'Metascore') String? metascore,@JsonKey(name: 'Ratings') List<OMDBRating>? ratings,@JsonKey(name: 'imdbRating') String? imdbRating,@JsonKey(name: 'imdbVotes') String? imdbVotes,@JsonKey(name: 'imdbID') String? imdbId,@JsonKey(name: 'Type') String? type,@JsonKey(name: 'totalSeasons') String? totalSeasons,@JsonKey(name: 'Response') String? response
});




}
/// @nodoc
class _$OMDBMovieCopyWithImpl<$Res>
    implements $OMDBMovieCopyWith<$Res> {
  _$OMDBMovieCopyWithImpl(this._self, this._then);

  final OMDBMovie _self;
  final $Res Function(OMDBMovie) _then;

/// Create a copy of OMDBMovie
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? year = freezed,Object? rated = freezed,Object? released = freezed,Object? runtime = freezed,Object? genre = freezed,Object? director = freezed,Object? writer = freezed,Object? actors = freezed,Object? plot = freezed,Object? language = freezed,Object? country = freezed,Object? awards = freezed,Object? poster = freezed,Object? metascore = freezed,Object? ratings = freezed,Object? imdbRating = freezed,Object? imdbVotes = freezed,Object? imdbId = freezed,Object? type = freezed,Object? totalSeasons = freezed,Object? response = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,rated: freezed == rated ? _self.rated : rated // ignore: cast_nullable_to_non_nullable
as String?,released: freezed == released ? _self.released : released // ignore: cast_nullable_to_non_nullable
as String?,runtime: freezed == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as String?,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,director: freezed == director ? _self.director : director // ignore: cast_nullable_to_non_nullable
as String?,writer: freezed == writer ? _self.writer : writer // ignore: cast_nullable_to_non_nullable
as String?,actors: freezed == actors ? _self.actors : actors // ignore: cast_nullable_to_non_nullable
as String?,plot: freezed == plot ? _self.plot : plot // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,awards: freezed == awards ? _self.awards : awards // ignore: cast_nullable_to_non_nullable
as String?,poster: freezed == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as String?,metascore: freezed == metascore ? _self.metascore : metascore // ignore: cast_nullable_to_non_nullable
as String?,ratings: freezed == ratings ? _self.ratings : ratings // ignore: cast_nullable_to_non_nullable
as List<OMDBRating>?,imdbRating: freezed == imdbRating ? _self.imdbRating : imdbRating // ignore: cast_nullable_to_non_nullable
as String?,imdbVotes: freezed == imdbVotes ? _self.imdbVotes : imdbVotes // ignore: cast_nullable_to_non_nullable
as String?,imdbId: freezed == imdbId ? _self.imdbId : imdbId // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,totalSeasons: freezed == totalSeasons ? _self.totalSeasons : totalSeasons // ignore: cast_nullable_to_non_nullable
as String?,response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OMDBMovie].
extension OMDBMoviePatterns on OMDBMovie {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OMDBMovie value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OMDBMovie() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OMDBMovie value)  $default,){
final _that = this;
switch (_that) {
case _OMDBMovie():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OMDBMovie value)?  $default,){
final _that = this;
switch (_that) {
case _OMDBMovie() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Title')  String? title, @JsonKey(name: 'Year')  String? year, @JsonKey(name: 'Rated')  String? rated, @JsonKey(name: 'Released')  String? released, @JsonKey(name: 'Runtime')  String? runtime, @JsonKey(name: 'Genre')  String? genre, @JsonKey(name: 'Director')  String? director, @JsonKey(name: 'Writer')  String? writer, @JsonKey(name: 'Actors')  String? actors, @JsonKey(name: 'Plot')  String? plot, @JsonKey(name: 'Language')  String? language, @JsonKey(name: 'Country')  String? country, @JsonKey(name: 'Awards')  String? awards, @JsonKey(name: 'Poster')  String? poster, @JsonKey(name: 'Metascore')  String? metascore, @JsonKey(name: 'Ratings')  List<OMDBRating>? ratings, @JsonKey(name: 'imdbRating')  String? imdbRating, @JsonKey(name: 'imdbVotes')  String? imdbVotes, @JsonKey(name: 'imdbID')  String? imdbId, @JsonKey(name: 'Type')  String? type, @JsonKey(name: 'totalSeasons')  String? totalSeasons, @JsonKey(name: 'Response')  String? response)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OMDBMovie() when $default != null:
return $default(_that.title,_that.year,_that.rated,_that.released,_that.runtime,_that.genre,_that.director,_that.writer,_that.actors,_that.plot,_that.language,_that.country,_that.awards,_that.poster,_that.metascore,_that.ratings,_that.imdbRating,_that.imdbVotes,_that.imdbId,_that.type,_that.totalSeasons,_that.response);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Title')  String? title, @JsonKey(name: 'Year')  String? year, @JsonKey(name: 'Rated')  String? rated, @JsonKey(name: 'Released')  String? released, @JsonKey(name: 'Runtime')  String? runtime, @JsonKey(name: 'Genre')  String? genre, @JsonKey(name: 'Director')  String? director, @JsonKey(name: 'Writer')  String? writer, @JsonKey(name: 'Actors')  String? actors, @JsonKey(name: 'Plot')  String? plot, @JsonKey(name: 'Language')  String? language, @JsonKey(name: 'Country')  String? country, @JsonKey(name: 'Awards')  String? awards, @JsonKey(name: 'Poster')  String? poster, @JsonKey(name: 'Metascore')  String? metascore, @JsonKey(name: 'Ratings')  List<OMDBRating>? ratings, @JsonKey(name: 'imdbRating')  String? imdbRating, @JsonKey(name: 'imdbVotes')  String? imdbVotes, @JsonKey(name: 'imdbID')  String? imdbId, @JsonKey(name: 'Type')  String? type, @JsonKey(name: 'totalSeasons')  String? totalSeasons, @JsonKey(name: 'Response')  String? response)  $default,) {final _that = this;
switch (_that) {
case _OMDBMovie():
return $default(_that.title,_that.year,_that.rated,_that.released,_that.runtime,_that.genre,_that.director,_that.writer,_that.actors,_that.plot,_that.language,_that.country,_that.awards,_that.poster,_that.metascore,_that.ratings,_that.imdbRating,_that.imdbVotes,_that.imdbId,_that.type,_that.totalSeasons,_that.response);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Title')  String? title, @JsonKey(name: 'Year')  String? year, @JsonKey(name: 'Rated')  String? rated, @JsonKey(name: 'Released')  String? released, @JsonKey(name: 'Runtime')  String? runtime, @JsonKey(name: 'Genre')  String? genre, @JsonKey(name: 'Director')  String? director, @JsonKey(name: 'Writer')  String? writer, @JsonKey(name: 'Actors')  String? actors, @JsonKey(name: 'Plot')  String? plot, @JsonKey(name: 'Language')  String? language, @JsonKey(name: 'Country')  String? country, @JsonKey(name: 'Awards')  String? awards, @JsonKey(name: 'Poster')  String? poster, @JsonKey(name: 'Metascore')  String? metascore, @JsonKey(name: 'Ratings')  List<OMDBRating>? ratings, @JsonKey(name: 'imdbRating')  String? imdbRating, @JsonKey(name: 'imdbVotes')  String? imdbVotes, @JsonKey(name: 'imdbID')  String? imdbId, @JsonKey(name: 'Type')  String? type, @JsonKey(name: 'totalSeasons')  String? totalSeasons, @JsonKey(name: 'Response')  String? response)?  $default,) {final _that = this;
switch (_that) {
case _OMDBMovie() when $default != null:
return $default(_that.title,_that.year,_that.rated,_that.released,_that.runtime,_that.genre,_that.director,_that.writer,_that.actors,_that.plot,_that.language,_that.country,_that.awards,_that.poster,_that.metascore,_that.ratings,_that.imdbRating,_that.imdbVotes,_that.imdbId,_that.type,_that.totalSeasons,_that.response);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OMDBMovie implements OMDBMovie {
  const _OMDBMovie({@JsonKey(name: 'Title') required this.title, @JsonKey(name: 'Year') required this.year, @JsonKey(name: 'Rated') required this.rated, @JsonKey(name: 'Released') required this.released, @JsonKey(name: 'Runtime') required this.runtime, @JsonKey(name: 'Genre') required this.genre, @JsonKey(name: 'Director') required this.director, @JsonKey(name: 'Writer') required this.writer, @JsonKey(name: 'Actors') required this.actors, @JsonKey(name: 'Plot') required this.plot, @JsonKey(name: 'Language') required this.language, @JsonKey(name: 'Country') required this.country, @JsonKey(name: 'Awards') required this.awards, @JsonKey(name: 'Poster') required this.poster, @JsonKey(name: 'Metascore') required this.metascore, @JsonKey(name: 'Ratings') required final  List<OMDBRating>? ratings, @JsonKey(name: 'imdbRating') required this.imdbRating, @JsonKey(name: 'imdbVotes') required this.imdbVotes, @JsonKey(name: 'imdbID') required this.imdbId, @JsonKey(name: 'Type') required this.type, @JsonKey(name: 'totalSeasons') this.totalSeasons, @JsonKey(name: 'Response') required this.response}): _ratings = ratings;
  factory _OMDBMovie.fromJson(Map<String, dynamic> json) => _$OMDBMovieFromJson(json);

@override@JsonKey(name: 'Title') final  String? title;
@override@JsonKey(name: 'Year') final  String? year;
@override@JsonKey(name: 'Rated') final  String? rated;
@override@JsonKey(name: 'Released') final  String? released;
@override@JsonKey(name: 'Runtime') final  String? runtime;
@override@JsonKey(name: 'Genre') final  String? genre;
@override@JsonKey(name: 'Director') final  String? director;
@override@JsonKey(name: 'Writer') final  String? writer;
@override@JsonKey(name: 'Actors') final  String? actors;
@override@JsonKey(name: 'Plot') final  String? plot;
@override@JsonKey(name: 'Language') final  String? language;
@override@JsonKey(name: 'Country') final  String? country;
@override@JsonKey(name: 'Awards') final  String? awards;
@override@JsonKey(name: 'Poster') final  String? poster;
@override@JsonKey(name: 'Metascore') final  String? metascore;
 final  List<OMDBRating>? _ratings;
@override@JsonKey(name: 'Ratings') List<OMDBRating>? get ratings {
  final value = _ratings;
  if (value == null) return null;
  if (_ratings is EqualUnmodifiableListView) return _ratings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'imdbRating') final  String? imdbRating;
@override@JsonKey(name: 'imdbVotes') final  String? imdbVotes;
@override@JsonKey(name: 'imdbID') final  String? imdbId;
@override@JsonKey(name: 'Type') final  String? type;
@override@JsonKey(name: 'totalSeasons') final  String? totalSeasons;
@override@JsonKey(name: 'Response') final  String? response;

/// Create a copy of OMDBMovie
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OMDBMovieCopyWith<_OMDBMovie> get copyWith => __$OMDBMovieCopyWithImpl<_OMDBMovie>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OMDBMovieToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OMDBMovie&&(identical(other.title, title) || other.title == title)&&(identical(other.year, year) || other.year == year)&&(identical(other.rated, rated) || other.rated == rated)&&(identical(other.released, released) || other.released == released)&&(identical(other.runtime, runtime) || other.runtime == runtime)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.director, director) || other.director == director)&&(identical(other.writer, writer) || other.writer == writer)&&(identical(other.actors, actors) || other.actors == actors)&&(identical(other.plot, plot) || other.plot == plot)&&(identical(other.language, language) || other.language == language)&&(identical(other.country, country) || other.country == country)&&(identical(other.awards, awards) || other.awards == awards)&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.metascore, metascore) || other.metascore == metascore)&&const DeepCollectionEquality().equals(other._ratings, _ratings)&&(identical(other.imdbRating, imdbRating) || other.imdbRating == imdbRating)&&(identical(other.imdbVotes, imdbVotes) || other.imdbVotes == imdbVotes)&&(identical(other.imdbId, imdbId) || other.imdbId == imdbId)&&(identical(other.type, type) || other.type == type)&&(identical(other.totalSeasons, totalSeasons) || other.totalSeasons == totalSeasons)&&(identical(other.response, response) || other.response == response));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,title,year,rated,released,runtime,genre,director,writer,actors,plot,language,country,awards,poster,metascore,const DeepCollectionEquality().hash(_ratings),imdbRating,imdbVotes,imdbId,type,totalSeasons,response]);

@override
String toString() {
  return 'OMDBMovie(title: $title, year: $year, rated: $rated, released: $released, runtime: $runtime, genre: $genre, director: $director, writer: $writer, actors: $actors, plot: $plot, language: $language, country: $country, awards: $awards, poster: $poster, metascore: $metascore, ratings: $ratings, imdbRating: $imdbRating, imdbVotes: $imdbVotes, imdbId: $imdbId, type: $type, totalSeasons: $totalSeasons, response: $response)';
}


}

/// @nodoc
abstract mixin class _$OMDBMovieCopyWith<$Res> implements $OMDBMovieCopyWith<$Res> {
  factory _$OMDBMovieCopyWith(_OMDBMovie value, $Res Function(_OMDBMovie) _then) = __$OMDBMovieCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Title') String? title,@JsonKey(name: 'Year') String? year,@JsonKey(name: 'Rated') String? rated,@JsonKey(name: 'Released') String? released,@JsonKey(name: 'Runtime') String? runtime,@JsonKey(name: 'Genre') String? genre,@JsonKey(name: 'Director') String? director,@JsonKey(name: 'Writer') String? writer,@JsonKey(name: 'Actors') String? actors,@JsonKey(name: 'Plot') String? plot,@JsonKey(name: 'Language') String? language,@JsonKey(name: 'Country') String? country,@JsonKey(name: 'Awards') String? awards,@JsonKey(name: 'Poster') String? poster,@JsonKey(name: 'Metascore') String? metascore,@JsonKey(name: 'Ratings') List<OMDBRating>? ratings,@JsonKey(name: 'imdbRating') String? imdbRating,@JsonKey(name: 'imdbVotes') String? imdbVotes,@JsonKey(name: 'imdbID') String? imdbId,@JsonKey(name: 'Type') String? type,@JsonKey(name: 'totalSeasons') String? totalSeasons,@JsonKey(name: 'Response') String? response
});




}
/// @nodoc
class __$OMDBMovieCopyWithImpl<$Res>
    implements _$OMDBMovieCopyWith<$Res> {
  __$OMDBMovieCopyWithImpl(this._self, this._then);

  final _OMDBMovie _self;
  final $Res Function(_OMDBMovie) _then;

/// Create a copy of OMDBMovie
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? year = freezed,Object? rated = freezed,Object? released = freezed,Object? runtime = freezed,Object? genre = freezed,Object? director = freezed,Object? writer = freezed,Object? actors = freezed,Object? plot = freezed,Object? language = freezed,Object? country = freezed,Object? awards = freezed,Object? poster = freezed,Object? metascore = freezed,Object? ratings = freezed,Object? imdbRating = freezed,Object? imdbVotes = freezed,Object? imdbId = freezed,Object? type = freezed,Object? totalSeasons = freezed,Object? response = freezed,}) {
  return _then(_OMDBMovie(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as String?,rated: freezed == rated ? _self.rated : rated // ignore: cast_nullable_to_non_nullable
as String?,released: freezed == released ? _self.released : released // ignore: cast_nullable_to_non_nullable
as String?,runtime: freezed == runtime ? _self.runtime : runtime // ignore: cast_nullable_to_non_nullable
as String?,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,director: freezed == director ? _self.director : director // ignore: cast_nullable_to_non_nullable
as String?,writer: freezed == writer ? _self.writer : writer // ignore: cast_nullable_to_non_nullable
as String?,actors: freezed == actors ? _self.actors : actors // ignore: cast_nullable_to_non_nullable
as String?,plot: freezed == plot ? _self.plot : plot // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,awards: freezed == awards ? _self.awards : awards // ignore: cast_nullable_to_non_nullable
as String?,poster: freezed == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as String?,metascore: freezed == metascore ? _self.metascore : metascore // ignore: cast_nullable_to_non_nullable
as String?,ratings: freezed == ratings ? _self._ratings : ratings // ignore: cast_nullable_to_non_nullable
as List<OMDBRating>?,imdbRating: freezed == imdbRating ? _self.imdbRating : imdbRating // ignore: cast_nullable_to_non_nullable
as String?,imdbVotes: freezed == imdbVotes ? _self.imdbVotes : imdbVotes // ignore: cast_nullable_to_non_nullable
as String?,imdbId: freezed == imdbId ? _self.imdbId : imdbId // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,totalSeasons: freezed == totalSeasons ? _self.totalSeasons : totalSeasons // ignore: cast_nullable_to_non_nullable
as String?,response: freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

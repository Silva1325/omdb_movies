// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'omdb_movies_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OMDBMoviesResponse {

@JsonKey(name: 'Search') List<OMDBMovie>? get search;@JsonKey(name: 'totalResults') String? get totalResults;
/// Create a copy of OMDBMoviesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OMDBMoviesResponseCopyWith<OMDBMoviesResponse> get copyWith => _$OMDBMoviesResponseCopyWithImpl<OMDBMoviesResponse>(this as OMDBMoviesResponse, _$identity);

  /// Serializes this OMDBMoviesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OMDBMoviesResponse&&const DeepCollectionEquality().equals(other.search, search)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(search),totalResults);

@override
String toString() {
  return 'OMDBMoviesResponse(search: $search, totalResults: $totalResults)';
}


}

/// @nodoc
abstract mixin class $OMDBMoviesResponseCopyWith<$Res>  {
  factory $OMDBMoviesResponseCopyWith(OMDBMoviesResponse value, $Res Function(OMDBMoviesResponse) _then) = _$OMDBMoviesResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Search') List<OMDBMovie>? search,@JsonKey(name: 'totalResults') String? totalResults
});




}
/// @nodoc
class _$OMDBMoviesResponseCopyWithImpl<$Res>
    implements $OMDBMoviesResponseCopyWith<$Res> {
  _$OMDBMoviesResponseCopyWithImpl(this._self, this._then);

  final OMDBMoviesResponse _self;
  final $Res Function(OMDBMoviesResponse) _then;

/// Create a copy of OMDBMoviesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? search = freezed,Object? totalResults = freezed,}) {
  return _then(_self.copyWith(
search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as List<OMDBMovie>?,totalResults: freezed == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OMDBMoviesResponse].
extension OMDBMoviesResponsePatterns on OMDBMoviesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OMDBMoviesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OMDBMoviesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OMDBMoviesResponse value)  $default,){
final _that = this;
switch (_that) {
case _OMDBMoviesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OMDBMoviesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _OMDBMoviesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Search')  List<OMDBMovie>? search, @JsonKey(name: 'totalResults')  String? totalResults)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OMDBMoviesResponse() when $default != null:
return $default(_that.search,_that.totalResults);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Search')  List<OMDBMovie>? search, @JsonKey(name: 'totalResults')  String? totalResults)  $default,) {final _that = this;
switch (_that) {
case _OMDBMoviesResponse():
return $default(_that.search,_that.totalResults);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Search')  List<OMDBMovie>? search, @JsonKey(name: 'totalResults')  String? totalResults)?  $default,) {final _that = this;
switch (_that) {
case _OMDBMoviesResponse() when $default != null:
return $default(_that.search,_that.totalResults);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OMDBMoviesResponse implements OMDBMoviesResponse {
  const _OMDBMoviesResponse({@JsonKey(name: 'Search') required final  List<OMDBMovie>? search, @JsonKey(name: 'totalResults') required this.totalResults}): _search = search;
  factory _OMDBMoviesResponse.fromJson(Map<String, dynamic> json) => _$OMDBMoviesResponseFromJson(json);

 final  List<OMDBMovie>? _search;
@override@JsonKey(name: 'Search') List<OMDBMovie>? get search {
  final value = _search;
  if (value == null) return null;
  if (_search is EqualUnmodifiableListView) return _search;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'totalResults') final  String? totalResults;

/// Create a copy of OMDBMoviesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OMDBMoviesResponseCopyWith<_OMDBMoviesResponse> get copyWith => __$OMDBMoviesResponseCopyWithImpl<_OMDBMoviesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OMDBMoviesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OMDBMoviesResponse&&const DeepCollectionEquality().equals(other._search, _search)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_search),totalResults);

@override
String toString() {
  return 'OMDBMoviesResponse(search: $search, totalResults: $totalResults)';
}


}

/// @nodoc
abstract mixin class _$OMDBMoviesResponseCopyWith<$Res> implements $OMDBMoviesResponseCopyWith<$Res> {
  factory _$OMDBMoviesResponseCopyWith(_OMDBMoviesResponse value, $Res Function(_OMDBMoviesResponse) _then) = __$OMDBMoviesResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Search') List<OMDBMovie>? search,@JsonKey(name: 'totalResults') String? totalResults
});




}
/// @nodoc
class __$OMDBMoviesResponseCopyWithImpl<$Res>
    implements _$OMDBMoviesResponseCopyWith<$Res> {
  __$OMDBMoviesResponseCopyWithImpl(this._self, this._then);

  final _OMDBMoviesResponse _self;
  final $Res Function(_OMDBMoviesResponse) _then;

/// Create a copy of OMDBMoviesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? search = freezed,Object? totalResults = freezed,}) {
  return _then(_OMDBMoviesResponse(
search: freezed == search ? _self._search : search // ignore: cast_nullable_to_non_nullable
as List<OMDBMovie>?,totalResults: freezed == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

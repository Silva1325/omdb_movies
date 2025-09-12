// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'omdb_rating.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OMDBRating {

@JsonKey(name: 'Source') String? get source;@JsonKey(name: 'Value') String? get value;
/// Create a copy of OMDBRating
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OMDBRatingCopyWith<OMDBRating> get copyWith => _$OMDBRatingCopyWithImpl<OMDBRating>(this as OMDBRating, _$identity);

  /// Serializes this OMDBRating to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OMDBRating&&(identical(other.source, source) || other.source == source)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,value);

@override
String toString() {
  return 'OMDBRating(source: $source, value: $value)';
}


}

/// @nodoc
abstract mixin class $OMDBRatingCopyWith<$Res>  {
  factory $OMDBRatingCopyWith(OMDBRating value, $Res Function(OMDBRating) _then) = _$OMDBRatingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Source') String? source,@JsonKey(name: 'Value') String? value
});




}
/// @nodoc
class _$OMDBRatingCopyWithImpl<$Res>
    implements $OMDBRatingCopyWith<$Res> {
  _$OMDBRatingCopyWithImpl(this._self, this._then);

  final OMDBRating _self;
  final $Res Function(OMDBRating) _then;

/// Create a copy of OMDBRating
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? source = freezed,Object? value = freezed,}) {
  return _then(_self.copyWith(
source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OMDBRating].
extension OMDBRatingPatterns on OMDBRating {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OMDBRating value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OMDBRating() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OMDBRating value)  $default,){
final _that = this;
switch (_that) {
case _OMDBRating():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OMDBRating value)?  $default,){
final _that = this;
switch (_that) {
case _OMDBRating() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Source')  String? source, @JsonKey(name: 'Value')  String? value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OMDBRating() when $default != null:
return $default(_that.source,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Source')  String? source, @JsonKey(name: 'Value')  String? value)  $default,) {final _that = this;
switch (_that) {
case _OMDBRating():
return $default(_that.source,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Source')  String? source, @JsonKey(name: 'Value')  String? value)?  $default,) {final _that = this;
switch (_that) {
case _OMDBRating() when $default != null:
return $default(_that.source,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OMDBRating implements OMDBRating {
  const _OMDBRating({@JsonKey(name: 'Source') required this.source, @JsonKey(name: 'Value') required this.value});
  factory _OMDBRating.fromJson(Map<String, dynamic> json) => _$OMDBRatingFromJson(json);

@override@JsonKey(name: 'Source') final  String? source;
@override@JsonKey(name: 'Value') final  String? value;

/// Create a copy of OMDBRating
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OMDBRatingCopyWith<_OMDBRating> get copyWith => __$OMDBRatingCopyWithImpl<_OMDBRating>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OMDBRatingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OMDBRating&&(identical(other.source, source) || other.source == source)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,value);

@override
String toString() {
  return 'OMDBRating(source: $source, value: $value)';
}


}

/// @nodoc
abstract mixin class _$OMDBRatingCopyWith<$Res> implements $OMDBRatingCopyWith<$Res> {
  factory _$OMDBRatingCopyWith(_OMDBRating value, $Res Function(_OMDBRating) _then) = __$OMDBRatingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Source') String? source,@JsonKey(name: 'Value') String? value
});




}
/// @nodoc
class __$OMDBRatingCopyWithImpl<$Res>
    implements _$OMDBRatingCopyWith<$Res> {
  __$OMDBRatingCopyWithImpl(this._self, this._then);

  final _OMDBRating _self;
  final $Res Function(_OMDBRating) _then;

/// Create a copy of OMDBRating
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? source = freezed,Object? value = freezed,}) {
  return _then(_OMDBRating(
source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

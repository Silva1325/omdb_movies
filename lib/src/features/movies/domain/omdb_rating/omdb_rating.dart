import 'package:freezed_annotation/freezed_annotation.dart';

part 'omdb_rating.freezed.dart';
part 'omdb_rating.g.dart';

@freezed
abstract class OMDBRating with _$OMDBRating {
  const factory OMDBRating({
    @JsonKey(name: 'Source') required String? source,
    @JsonKey(name: 'Value') required String? value,
  }) = _OMDBRating;

  factory OMDBRating.fromJson(Map<String, dynamic> json) =>
      _$OMDBRatingFromJson(json);
}
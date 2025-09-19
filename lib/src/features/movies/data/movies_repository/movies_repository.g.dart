// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$moviesRepositoryHash() => r'dcfd2f2ce842b759a27d558b12195e4a5fe5b03e';

/// See also [moviesRepository].
@ProviderFor(moviesRepository)
final moviesRepositoryProvider =
    AutoDisposeProvider<OMDBMoviesRepository>.internal(
      moviesRepository,
      name: r'moviesRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$moviesRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MoviesRepositoryRef = AutoDisposeProviderRef<OMDBMoviesRepository>;
String _$getMoviesHash() => r'34228af209397afae2faa66198cf60cab74a0f87';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getMovies].
@ProviderFor(getMovies)
const getMoviesProvider = GetMoviesFamily();

/// See also [getMovies].
class GetMoviesFamily extends Family<AsyncValue<OMDBMoviesResponse>> {
  /// See also [getMovies].
  const GetMoviesFamily();

  /// See also [getMovies].
  GetMoviesProvider call({required ({int page, String query}) queryData}) {
    return GetMoviesProvider(queryData: queryData);
  }

  @override
  GetMoviesProvider getProviderOverride(covariant GetMoviesProvider provider) {
    return call(queryData: provider.queryData);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getMoviesProvider';
}

/// See also [getMovies].
class GetMoviesProvider extends AutoDisposeFutureProvider<OMDBMoviesResponse> {
  /// See also [getMovies].
  GetMoviesProvider({required ({int page, String query}) queryData})
    : this._internal(
        (ref) => getMovies(ref as GetMoviesRef, queryData: queryData),
        from: getMoviesProvider,
        name: r'getMoviesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$getMoviesHash,
        dependencies: GetMoviesFamily._dependencies,
        allTransitiveDependencies: GetMoviesFamily._allTransitiveDependencies,
        queryData: queryData,
      );

  GetMoviesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.queryData,
  }) : super.internal();

  final ({int page, String query}) queryData;

  @override
  Override overrideWith(
    FutureOr<OMDBMoviesResponse> Function(GetMoviesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMoviesProvider._internal(
        (ref) => create(ref as GetMoviesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        queryData: queryData,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<OMDBMoviesResponse> createElement() {
    return _GetMoviesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMoviesProvider && other.queryData == queryData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, queryData.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetMoviesRef on AutoDisposeFutureProviderRef<OMDBMoviesResponse> {
  /// The parameter `queryData` of this provider.
  ({int page, String query}) get queryData;
}

class _GetMoviesProviderElement
    extends AutoDisposeFutureProviderElement<OMDBMoviesResponse>
    with GetMoviesRef {
  _GetMoviesProviderElement(super.provider);

  @override
  ({int page, String query}) get queryData =>
      (origin as GetMoviesProvider).queryData;
}

String _$getMovieHash() => r'a50a9285d882cad70afab4e1daf55e1487490b12';

/// See also [getMovie].
@ProviderFor(getMovie)
const getMovieProvider = GetMovieFamily();

/// See also [getMovie].
class GetMovieFamily extends Family<AsyncValue<OMDBMovie>> {
  /// See also [getMovie].
  const GetMovieFamily();

  /// See also [getMovie].
  GetMovieProvider call({
    required String movieId,
    required PlotType? plotType,
  }) {
    return GetMovieProvider(movieId: movieId, plotType: plotType);
  }

  @override
  GetMovieProvider getProviderOverride(covariant GetMovieProvider provider) {
    return call(movieId: provider.movieId, plotType: provider.plotType);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getMovieProvider';
}

/// See also [getMovie].
class GetMovieProvider extends AutoDisposeFutureProvider<OMDBMovie> {
  /// See also [getMovie].
  GetMovieProvider({required String movieId, required PlotType? plotType})
    : this._internal(
        (ref) =>
            getMovie(ref as GetMovieRef, movieId: movieId, plotType: plotType),
        from: getMovieProvider,
        name: r'getMovieProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$getMovieHash,
        dependencies: GetMovieFamily._dependencies,
        allTransitiveDependencies: GetMovieFamily._allTransitiveDependencies,
        movieId: movieId,
        plotType: plotType,
      );

  GetMovieProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
    required this.plotType,
  }) : super.internal();

  final String movieId;
  final PlotType? plotType;

  @override
  Override overrideWith(
    FutureOr<OMDBMovie> Function(GetMovieRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMovieProvider._internal(
        (ref) => create(ref as GetMovieRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
        plotType: plotType,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<OMDBMovie> createElement() {
    return _GetMovieProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMovieProvider &&
        other.movieId == movieId &&
        other.plotType == plotType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);
    hash = _SystemHash.combine(hash, plotType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetMovieRef on AutoDisposeFutureProviderRef<OMDBMovie> {
  /// The parameter `movieId` of this provider.
  String get movieId;

  /// The parameter `plotType` of this provider.
  PlotType? get plotType;
}

class _GetMovieProviderElement
    extends AutoDisposeFutureProviderElement<OMDBMovie>
    with GetMovieRef {
  _GetMovieProviderElement(super.provider);

  @override
  String get movieId => (origin as GetMovieProvider).movieId;
  @override
  PlotType? get plotType => (origin as GetMovieProvider).plotType;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

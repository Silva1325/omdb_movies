
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../env/env.dart';
import '../domain/omdb_movies_response.dart';
part 'movies_repository.g.dart';

typedef MoviesQueryData = ({String query, int page});

abstract class MoviesRepository {
  Future<OMDBMoviesResponse> getMovies({required MoviesQueryData queryData, CancelToken? cancelToken});
}

class OMDBMoviesRepository implements MoviesRepository {

  final Dio client;
  final String apiKey;

  const OMDBMoviesRepository({required this.client, required this.apiKey});

  @override
  Future<OMDBMoviesResponse> getMovies({required MoviesQueryData queryData, CancelToken? cancelToken}) async {
    final uri = Uri(
      scheme: 'https',
      host: 'www.omdbapi.com',
      queryParameters: {
        'apikey': apiKey,
        'page': '${queryData.page}',
        's': queryData.query,
      },
    );
    print('PAGE -> ${queryData.page}');
    final response = await client.getUri(uri, cancelToken: cancelToken);
    return OMDBMoviesResponse.fromJson(response.data);
  }

}

@riverpod
OMDBMoviesRepository moviesRepository(Ref ref){
  return OMDBMoviesRepository(client: Dio(), apiKey: Env.omdbApiKey);
}

@riverpod
Future<OMDBMoviesResponse> getMovies(Ref ref,{required MoviesQueryData queryData, CancelToken? cancelToken}) async {
  final moviesRepository = ref.watch(moviesRepositoryProvider);
  return await moviesRepository.getMovies(queryData: queryData,cancelToken: cancelToken);
}



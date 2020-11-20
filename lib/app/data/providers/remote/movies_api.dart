import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_pattern/app/data/models/movie.dart';
import 'package:getx_pattern/app/utils/app_constants.dart';

class MoviesAPI {
  final Dio _dio = Get.find<Dio>();

  Future<List<Movie>> getMovies() async {
    final Response response = await _dio.get(
      AppConstants.MOVIE_TOP_RATED,
      queryParameters: {"api_key": AppConstants.THE_MOVIE_API},
    );

    return (response.data['results'] as List)
        .map((e) => Movie.fromJson(e))
        .toList();
  }
}

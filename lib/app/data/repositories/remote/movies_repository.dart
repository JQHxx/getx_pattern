import 'package:get/get.dart';
import 'package:getx_pattern/app/data/models/movie.dart';
import 'package:getx_pattern/app/data/providers/remote/movies_api.dart';

class MovieRepository {
  MoviesAPI _moviesAPI = Get.find<MoviesAPI>();

  Future<List<Movie>> getTopMovies() => _moviesAPI.getMovies();
}

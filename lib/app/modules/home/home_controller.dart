import 'package:get/get.dart';
import 'package:getx_pattern/app/data/models/movie.dart';
import 'package:getx_pattern/app/data/repositories/local/local_authentication_repository.dart';
import 'package:getx_pattern/app/data/repositories/remote/movies_repository.dart';
import 'package:getx_pattern/app/routes/app_routes.dart';

class HomeController extends GetxController {
  final _localAuthRepository = Get.find<LocalAuthRepository>();
  final _movieRepository = Get.find<MovieRepository>();

  List<Movie> _listTopMovies = [];

  List<Movie> get listTopMovies => _listTopMovies;

  @override
  void onReady() {
    super.onReady();
    _getTopMovies();
  }

  void _getTopMovies() async {
    try {
      _listTopMovies = await _movieRepository.getTopMovies();

      update(['list_movies']);
    } catch (e) {
      print(e);
    }
  }

  void logOut() async {
    await _localAuthRepository.logOut();
    Get.offNamedUntil(AppRoutes.LOGIN, (_) => false);
  }
}

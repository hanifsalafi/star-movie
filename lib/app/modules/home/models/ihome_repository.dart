import 'package:starmovie/app/modules/home/models/movie_home_model.dart';

abstract class IHomeRepository {
  Future<MovieHomeModel?> getMovies();
}
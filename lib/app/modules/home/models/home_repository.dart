import 'package:starmovie/app/modules/home/models/ihome_repository.dart';
import 'package:starmovie/app/modules/home/models/movie_home_model.dart';
import 'package:starmovie/app/modules/home/provider/home_provider.dart';


class HomeRepository implements IHomeRepository {
  HomeRepository({required this.provider});

  final IHomeProvider provider;

  @override
  Future<MovieHomeModel?> getMovies() async {
    final movies = await provider.getMovies("/movie/now_playing?api_key=8ccec078028bd550c96dd69c7af7e74a&language=en-US&page=1");
    if (movies.status.hasError) {
      return Future.error([movies.statusText]);
    } else {
      return movies.body;
    }
  }
}
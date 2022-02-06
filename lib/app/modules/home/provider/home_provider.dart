import 'dart:convert';

import 'package:get/get.dart';
import 'package:starmovie/app/modules/home/models/movie_home_model.dart';

// class HomeProvider extends GetConnect {
//   String apiURL =
//       "https://api.themoviedb.org/3/movie/now_playing?api_key=8ccec078028bd550c96dd69c7af7e74a&language=en-US&page=1";

//   // static Future<MovieHomeModel> getMovieNowPlaying() async {

//   //   final apiResult = get(apiURL);
//   //   var jsonObject = json.decode(apiResult.body);
//   //   var userData = (jsonObject as Map<String, dynamic>)['data'];

//   //   return MovieHomeModel.getMovies(userData);
//   // }
//   Future<Object> fetchProducts() async {
//      String apiURL =
//       "https://api.themoviedb.org/3/movie/now_playing?api_key=8ccec078028bd550c96dd69c7af7e74a&language=en-US&page=1";

//     final response = await get(apiURL);
//     if (response.status.hasError) {
//       return Future.error(response.statusText);
//     } else {
//       var jsonObject = json.decode(response.body);
//       var userData = (jsonObject as Map<String, dynamic>)['data'];
//       return MovieHomeModel.getMovies(userData);
//     }

//   Future<Response> getMovies() => get(apiURL);
// }

class HomeProvider extends GetConnect {
  Future<List<dynamic>> getMovies() async {
    String apiURL =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=8ccec078028bd550c96dd69c7af7e74a&language=en-US&page=1";

    final response = await get(apiURL);
    if (response.status.hasError) {
      return Future.error([response.statusText]);
    } else {
      return response.body['results'];
    }
  }
}

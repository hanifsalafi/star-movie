import 'package:get/get.dart';
import 'package:starmovie/app/modules/home/models/home_repository.dart';
import 'package:starmovie/app/modules/home/models/ihome_repository.dart';
import 'package:starmovie/app/modules/home/models/movie_home_model.dart';
import 'package:starmovie/app/modules/home/provider/home_provider.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>> {
  //TODO: Implement HomeController

  final count = 0.obs;
  var tabTextIndexSelected = 0.obs;
  
  final IHomeRepository homeRepository = HomeRepository(provider: Get.find());

  @override
  void onInit() {
    super.onInit();

    print("Hit API - Get Movies");
    homeRepository.getMovies().then((data) {
      print("Get Data");
      change(data?.results, status: RxStatus.success());
    }, onError: (err) {
      print("Get Error");
      change(
        null,
        status: RxStatus.error(err.toString()),
      );
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}

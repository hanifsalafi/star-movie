import 'package:get/get.dart';
import 'package:starmovie/app/modules/home/models/movie_home_model.dart';
import 'package:starmovie/app/modules/home/provider/home_provider.dart';

class HomeController  extends GetxController with StateMixin<List<dynamic>> {
  //TODO: Implement HomeController

  final count = 0.obs;
  var tabTextIndexSelected = 0.obs;

  @override
  void onInit() {
    super.onInit();

    HomeProvider().getMovies().then((resp) {
      change(resp, status: RxStatus.success());
    }, onError: (err) {
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

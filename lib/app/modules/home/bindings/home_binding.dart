import 'package:get/get.dart';
import 'package:starmovie/app/modules/home/models/ihome_repository.dart';

import '../controllers/home_controller.dart';
import '../models/home_repository.dart';
import '../provider/home_provider.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<IHomeProvider>(() => HomeProvider());
    Get.lazyPut<IHomeRepository>(() => HomeRepository(provider: Get.find()));
  }
}

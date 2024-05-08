
import 'package:al_hadith/presentation/hadith_details/controllers/hadith_details.controller.dart';
import 'package:get/get.dart';

class HadithDetailsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HadithDetailsController>(
          () => HadithDetailsController(),
    );
  }
}
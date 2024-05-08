import 'package:get/get.dart';

import '../../../core/constants/asset_constant.dart';
import '../../home/controllers/home.controller.dart';
import '../../home/home.screen.dart';
import '../../remark/remark.screen.dart';
import '../nav_screen.screen.dart';

class NavScreenController extends GetxController {
  //TODO: Implement NavScreenController
  final selectedIndex = 0.obs;

  final pageList = [
    const HomeScreen(),
    const RemarkScreen(),
    const HomeScreen(),
    const RemarkScreen(),
  ];



  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Get.put(HomeController());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

import 'package:get/get.dart';

import '../../../data/providers/database/db_helper.dart';

class HomeController extends GetxController {
  final bookList = [].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
     bookList.value = await DataBaseHelper.readBook();
  }

}

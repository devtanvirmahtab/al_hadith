import 'package:al_hadith/data/models/hadith_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/chapter_model.dart';
import '../../../data/models/section_model.dart';
import '../../../data/providers/database/db_helper.dart';

class HadithDetailsController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final hadithDetailsList = <HadithModel>[].obs;
  final sectionListData = <SectionModel>[].obs;
  final title = "".obs;
  final subtitle = "".obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    final argument = Get.arguments;
    title.value = argument['title'];
    subtitle.value  = argument['subtitle'];
    final data = argument['data'];
    print("book name = $data");
    sectionListData.value = await DataBaseHelper.readSection("$data");
    hadithDetailsList.value = await DataBaseHelper.readHadith("$data");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
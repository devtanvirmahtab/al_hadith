import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/constants/asset_constant.dart';
import '../../core/constants/color_constant.dart';
import '../../core/widgets/chapter_item_card.dart';
import '../../core/widgets/title_subtitle_text.dart';
import 'controllers/chapter.controller.dart';

class ChapterScreen extends GetView<ChapterController> {
  const ChapterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: primaryColor,
      ),
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Image.asset(
                        backIcon,
                        height: 18,
                      ),
                    ),
                    const SizedBox(width: 20),
                    TitleSubtitleText(
                      title: controller.title.value,
                      subtitle: "${controller.subtitle.value} টি হাদিস",
                      isWhite: true,
                      subFontColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  controller.searchController.text = value;
                                  controller.searchFilter();
                                },
                                decoration: const InputDecoration(
                                    hintText: "অধ্যায় সার্চ করুন",
                                    border: InputBorder.none),
                              ),
                            ),
                            Image.asset(
                              searchIcon,
                              width: 25,
                              color: const Color(0xFF5D646F),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Obx(() {
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.chapterList.length,
                            itemBuilder: (context, index) {
                              return ChapterItemCard(
                                chapterModel: controller.chapterList[index],
                                title: controller.title.value,
                              );
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

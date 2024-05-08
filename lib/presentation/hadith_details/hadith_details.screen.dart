import 'package:al_hadith/data/models/hadith_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/asset_constant.dart';
import '../../core/constants/color_constant.dart';
import '../../core/widgets/title_subtitle_text.dart';
import 'controllers/hadith_details.controller.dart';

class HadithDetailsScreen extends GetView<HadithDetailsController> {
  const HadithDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    subtitle: controller.subtitle.value,
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
                child: Obx(() {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      itemCount: controller.sectionListData.length,
                      itemBuilder: (context, index) {
                        final data = controller.sectionListData[index];
                        final title =
                            data.number == data.title ? '' : data.title;
                        return Column(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: '${data.number}',
                                      style: const TextStyle(
                                        fontFamily: 'Kalpurush',
                                        color: primaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' $title',
                                          style: TextStyle(
                                            fontFamily: 'Kalpurush',
                                            color:
                                                Colors.black.withOpacity(0.65),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (data.preface?.isNotEmpty ?? false)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Divider(
                                        height: 0.5,
                                        thickness: 1,
                                        color: Colors.grey.withOpacity(0.2),
                                      ),
                                    ),
                                  if (data.preface?.isNotEmpty ?? false)
                                    Text(
                                      '${data.preface}',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.65),
                                        fontSize: 15,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Obx(() {
                              return hadithWidgetList(data.sectionId);
                            }),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget hadithWidgetList(sectionId) {
    List<HadithModel> hadithList = <HadithModel>[];
    for (var element in controller.hadithDetailsList) {
      if (element.sectionId == sectionId) {
        hadithList.add(element);
      }
    }
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: hadithList.length,
      itemBuilder: (BuildContext context, int index) {
        double bottom = index == hadithList.last ? 0 : 5;
        final hadithData = hadithList[index];
        return Container(
          margin: EdgeInsets.only(
            top: 5,
            bottom: bottom,
          ),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          hexaIcon,
                          fit: BoxFit.cover,
                          color: primaryColor,
                        ),
                        const Center(
                          child: Text(
                            "B",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TitleSubtitleText(
                      title: hadithData.grade ?? '',
                      subtitle: "হাদিস: ${hadithData.hadithId}",
                      subFontSize: 14,
                      subFontWeight: FontWeight.w600,
                      subFontColor: primaryColor,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      hadithData.grade ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${hadithData.ar}',
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontFamily: 'KFGQ',
                  color: Colors.black,
                  fontSize: 20,
                  height: 2,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${hadithData.narrator}',
                style: const TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  height: 2,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${hadithData.bn}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  height: 1.5,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

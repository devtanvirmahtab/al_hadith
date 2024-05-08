import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/chapter_model.dart';
import '../../infrastructure/navigation/routes.dart';
import '../constants/asset_constant.dart';
import '../constants/color_constant.dart';
import 'title_subtitle_text.dart';

class ChapterItemCard extends StatelessWidget {
  const ChapterItemCard({
    super.key,
    required this.chapterModel,
    required this.title,
  });

  final ChapterModel chapterModel;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.HADITH_DETAILS, arguments: {
          "data": chapterModel.chapterId.toString(),
          "title": title,
          "subtitle": chapterModel.title.toString(),
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
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
                  Center(
                    child: Text(
                      chapterModel.chapterId.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            // SizedBox(
            //   width: 50,
            //   height: 50,
            //   child: CircleAvatar(
            //     backgroundColor: primaryColor,
            //     child: Text(
            //       chapterModel.chapterId.toString(),
            //       style: const TextStyle(
            //         fontSize: 18,
            //         fontWeight: FontWeight.w600,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(width: 10),
            Expanded(
              child: TitleSubtitleText(
                title: chapterModel.title,
                subtitle: "হাদিসের রেঞ্জ : ${chapterModel.hadithRange}",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

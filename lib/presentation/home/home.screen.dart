import 'package:al_hadith/core/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/widgets/book_item_card.dart';
import 'components/header.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF0E8468),
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F4F4),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Header(),
                const SizedBox(height: 35),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    "সব হাদিসের বই ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFF101010),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Obx(() {
                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: controller.bookList.length,
                    itemBuilder: (context, index) {
                      return BookItemCard(
                        hadithBook: controller.bookList[index],
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

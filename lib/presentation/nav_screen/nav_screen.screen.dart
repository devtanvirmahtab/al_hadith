import 'package:al_hadith/core/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/asset_constant.dart';
import 'controllers/nav_screen.controller.dart';

class NavScreenScreen extends GetView<NavScreenController> {
  const NavScreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: Obx(() {
        return controller.pageList[controller.selectedIndex.value];
      }),
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0.1,
              blurRadius: 1,
            )
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        child: Obx(() {
          return Row(
            children: [
              Expanded(
                child: NavIcon(
                  icon: homeIcon,
                  isActive: controller.selectedIndex.value == 0,
                  onTap: () => controller.selectedIndex.value = 0,
                ),
              ),
              Expanded(
                child: NavIcon(
                  icon: bookIcon,
                  isActive: controller.selectedIndex.value == 1,
                  onTap: () => controller.selectedIndex.value = 1,
                ),
              ),
              Expanded(
                child: NavIcon(
                  icon: taskIcon,
                  isActive: controller.selectedIndex.value == 2,
                  onTap: () => controller.selectedIndex.value = 2,
                ),
              ),
              Expanded(
                child: NavIcon(
                  icon: remarkIcon,
                  isActive: controller.selectedIndex.value == 3,
                  onTap: () => controller.selectedIndex.value = 3,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class NavIcon extends StatelessWidget {
  const NavIcon({
    super.key,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  final String icon;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        icon,
        width: 30,
        height: 30,
        color: isActive ? primaryColor : const Color(0xff101010),
      ),
    );
  }
}

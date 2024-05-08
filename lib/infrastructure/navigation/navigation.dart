import 'package:al_hadith/presentation/hadith_details/hadith_details.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/chapter.controller.binding.dart';
import 'bindings/controllers/hadith_details.controller.binding.dart';
import 'bindings/controllers/home.controller.binding.dart';
import 'bindings/controllers/nav_screen.controller.binding.dart';
import 'bindings/controllers/remark.controller.binding.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;

  const EnvironmentsBadge({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.NAV_SCREEN,
      page: () => const NavScreenScreen(),
      binding: NavScreenControllerBinding(),
    ),
    GetPage(
      name: Routes.CHAPTER,
      page: () => const ChapterScreen(),
      binding: ChapterControllerBinding(),
    ),
    GetPage(
      name: Routes.REMARK,
      page: () => const RemarkScreen(),
      binding: RemarkControllerBinding(),
    ),
    GetPage(
      name: Routes.HADITH_DETAILS,
      page: () => const HadithDetailsScreen(),
      binding: HadithDetailsControllerBinding(),
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wk/presentation/pages/main_page/main_page.binding.dart';
import 'package:wk/presentation/pages/main_page/main_page.view.dart';

class AppRoutes {
  static const MAIN_PAGE = '/main_page';
  static const NOT_FOUND_PAGE = '/notfound';

  static List<GetPage<Widget>> pages = [
    GetPage(name: AppRoutes.MAIN_PAGE, page: () => MainPageView(), binding: MainPageBinding()),
  ];
}

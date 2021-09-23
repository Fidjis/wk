import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation/app_binding.dart';
import 'presentation/pages/unknown_page/unknown_page.view.dart';
import 'presentation/router/route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WK',
      unknownRoute: GetPage(name: AppRoutes.NOT_FOUND_PAGE, page: () => UnknownPageView()),
      initialRoute: AppRoutes.MAIN_PAGE,
      getPages: AppRoutes.pages,
      initialBinding: AppBinding(),
    );
  }
}

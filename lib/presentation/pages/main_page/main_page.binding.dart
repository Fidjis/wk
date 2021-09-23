import 'package:get/get.dart';
import 'package:wk/core/usecases/create_person.usecase.dart';
import 'package:wk/core/usecases/delete_person.usecase.dart';
import 'package:wk/core/usecases/list_all_persons.usecase.dart';
import 'package:wk/core/usecases/update_person.usecase.dart';
import 'package:wk/utils/snackbar_service.dart';

import 'main_page.controller.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SnackBarService>(() => MaterialSnackBarService());
    Get.lazyPut(() => MainPageController(Get.find(), Get.find(), Get.find(), Get.find(), Get.find()));
    Get.lazyPut(() => DeletePersonUseCase(Get.find()));
    Get.lazyPut(() => ListAllPersonUseCase(Get.find()));
    Get.lazyPut(() => CreatePersonUseCase(Get.find()));
    Get.lazyPut(() => UpdatePersonUseCase(Get.find()));
  }
}

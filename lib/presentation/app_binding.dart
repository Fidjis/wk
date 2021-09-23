import 'package:get/get.dart';
import 'package:wk/core/interfaces/i_person.repository.dart';
import 'package:wk/infraestructure/repositories/person_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IPersonRepository>(() => PersonRepository());
  }
}

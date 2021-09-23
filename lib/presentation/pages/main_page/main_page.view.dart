import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wk/core/models/person.model.dart';
import 'package:wk/presentation/pages/widgets/add_person_form.widget.dart';
import 'package:wk/presentation/pages/widgets/list_with_toolbar/list_with_toolbar.widget.dart';
import 'package:wk/presentation/pages/widgets/person_tile.widget.dart';

import 'main_page.controller.dart';

class MainPageView extends GetView<MainPageController> {
  @override
  Widget build(BuildContext context) {
    final list = Obx(
      () => ListWithToolbarWidget<Person>(
        itemBuilder: (person) => PersonTile(
          delete: (id) => controller.deletePerson(id),
          edt: (person) => _showBottomSheet(context, person),
          onTap: () {},
          person: person,
        ),
        itemsList: controller.persons.value,
        searchFunction: (search, person) => person.name!.toLowerCase().contains(search.toLowerCase()),
      ),
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("WK Teste"),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text('Novo Cadastro'),
          onPressed: () => _showBottomSheet(context, null),
        ),
        key: controller.key,
        body: list,
      ),
    );
  }

  void _showBottomSheet(BuildContext context, Person? person) {
    controller.setUp(person);
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isDismissible: true,
      context: context,
      isScrollControlled: true,
      builder: (_) => AddPersonForm(),
    );
  }
}

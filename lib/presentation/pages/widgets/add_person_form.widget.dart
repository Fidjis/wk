import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wk/presentation/pages/main_page/main_page.controller.dart';

class AddPersonForm extends GetView<MainPageController> {
  Widget addRadioButton(int btnValue, String title, BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Radio<String>(
            activeColor: Theme.of(context).primaryColor,
            value: controller.gender[btnValue],
            groupValue: controller.genderSelected.value,
            onChanged: (value) {
              controller.genderSelected.value = value!;
            },
          ),
          Text(title)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.8,
      builder: (BuildContext ctx, myscrollController) {
        final radioButton = Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            addRadioButton(0, controller.gender[0], ctx),
            addRadioButton(1, controller.gender[1], ctx),
          ],
        );
        final nameFormField = TextFormField(
          decoration: InputDecoration(labelText: 'Nome'),
          controller: controller.nameEdt,
        );
        final addressFormField = TextFormField(
          decoration: InputDecoration(labelText: 'Endereço completo'),
          controller: controller.addressEdt,
        );
        final cadButton = ElevatedButton(
          onPressed: () => controller.save(ctx),
          child: Text('Salvar'),
        );
        final dateArea = Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Dat. Nascimento:  '),
            GestureDetector(
              onTap: () => controller.selectDate(context),
              child: Obx(() => Text(controller.selectedDate.value == null
                  ? 'Click para selecionar'
                  : DateFormat('dd-MM-yyyy').format(controller.selectedDate.value!))),
            ),
          ],
        );
        final camButton = FloatingActionButton(
          onPressed: () => controller.takePicture(),
          child: Icon(Icons.camera),
        );
        final cameraArea = Obx(
          () => controller.photo.value == null
              ? camButton
              : GestureDetector(
                  onTap: () => controller.takePicture(),
                  child: Card(
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Image.file(File(controller.photo.value!.path)),
                    ),
                  ),
                ),
        );

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0),
            ),
          ),
          child: Obx(
            () => controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        Icon(Icons.horizontal_rule),
                        Text(controller.isEdtMode ? 'EDIÇÃO' : 'CADASTRO'),
                        nameFormField,
                        addressFormField,
                        SizedBox(height: 20),
                        dateArea,
                        SizedBox(height: 20),
                        Text('Sexo:'),
                        radioButton,
                        SizedBox(height: 20),
                        Text('Foto:'),
                        SizedBox(height: 20),
                        cameraArea,
                        SizedBox(height: 20),
                        cadButton,
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}

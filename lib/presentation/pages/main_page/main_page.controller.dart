import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wk/core/models/person.model.dart';
import 'package:wk/core/usecases/create_person.usecase.dart';
import 'package:wk/core/usecases/delete_person.usecase.dart';
import 'package:wk/core/usecases/list_all_persons.usecase.dart';
import 'package:wk/core/usecases/update_person.usecase.dart';
import 'package:wk/utils/snackbar_service.dart';

class MainPageController extends GetxController {
  final isLoading = Rx(false);
  final persons = Rx(<Person>[]);
  final key = GlobalKey();

  final nameEdt = TextEditingController();
  final addressEdt = TextEditingController();
  final birthDateEdt = TextEditingController();
  List gender = ["Masculino", "Feminino"];
  final genderSelected = Rx("Masculino");
  final selectedDate = Rxn<DateTime>();
  final photo = Rxn<XFile>();
  var isEdtMode = false;
  late PersonId id;

  final CreatePersonUseCase _createPersonUseCase;
  final SnackBarService _snackBarService;
  final ListAllPersonUseCase _listAllPersonUseCase;
  final DeletePersonUseCase _deletePersonUseCase;
  final UpdatePersonUseCase _updatePersonUseCase;

  MainPageController(
    this._createPersonUseCase,
    this._snackBarService,
    this._listAllPersonUseCase,
    this._deletePersonUseCase,
    this._updatePersonUseCase,
  );

  @override
  void onInit() {
    super.onInit();
    getPersons();
  }

  void setUp(Person? person) {
    isEdtMode = person != null;
    if (isEdtMode) {
      id = person!.id!;
      addressEdt.text = person.address ?? '';
      nameEdt.text = person.name ?? '';
      selectedDate.value = person.birthDate;
      photo.value = person.picture != null ? XFile(person.picture!) : null;
    }
  }

  void save(BuildContext context) {
    if (isEdtMode) {
      updatePerson(context);
    } else {
      createPerson(context);
    }
  }

  Future takePicture() async {
    XFile? imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (imageFile == null) return;
    File tmpFile = File(imageFile.path);
    final appDir = await getApplicationDocumentsDirectory();
    final localFile = await tmpFile.copy('${appDir.path}/${DateTime.now().toString}.png');
    photo.value = XFile(localFile.path);
  }

  Future createPerson(BuildContext context) async {
    if (validateForm()) {
      final input = CreatePersonUseCaseInput(
        address: addressEdt.text,
        birthDate: selectedDate.value,
        name: nameEdt.text,
        sex: genderSelected.value,
        picture: photo.value!.path,
      );

      await _createPersonUseCase.call(input).then(
            (value) => value.fold(
              (failure) => _snackBarService.showMessage(key.currentContext, failure.error),
              (person) {
                resetForm();
                Navigator.pop(context);
                _snackBarService.showMessage(key.currentContext, '${person.name} adicionado!');
                getPersons();
              },
            ),
          );
    } else {
      showAlertDialog(context, 'Preencha todos os campos!');
    }
  }

  Future updatePerson(BuildContext context) async {
    if (validateForm()) {
      final input = UpdatePersonUseCaseInput(
        address: addressEdt.text,
        birthDate: selectedDate.value,
        name: nameEdt.text,
        sex: genderSelected.value,
        picture: photo.value!.path,
        id: id,
      );

      await _updatePersonUseCase.call(input).then(
            (value) => value.fold(
              (failure) => _snackBarService.showMessage(key.currentContext, failure.error),
              (person) {
                resetForm();
                isEdtMode = false;
                Navigator.pop(context);
                _snackBarService.showMessage(key.currentContext, 'Atualizado!');
                getPersons();
              },
            ),
          );
    } else {
      showAlertDialog(context, 'Preencha todos os campos!');
    }
  }

  void showAlertDialog(BuildContext context, String message) {
    Widget okButton = TextButton(
      child: Text("Ok"),
      onPressed: () => Navigator.pop(context),
    );

    AlertDialog alert = AlertDialog(
      title: Text("Atenção!"),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  bool validateForm() {
    return addressEdt.text.isNotEmpty && nameEdt.text.isNotEmpty && selectedDate.value != null && photo.value != null;
  }

  void resetForm() {
    addressEdt.text = '';
    nameEdt.text = '';
    selectedDate.value = null;
    photo.value = null;
  }

  Future deletePerson(PersonId id) async {
    isLoading.value = true;

    await _deletePersonUseCase.call(id).then(
          (value) => value.fold(
            (failure) => _snackBarService.showMessage(key.currentContext, failure.error),
            (nothig) {
              getPersons();
              _snackBarService.showMessage(key.currentContext, 'Deletado com Sucesso!');
            },
          ),
        );

    isLoading.value = false;
  }

  Future getPersons() async {
    isLoading.value = true;

    await _listAllPersonUseCase.call().then(
          (value) => value.fold(
            (failure) => _snackBarService.showMessage(key.currentContext, failure.error),
            (list) => persons.value = list,
          ),
        );

    isLoading.value = false;
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }
}

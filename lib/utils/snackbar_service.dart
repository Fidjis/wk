import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class SnackBarService {
  void showMessage(BuildContext? context, String text);
}

class MaterialSnackBarService extends SnackBarService {

  @override
  void showMessage(BuildContext? context, String text) {
    ScaffoldMessenger.of(context!).showSnackBar(SnackBar(content: Text(text)));
  }
}

import 'package:flutter/material.dart';

class AppColors {
  static const white = Colors.white;
  static const almostWhite = Color(0xFFF7F7F7);

  static const lightGray = Color(0xFFCCCCCC);
  static const gray = Color(0xFF999999);

  static const black = Color(0xFF333333);

  static const blue = Colors.blue;

  static const red = Color(0xFFFF4A4A);
  static const darkRed = Color(0xFFB40000);

  static const cyan = Color(0xFF00C8C8);
  static const darkCyan = Color(0xFF00ADAD);

  static const green = Color(0xFF3DBF49);
  static const darkGreen = Color(0xFF2C8C39);

  static const lightBlue = Color(0xFFE3F4FF);
  static const primary = Color(0xFF36A5FD);
  static const action = Color(0xFF0064C8);

  static const secondary = Color(0xFF295C7F);
  static const secondaryDark = Color(0xFF044F9A);

  static const gradientBegin = Alignment.topCenter;
  static const gradientnEnd = Alignment.bottomCenter;

  static const redGradient = LinearGradient(
    begin: gradientBegin,
    end: gradientnEnd,
    colors: <Color>[red, darkRed],
  );

  static const greenGradient = LinearGradient(
    begin: gradientBegin,
    end: gradientnEnd,
    colors: <Color>[green, darkGreen],
  );

  static const whiteGradient = LinearGradient(
    begin: gradientBegin,
    end: gradientnEnd,
    colors: <Color>[white, lightGray],
  );

  static const blueGradient = LinearGradient(
    begin: gradientBegin,
    end: gradientnEnd,
    colors: <Color>[primary, secondary],
  );

  static const lightBlueGradient = LinearGradient(
    begin: gradientBegin,
    end: gradientnEnd,
    colors: <Color>[lightBlue, white],
  );

  static const blueGreenGradient = LinearGradient(
    begin: gradientBegin,
    end: gradientnEnd,
    colors: <Color>[cyan, darkCyan],
  );
}

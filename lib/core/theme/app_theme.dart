import 'package:flutter/material.dart';

import 'app_color.dart';

abstract class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColor.primaryColor,
    fontFamily: 'Urbanist'
  );
}

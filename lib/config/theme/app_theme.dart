import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/colors_manager.dart';
import 'app_styles.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: ColorsManager.white),
        color: ColorsManager.green,
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50.r))),
        titleTextStyle: AppStyles.appBar,
      ),
      scaffoldBackgroundColor: Colors.transparent);
}

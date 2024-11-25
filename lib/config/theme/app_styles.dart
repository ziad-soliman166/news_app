import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/colors_manager.dart';

class AppStyles {
  static TextStyle appBar = GoogleFonts.exo(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.white,
  );
  static TextStyle drawerTitle = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.white,
  );
  static TextStyle categories = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.blackAcc,
  );
  static TextStyle pickCategory = GoogleFonts.poppins(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManager.grey,
  );
  static TextStyle categoryTitle = GoogleFonts.exo(
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.white,
  );
  static TextStyle sourceName = GoogleFonts.poppins(
      color: const Color(0xFF79828B),
      fontWeight: FontWeight.w400,
      fontSize: 10);
  static TextStyle articleTitle = GoogleFonts.poppins(
      color: const Color(0xFF42505C),
      fontWeight: FontWeight.w500,
      fontSize: 14.sp);
  static TextStyle publishAtTitle = GoogleFonts.inter(
      color: const Color(0xFFA3A3A3),
      fontWeight: FontWeight.w400,
      fontSize: 13);
  static TextStyle articleBody = GoogleFonts.poppins(
      color: const Color(0xFF42505C),
      fontWeight: FontWeight.w300,
      fontSize: 13);
}

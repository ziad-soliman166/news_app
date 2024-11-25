import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../../data/api/model/sources_response/source.dart'
    as sources_response;
import '../../../../../../../core/colors_manager.dart';

class SourceItemWidget extends StatelessWidget {
  final sources_response.Source source;
  final bool isSelected;

  const SourceItemWidget({
    super.key,
    required this.source,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(vertical: 8, horizontal: 12),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(width: 2, color: ColorsManager.green),
          color: isSelected ? ColorsManager.green : Colors.transparent),
      child: Text(
        source.name ?? '',
        style: GoogleFonts.exo(
            color: isSelected ? ColorsManager.white : ColorsManager.green,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}

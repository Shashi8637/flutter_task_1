import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LearningOptionTabs extends StatelessWidget {
  String svgAsset;
  String courseName;
  LearningOptionTabs(
      {Key? key, required this.svgAsset, required this.courseName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 160.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFF598BED), width: 1)),
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(svgAsset),
            SizedBox(
              width: 16.w,
            ),
            Text(
              courseName,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: const Color(0xFF598BED),
              ),
            )
          ],
        ),
      ),
    );
  }
}

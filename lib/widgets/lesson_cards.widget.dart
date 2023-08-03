import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'learning_cards.widget.dart';

class LessonCards extends LearningCards {
  String footerText;
  LessonCards(
      {Key? key,
      required super.image,
      required super.title,
      required this.footerText,
      required super.subTitle,
      required super.children});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LearningCards(
          image: image,
          title: title,
          subTitle: subTitle,
          children: [
            Text(
              footerText,
              style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF6D747A)),
            ),
          ],
        ),
        Positioned(
            top: 248.h,
            left: 210.w,
            right: 12.w,
            child: SvgPicture.asset('assets_svg/lock_icon.svg'))
      ],
    );
  }
}

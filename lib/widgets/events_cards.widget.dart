import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'learning_cards.widget.dart';

class EventsCards extends LearningCards {
  String footerText;
  EventsCards(
      {Key? key,
      required super.image,
      required super.title,
      required this.footerText,
      required super.subTitle,
      required super.children});

  @override
  Widget build(BuildContext context) {
    return LearningCards(
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
        Container(
          height: 26.h,
          width: 62.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: const Color(0xFF598BED))),
          child: Center(
            child: Text(
              'Book',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                  color: const Color(0xFF598BED)),
            ),
          ),
        )
      ],
    );
  }
}

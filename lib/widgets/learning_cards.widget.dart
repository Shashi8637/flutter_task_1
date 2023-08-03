import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LearningCards extends StatelessWidget {
  Widget image;
  String title;
  String subTitle;
  List<Widget> children;
  LearningCards(
      {Key? key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFEBEDF0), width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        height: 280.h,
        width: 242.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 140.h,
              width: 242.w,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                child: image,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF598BED)),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    subTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    height: 15.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: children,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

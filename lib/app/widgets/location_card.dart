import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m360_ict/app/routes/app_pages.dart';
import 'package:m360_ict/app/widgets/carbon_status.dart';
import 'package:m360_ict/app/widgets/reusable_text.dart';

import '../../core/extensions/hex_color.dart';
import 'carbon_count.dart';

class LocationCard extends StatelessWidget {
  final String title;
  final String count;
  final String percentage;
  final String statusLabel;
  final List<String> peopleImages;
  final String extraPeople;

  const LocationCard({
    super.key,
    required this.title,
    required this.count,
    required this.percentage,
    required this.statusLabel,
    required this.peopleImages,
    required this.extraPeople,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.DETAILS),
      child: Container(
        height: 135.h,
        width: 350.w,
        margin: EdgeInsets.symmetric(horizontal: 26.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          gradient: LinearGradient(
            colors: [const Color(0xffF8FFFB), Colors.white],
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 10,
              spreadRadius: -2,
              color: Colors.black.withValues(alpha: 0.05),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 13.17.h,
              left: 18.31.w,
              child: ReusableText(
                title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 16.sp,
                ),
              ),
            ),
            Positioned(
              top: 59.78.h,
              bottom: 0.24.h,
              left: 18.31.w,
              child: CarbonCount(count: count, percentage: percentage),
            ),
            Positioned(
              left: 260.42.w,
              top: 19.85.h,
              child: CarbonStatus(statusLabel: statusLabel),
            ),
            ..._buildPeopleList(),
            Positioned(
              top: 103.h,
              right: 20.w,
              child: SizedBox(
                width: 86.w,
                height: 18.h,
                child: Row(
                  children: [
                    SizedBox(
                      width: 74.w,
                      child: ReusableText(
                        'View Details',
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff47BA80),
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/images/icons/polygon2.svg',
                      width: 10.w,
                      height: 11.h,
                      fit: BoxFit.scaleDown,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPeopleList() {
    List<Widget> widgets = [];
    double leftStart = peopleImages.length <= 4 ? 237.w : 204.w;
    double topStart = peopleImages.length <= 4 ? 65.h : 67.h;

    for (int i = 0; i < peopleImages.length; i++) {
      widgets.add(
        Positioned(
          top: topStart,
          left: (leftStart + (i * 18.w)),
          child: Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3.w),
              image: DecorationImage(
                image: AssetImage(peopleImages[i]),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
    }

    widgets.add(
      Positioned(
        top: topStart,
        left: (leftStart + (peopleImages.length * 18.w)),
        child: Container(
          width: 36.w,
          height: 36.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3.w),
            color: HexColor.fromHex('d9d9d9'),
          ),
          alignment: Alignment.center,
          child: ReusableText(
            extraPeople,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

    return widgets;
  }
}

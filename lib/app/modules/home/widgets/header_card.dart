import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/reusable_text.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 206.h,
      width: 402.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.r),
          bottomRight: Radius.circular(50.r),
        ),
        color: const Color(0xffe8f5ee),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 71.h,
            left: 24.w,
            child: SizedBox(
              width: 137.21429443359375.w,
              height: 29.14285659790039.h,
              child: ReusableText(
                'Good Morning',
                style: GoogleFonts.poppins(
                  color: const Color(0xff838383),
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          Positioned(
            top: 90.71.h,
            left: 24.w,
            child: SizedBox(
              width: 210.07142639160156.w,
              height: 43.71428680419922.h,
              child: ReusableText(
                'Ahmed Ariyan',
                style: GoogleFonts.poppins(
                  color: const Color(0xff1E1E1E),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/images/header_card.svg',
              height: 206.h,
              width: 217.w,
              fit: BoxFit.scaleDown,
            ),
          ),
          Positioned(
            top: 48.h,
            left: 279.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/images/profile.png',
                fit: BoxFit.cover,
                height: 97.14.h,
                width: 97.14.w,
              ),
            ),
          ),

          Positioned(
            left: 26.w,
            top: 162.h,
            child: SizedBox(
              height: 21.85714340209961.h,
              width: 244.07142639160156.w,
              child: RichText(
                text: TextSpan(
                  text: 'You are in a ',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp,
                    color: const Color(0xff838383),
                  ),
                  children: [
                    TextSpan(
                      text: 'healthy',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff47BA80),
                      ),
                    ),
                    TextSpan(
                      text: ' environment',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300,
                        // fontSize: 14.sp,
                        color: const Color(0xff838383),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

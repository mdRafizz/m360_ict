import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m360_ict/app/widgets/reusable_text.dart';

class CarbonCount extends StatelessWidget {
  const CarbonCount({
    super.key,
    required this.count,
    required this.percentage,
  });

  final String count;
  // final Color color;
  final String percentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.21731567382812.h,
      width: 140.68603515625.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 91.66666412353516.w,
            child: Center(
              child: ReusableText(
                count,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  fontSize: 48.sp,
                  color: const Color(0xff47BA80),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 49.w,
                height: 24.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: const Color(0xff47BA80),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      'assets/images/icons/polygon.svg',
                      width: 10.w,
                      height: 5.h,
                      fit: BoxFit.scaleDown,
                    ),
                    ReusableText(
                      percentage,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              ReusableText(
                'ppm',
                style: GoogleFonts.poppins(
                  color: const Color(0xff47BA80),
                  fontWeight: FontWeight.w300,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

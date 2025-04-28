import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m360_ict/app/widgets/reusable_text.dart';

class AppInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  const AppInputField({super.key, required this.label, required this.hintText, this.suffixIcon, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49.h,
      child: Column(
        spacing: 0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 18.h,
            child: ReusableText(
              label,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
            ),
          ),
          SizedBox(
            height: 31.h,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 14.h),
                hintStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xffD6D6D6),
                ),
                hintText: hintText,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

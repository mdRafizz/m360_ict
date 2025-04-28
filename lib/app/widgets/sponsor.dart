import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Sponsor extends StatelessWidget {
  const Sponsor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.inter(
            color: const Color(0xffADADAD),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          text: 'Powered by ',
          children: [
            TextSpan(
              text: 'M360 ICT',
              style: GoogleFonts.inter(
                color: const Color(0xff47BA80),
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

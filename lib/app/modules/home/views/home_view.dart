import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m360_ict/app/widgets/reusable_text.dart';
import 'package:m360_ict/core/extensions/hex_color.dart';

import '../../../widgets/location_card.dart';
import '../controllers/home_controller.dart';
import '../widgets/header_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [
              Color(0xffFCFFFD),
              Color(0xffFAFFFD),
              Color(0xffF8FFFB),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderCard(),
            Padding(
              padding: EdgeInsets.only(left: 25.w, top: 41.h),
              child: ReusableText(
                'My Places',
                style: GoogleFonts.poppins(
                  color: const Color(0xff1E1E1E),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Gap(14.h),
            LocationCard(
              title: 'Home',
              count: '652',
              percentage: '13%',
              statusLabel: 'Good',
              peopleImages: [
                'assets/images/p1.png',
                'assets/images/p2.png',
                'assets/images/p3.png',
              ],
              extraPeople: '+2',
            ),
            Gap(25.h),
            LocationCard(
              title: 'Office',
              count: '447',
              percentage: '37%',
              statusLabel: 'Healthy',
              peopleImages: [
                'assets/images/p4.png',
                'assets/images/p5.png',
                'assets/images/p6.png',
                'assets/images/p7.png',
                'assets/images/p8.png',
              ],
              extraPeople: '+47',
            ),
          ],
        ),
      ),

      floatingActionButton: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 769.h,
              left: 305.w,
              right: 33.w,
              bottom: 41.h,
            ),
            child: MaterialButton(
              onPressed: () {},
              height: 64.h,
              minWidth: 64.w,
              color: HexColor.fromHex('#47BA80'),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: ReusableText(
                '+',
                style: GoogleFonts.poppins(
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

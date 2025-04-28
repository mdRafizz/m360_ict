import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m360_ict/app/modules/auth/controllers/sign_in_controller.dart';
import 'package:m360_ict/app/routes/app_pages.dart';
import 'package:m360_ict/app/widgets/app_input_field.dart';
import 'package:m360_ict/app/widgets/reusable_text.dart';
import 'package:m360_ict/app/widgets/sponsor.dart';

import '../../../widgets/third_party_auth_option.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 33.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(87.h),
              SizedBox(
                height: 45.h,
                child: ReusableText(
                  'Sign In',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                ),
              ),
              ReusableText(
                'Let’s save environment together',
                size: 14,
                weight: FontWeight.w400,
              ),
              Gap(120.h),
              AppInputField(label: 'Email', hintText: 'user@example.com'),
              Gap(16.h),
              AppInputField(
                label: 'Password',
                hintText: '**********',
                suffixIcon: SvgPicture.asset(
                  'assets/images/icons/eye.svg',
                  width: 18.w,
                  height: 6.5.h,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Gap(19.h),
              SizedBox(
                height: 17.h,
                child: Row(
                  children: [
                    SizedBox(
                      width: 116.w,
                      child: Row(
                        spacing: 5.w,
                        children: [
                          Transform.scale(
                            scale: 15.sp / 24,
                            child: SizedBox(
                              height: 15.h,
                              width: 15.w,
                              child: Checkbox(value: false, onChanged: (_) {}),
                            ),
                          ),
                          ReusableText(
                            'Remember me',
                            size: 14,
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 17.h,
                      child: Center(
                        child: ReusableText(
                          'Forgotten Password',
                          size: 14,
                          weight: FontWeight.w700,
                          color: const Color(0xff47BA80),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Gap(52.h),
              MaterialButton(
                onPressed: () {
                  Get.toNamed(Routes.HOME);
                },
                height: 42.h,
                elevation: 0,
                color: const Color(0xff47BA80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Center(
                  child: ReusableText(
                    'Sign In',
                    color: Colors.white,
                    weight: FontWeight.w700,
                    size: 16,
                  ),
                ),
              ),
              Gap(42.h),
              Center(
                child: ReusableText(
                  'Or Sign In with',
                  weight: FontWeight.w400,
                  size: 12,
                  color: const Color(0xffADADAD),
                ),
              ),
              Gap(32.h),
              const ThirdPartyAuthOption(),
              Gap(99.h),
              SizedBox(
                height: 17.h,
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Don’t have an account? ',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: const Color(0xffADADAD),
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            color: const Color(0xff47BA80),
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () => Get.toNamed(Routes.SIGN_UP),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Gap(56.h),
              const Sponsor(),
            ],
          ),
        ),
      ),
    );
  }
}

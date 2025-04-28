import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m360_ict/app/modules/auth/controllers/sign_up_controller.dart';
import 'package:m360_ict/app/routes/app_pages.dart';
import 'package:m360_ict/app/widgets/app_input_field.dart';
import 'package:m360_ict/app/widgets/sponsor.dart';

import '../../../widgets/reusable_text.dart';
import '../../../widgets/third_party_auth_option.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

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
                  'Sign Up',
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
              Gap(35.h),
              const AppInputField(label: 'Name', hintText: 'e.g: Ahmed Ariyan'),
              Gap(18.h),
              AppInputField(
                label: 'Phone Number',
                hintText: '17XXXXXXXX',
                prefixIcon: SizedBox(
                  height: 26.h,
                  width: 67.w,
                  child: Obx(() {
                    final country = controller.selectedCountry.value;
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ReusableText(country.flagEmoji,size: 18,),
                        Gap(2.w),
                        ReusableText(
                          '+${country.phoneCode}',
                          color: const Color(0xff9F9F9F),
                          size: 14,
                        ),
                      ],
                    );
                  }),
                ),
              ),
              Gap(18.h),
              const AppInputField(label: 'Email', hintText: 'user@example.com'),
              Gap(18.h),
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
              Gap(18.h),
              AppInputField(
                label: 'Confirm Password',
                hintText: '**********',
                suffixIcon: SvgPicture.asset(
                  'assets/images/icons/eye.svg',
                  width: 18.w,
                  height: 6.5.h,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Gap(47.h),
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
                    'Sign Up',
                    color: Colors.white,
                    weight: FontWeight.w700,
                    size: 16,
                  ),
                ),
              ),
              Gap(42.h),
              Center(
                child: ReusableText(
                  'Or Sign Up with',
                  weight: FontWeight.w400,
                  size: 12,
                  color: const Color(0xffADADAD),
                ),
              ),
              Gap(32.h),
              const ThirdPartyAuthOption(),
              Gap(22.h),
              SizedBox(
                height: 17.h,
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: const Color(0xffADADAD),
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            color: const Color(0xff47BA80),
                          ),
                          recognizer:  TapGestureRecognizer()..onTap = () => Get.toNamed(Routes.SIGN_IN),
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

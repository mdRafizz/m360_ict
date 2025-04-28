import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpController extends GetxController {


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  final Rx<Country> selectedCountry = Country(
    countryCode: 'BD',
    phoneCode: '880',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'Bangladesh',
    example: '01712345678',
    displayName: 'Bangladesh',
    displayNameNoCountryCode: 'Bangladesh',
    e164Key: '',
  ).obs;

  void pickCountry() {
    showCountryPicker(
      context: Get.context!,
      showPhoneCode: true,
      favorite: ['BD'],
      onSelect: (Country country) {
        selectedCountry.value = country;
      },
      countryListTheme: CountryListThemeData(
        flagSize: 23.w,
        backgroundColor: Colors.transparent,
        textStyle: GoogleFonts.inter(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0xff9F9F9F),
        ),
        bottomSheetHeight: 500.h,
        searchTextStyle: GoogleFonts.inter(fontSize: 16.sp),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThirdPartyAuthOption extends StatelessWidget {
  const ThirdPartyAuthOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 42.h,
        width: 222.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/icons/google.png',width: 26.w,height: 26.h,fit: BoxFit.scaleDown,),
            Image.asset('assets/images/icons/facebook.png',width: 26.w,height: 26.h,fit: BoxFit.scaleDown,),
            Image.asset('assets/images/icons/microsoft.png',width: 26.w,height: 26.h,fit: BoxFit.scaleDown,),
            Image.asset('assets/images/icons/apple.png',width: 26.w,height: 26.h,fit: BoxFit.scaleDown,),
          ],
        ),
      ),
    );
  }
}

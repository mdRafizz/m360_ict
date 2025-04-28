import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:m360_ict/app/widgets/reusable_text.dart';

import '../../core/extensions/hex_color.dart';

class CarbonStatus extends StatelessWidget {
  final String statusLabel;
  const CarbonStatus({super.key, required this.statusLabel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 69.79166412353516.w,
      height: 24.027753829956055.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: LinearGradient(
          colors: [
            HexColor.fromHex('#42D58B'),
            HexColor.fromHex('#65D49C'),
            HexColor.fromHex('#47BA80'),
            HexColor.fromHex('#2DF28F'),
          ],
        ),
      ),
      alignment: Alignment.center,
      child: ReusableText(
        statusLabel,
        size: 12,
        color: Colors.white,
        weight: FontWeight.w700,
      ),
    );
  }
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m360_ict/app/widgets/carbon_count.dart';
import 'package:m360_ict/app/widgets/carbon_status.dart';
import 'package:m360_ict/app/widgets/reusable_text.dart';
import 'package:m360_ict/core/extensions/hex_color.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              HexColor.fromHex('#FCFFFD'),
              HexColor.fromHex('#FAFFFD'),
              HexColor.fromHex('#F8FFFB'),
            ],
          ),
        ),
        child: Column(
          children: [
            _buildHeaderSection(),
            _buildLineChartSection(),
            _buildCardsSection(),
            _buildPlantSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    final statusBarColor = [
      HexColor.fromHex('#7184FF'),
      HexColor.fromHex('#FF5557'),
      HexColor.fromHex('#2DF28F'),
      HexColor.fromHex('#EBED4D'),
      HexColor.fromHex('#FA9D5A'),
    ];

    return SizedBox(
      height: 233.h,
      width: double.infinity,
      child: Stack(
        children: [
          _buildBackButton(),
          _buildHomeIcon(),
          _buildHomeText(),
          _buildCarbonStatus(),
          _buildCarbonCount(),
          _buildStatusBar(statusBarColor),
          _buildHistoryText(),
          _buildSeeAllButton(),
        ],
      ),
    );
  }

  Widget _buildBackButton() => Positioned(
    top: 77.h,
    left: 26.w,
    child: SvgPicture.asset('assets/images/icons/arrow_left.svg'),
  );

  Widget _buildHomeIcon() => Positioned(
    top: 71.h,
    left: 52.w,
    child: Image.asset(
      'assets/images/icons/home.png',
      width: 28.w,
      height: 28.h,
    ),
  );

  Widget _buildHomeText() => Positioned(
    top: 71.h,
    left: 94.w,
    child: Center(
      child: ReusableText(
        'Home',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w300,
          fontSize: 24.sp,
        ),
      ),
    ),
  );

  Widget _buildCarbonStatus() => Positioned(
    top: 73.h,
    left: 306.w,
    child: CarbonStatus(statusLabel: 'Good'),
  );

  Widget _buildCarbonCount() => Positioned(
    top: 116.h,
    left: 26.w,
    child: CarbonCount(count: '652', percentage: '13%'),
  );

  Widget _buildStatusBar(List<Color> statusBarColor) => Positioned(
    top: 139.h,
    left: 244.w,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: statusBarColor
              .map((color) => Container(
            width: 24.w,
            height: 7.h,
            color: color,
          ))
              .toList(),
        ),
        Positioned(
          left: 72.w,
          bottom: 11.h,
          child: SvgPicture.asset(
            'assets/images/icons/polygon3.svg',
            width: 15.w,
            height: 10.h,
          ),
        ),
      ],
    ),
  );

  Widget _buildHistoryText() => Positioned(
    top: 214.h,
    left: 25.w,
    child: ReusableText(
      'History',
      size: 16,
      weight: FontWeight.w400,
      color: HexColor.fromHex('#838383'),
    ),
  );

  Widget _buildSeeAllButton() => Positioned(
    top: 216.h,
    left: 319.w,
    child: Row(
      children: [
        ReusableText(
          'See all',
          size: 14,
          weight: FontWeight.w400,
          color: HexColor.fromHex('#ADADAD'),
        ),
        SvgPicture.asset(
          'assets/images/icons/polygon4.svg',
          width: 11.w,
          height: 10.h,
        ),
      ],
    ),
  );

  Widget _buildLineChartSection() {
    return Padding(
      padding: EdgeInsets.fromLTRB(22.w, 20.h, 16.w, 29.h),
      child: SizedBox(
        height: 216.h,
        width: 364.w,
        child: LineChart(
          LineChartData(
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              verticalInterval: 1,
              horizontalInterval: 1,
              getDrawingHorizontalLine: (_) => FlLine(
                color: Colors.grey.shade100,
                strokeWidth: 1,
              ),
              getDrawingVerticalLine: (value) => FlLine(
                gradient: LinearGradient(
                  colors: [
                    HexColor.fromHex('#47BA80'),
                    HexColor.fromHex('#47BA80', alpha: .05),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                strokeWidth: 1,
              ),
            ),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    const months = ['', 'Oct', 'Nov', 'Dec', 'Jan', 'Feb', 'Mar', 'Apr'];
                    const years = ['', '24', '24', '24', '25', '25', '25', '25'];
                    if (value.toInt() >= 0 && value.toInt() < months.length) {
                      return Text('${months[value.toInt()]}\n ${years[value.toInt()]}',
                          style: const TextStyle(fontSize: 10));
                    }
                    return const Text('');
                  },
                ),
              ),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border(
                left: BorderSide(color: Colors.grey.shade200),
                bottom: BorderSide(color: Colors.grey.shade200),
              ),
            ),
            minX: 0,
            maxX: 7,
            minY: 0,
            maxY: 6,
            lineBarsData: [
              LineChartBarData(
                isCurved: true,
                color: HexColor.fromHex('#47BA80'),
                barWidth: 1,
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) =>
                      FlDotCirclePainter(
                        radius: 4,
                        color: HexColor.fromHex('#47BA80'),
                        strokeWidth: 2,
                        strokeColor: Colors.white,
                      ),
                ),
                belowBarData: BarAreaData(show: false),
                spots: const [
                  FlSpot(0, 2),
                  FlSpot(1, 3.5),
                  FlSpot(2, 5),
                  FlSpot(3, 4),
                  FlSpot(4, 4.2),
                  FlSpot(5, 5),
                  FlSpot(6, 3.7),
                  FlSpot(7, 2.5),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardsSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.w).copyWith(bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPersonsCard(),
          _buildRoomsCard(),
        ],
      ),
    );
  }

  Widget _buildPersonsCard() {
    return _simpleCard(
      child: Stack(
        children: [
          Positioned(
            top: 22.h,
            left: 31.w,
            child: ReusableText(
              'Persons',
              size: 24.sp,
              weight: FontWeight.w700,
              color: HexColor.fromHex('#4D4D4D'),
            ),
          ),
          ...List.generate(4, (index) {
            final lefts = [33.w, 52.w, 71.w, 90.w];
            final images = [
              'assets/images/p1.png',
              'assets/images/p2.png',
              'assets/images/p3.png',
              null,
            ];
            return Positioned(
              top: 78.h,
              left: lefts[index],
              child: Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3.w),
                  image: images[index] != null
                      ? DecorationImage(
                    image: AssetImage(images[index]!),
                    fit: BoxFit.cover,
                  )
                      : null,
                  color: images[index] == null ? HexColor.fromHex('d9d9d9') : null,
                ),
                alignment: images[index] == null ? Alignment.center : null,
                child: images[index] == null
                    ? ReusableText(
                  '+2',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                )
                    : null,
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildRoomsCard() {
    return Container(
      height: 150.h,
      width: 161.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(
          colors: [
            HexColor.fromHex('#A1FFD0'),
            HexColor.fromHex('#6ABC93'),
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 22.h,
            left: 40.w,
            child: ReusableText(
              'Rooms',
              size: 24,
              weight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: 51.h,
            left: 65.w,
            child: ReusableText(
              '5',
              size: 46,
              weight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          Positioned(
            left: 14.w,
            top: 117.h,
            child: Container(
              width: 133.w,
              height: 17.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
              ),
              alignment: Alignment.center,
              child: ReusableText(
                '2 of them requires action',
                size: 10,
                weight: FontWeight.w500,
                color: HexColor.fromHex('#47BA80'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlantSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.w),
      child: Container(
        height: 150.h,
        width: 350.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 15.r,
              spreadRadius: -5.r,
              color: Colors.black.withValues(alpha: 0.1),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 19.h,
              left: 26.w,
              child: ReusableText(
                'Plants',
                size: 24,
                weight: FontWeight.w700,
                color: HexColor.fromHex('#47BA80'),
              ),
            ),
            Positioned(
              top: 64.h,
              left: 25.w,
              child: Image.asset(
                'assets/images/leaf.png',
                height: 55.h,
                width: 55.w,
              ),
            ),
            Positioned(
              left: 189.w,
              top: 0,
              bottom: 0,
              child: Container(
                height: 150.h,
                width: 161.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  gradient: LinearGradient(
                    colors: [
                      HexColor.fromHex('#A1FFD0'),
                      HexColor.fromHex('#6ABC93'),
                    ],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft
                  ),
                ),
                padding: EdgeInsets.fromLTRB(33.w, 26.h, 21.w, 27.h),
                child: ReusableText(
                  '46',
                  size: 80,
                  weight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _simpleCard({required Widget child}) {
    return Container(
      height: 150.h,
      width: 161.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 20.r,
            spreadRadius: -5.r,
            color: Colors.black.withValues(alpha: 0.05),
          ),
        ],
      ),
      child: child,
    );
  }
}

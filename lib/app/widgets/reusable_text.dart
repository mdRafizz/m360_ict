import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int? maxLines;
  final double letterSpacing;
  final double height;
  final bool underline;
  final bool italic;
  final bool strikeThrough;
  final TextScaler? textScaleFactor;
  final TextStyle? style;
  final String? fontFamily;

  const ReusableText(
      this.text, {
        super.key,
        this.size = 16,
        this.color = Colors.black,
        this.weight = FontWeight.normal,
        this.textAlign = TextAlign.start,
        this.overflow = TextOverflow.ellipsis,
        this.maxLines,
        this.letterSpacing = 0.3,
        this.height = 1.2,
        this.underline = false,
        this.italic = false,
        this.strikeThrough = false,
        this.textScaleFactor,
        this.style,
        this.fontFamily,
      });

  @override
  Widget build(BuildContext context) {
    final decoration = underline && strikeThrough
        ? TextDecoration.combine([TextDecoration.underline, TextDecoration.lineThrough])
        : underline
        ? TextDecoration.underline
        : strikeThrough
        ? TextDecoration.lineThrough
        : TextDecoration.none;

    final finalStyle = style ??
        TextStyle(
          fontSize: size.sp,
          color: color,
          fontWeight: weight,
          letterSpacing: letterSpacing,
          height: height,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal,
          decoration: decoration,
          fontFamily: fontFamily,
        );

    return Text(
      text,
      style: finalStyle,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      textScaler: textScaleFactor,
    );
  }
}

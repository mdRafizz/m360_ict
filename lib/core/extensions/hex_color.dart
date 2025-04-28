import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String hexString, {double? alpha}) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    try {
      return Color(int.parse(buffer.toString(), radix: 16))
          .withValues(alpha: alpha ?? 1.0);
    } catch (e) {
      debugPrint('Error parsing hex color: $hexString - $e');
      return Colors.transparent;
    }
  }
}
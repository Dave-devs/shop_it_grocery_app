import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final TextStyle? style;
  const ReusableText({super.key, required this.text, this.textAlign, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: style,
    );
  }
}

TextStyle appStyle(double fontSize,FontWeight fontWeight, Color color, double? letterSpacing) {
  return GoogleFonts.montserrat(
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
    color: color,
    letterSpacing: letterSpacing
  );
}
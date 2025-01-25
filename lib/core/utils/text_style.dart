import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle navy24Bold700 = GoogleFonts.roboto(
    color: const Color(0xFF0A2533),
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    height: 1.35,
  );

  static TextStyle gray18Bold800 = GoogleFonts.roboto(
    color: const Color(0xFFE6EBF2),
    fontSize: 18.sp,
    fontWeight: FontWeight.w800,
    height: 1.10,
  );

  static TextStyle white28Bold800 = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 28.sp,
    fontWeight: FontWeight.w800,
    height: 1.10,
  );

  static TextStyle white16Bold700 = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    height: 1.35,
  );

  static TextStyle gray16Bold700 = GoogleFonts.roboto(
    color: const Color(0xFF97A1B0),
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    height: 1.35,
  );

  static TextStyle primary16Bold700 = GoogleFonts.roboto(
    color: AppColors.primary,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    height: 1.35,
  );
  static TextStyle primary14Bold400 = GoogleFonts.roboto(
    color: AppColors.primary,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1.45,
  );
  static TextStyle secondary14Bold800 = GoogleFonts.roboto(
    color: AppColors.secondary,
    fontSize: 14.sp,
    fontWeight: FontWeight.w800,
    height: 1.30,
  );
  static TextStyle primary24Bold800 = GoogleFonts.roboto(
    color: AppColors.primary,
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
    height: 1.35,
  );
  static TextStyle primary20Bold800 = GoogleFonts.roboto(
    color: AppColors.primary,
    fontSize: 20.sp,
    fontWeight: FontWeight.w800,
    height: 1.35,
  );
}

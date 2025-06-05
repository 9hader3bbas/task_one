import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFE4F7F5),
                Color(0xFFFFFFFF),
              ],
            ),
          ),
        ),
        Positioned(
          top: -97,
          left: 202,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 250, sigmaY: 250),
            child: Container(
              width: 231.0.w,
              height: 231.0.h,
              decoration: BoxDecoration(
                color: const Color(0xFF0EB29A).withOpacity(0.7),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Positioned(
          top: 381,
          left: -40,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 350, sigmaY: 350),
            child: Container(
              width: 217.0.w,
              height: 231.0.h,
              decoration: const BoxDecoration(
                color: Color(0xFF0EB29A),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(child: child),
        ),
      ],
    );
  }
}

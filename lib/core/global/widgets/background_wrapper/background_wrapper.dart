import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_one/core/theme/assets/app_assets.dart';

class BackgroundWrapper extends StatelessWidget {
  final Widget child;

  const BackgroundWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            top: -307,
            left: -7,
            right: 0,
            bottom: 0,
            child: Image.asset(
              AppAssets.getStartedImg,
              fit: BoxFit.contain,
            ),
          ),
          child
        ],
      ),
    );
  }
}

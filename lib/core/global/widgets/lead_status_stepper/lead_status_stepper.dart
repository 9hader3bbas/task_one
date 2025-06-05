import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_one/core/theme/assets/app_assets.dart';

class LeadStatusStepper extends StatelessWidget {
  final int currentStep;

  const LeadStatusStepper({super.key, required this.currentStep});

  final List<String> steps = const [
    'New',
    'Contacted',
    'Nurturing',
    'Unqualified',
    'Qualified'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 10.h,
                left: 0,
                right: 0,
                child: Container(
                  height: 1.h,
                  color: Colors.grey.shade300,
                ),
              ),
              Positioned(
                top: 10.h,
                left: 0,
                right: MediaQuery.of(context).size.width *
                    (1 - (currentStep / (steps.length - 1))),
                child: Container(
                  height: 1.h,
                  color: const Color(0xFF4E46B4),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(steps.length, (index) {
                  bool isCompleted = index < currentStep;
                  bool isCurrent = index == currentStep;

                  return Column(
                    children: [
                      Container(
                        width: 24.w,
                        height: 24.w,
                        decoration: BoxDecoration(
                          color: isCompleted
                              ? const Color(0xFF4E46B4)
                              : Colors.white,
                          border: Border.all(
                            color: isCompleted
                                ? const Color(0xFF4E46B4)
                                : const Color(0xFFE2E2E2),
                            width: 1,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: isCompleted
                            ? SvgPicture.asset(
                                AppAssets.checkIcon,
                                fit: BoxFit.scaleDown,
                                width: 14.w,
                                height: 14.w,
                              )
                            : isCurrent
                                ? Center(
                                    child: Container(
                                      width: 6.w,
                                      height: 6.w,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF4E46B4),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  )
                                : null,
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        steps[index],
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: isCurrent
                              ? const Color(0xFF4E46B4)
                              : Colors.black.withOpacity(0.7),
                        ),
                      )
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Stack(
          children: [
            Container(
              height: 4,
              width: double.infinity,
              color: const Color(0xFF4E46B4).withOpacity(0.2),
            ),
            FractionallySizedBox(
              widthFactor: currentStep / (steps.length - 1),
              child: Container(
                height: 4,
                color: const Color(0xFF4E46B4),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_one/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:task_one/core/global/widgets/lead_status_stepper/lead_status_stepper.dart';
import 'package:task_one/core/global/widgets/timeline_view/timeline_view.dart';
import 'package:task_one/core/theme/assets/app_assets.dart';
import 'package:task_one/core/theme/colors/app_colors.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.find<DashboardController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
            onPressed: () {}, icon: SvgPicture.asset(AppAssets.menuIcon)),
        title: Text(
          "AllPro",
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              fontSize: 14.0.sp,
              color: const Color(0xFF19173B)),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppAssets.notificationIcon)),
          Container(
            height: 32.0.h,
            width: 32.0.w,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color(0xFFDCDAF0)),
            alignment: Alignment.center,
            child: Text(
              "MA",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w700,
                  fontSize: 12.0.sp,
                  color: const Color(0xFF19173B)),
            ),
          ),
          SizedBox(
            height: 32.0.h,
            width: 18.0.w,
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0.h),
          child: Container(
            color: const Color(0xFFDCDAF0),
            height: 1.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 8.0.h),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.backArrowIcon,
                    height: 20.0.h,
                    width: 20.0.w,
                  ),
                  Text(
                    "Leads details",
                    style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0.sp,
                        color: const Color(0xFF19173B)),
                  )
                ],
              ),
              SizedBox(
                height: 16.0.h,
              ),
              Container(
                height: 40.0.h,
                width: 352.0.w,
                padding:
                    EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 4.0.h),
                decoration: BoxDecoration(
                    color: const Color(0xF5F5F5FF),
                    borderRadius: BorderRadius.circular(8.0.r)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Leads Detail",
                          style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0.sp,
                              color: const Color(0xFF19173B)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4.0.w,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0.r)),
                        alignment: Alignment.center,
                        child: Text(
                          "Leads Timeline",
                          style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0.sp,
                              color: const Color(0xFF19173B)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 17.5.h),
              const LeadStatusStepper(currentStep: 2),
              SizedBox(
                height: 16.0.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 40.0.h,
                  width: 118.0.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color(0xFF4E46B4),
                      borderRadius: BorderRadius.circular(8.0.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add New",
                        style: TextStyle(
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w700,
                            fontSize: 14.0.sp,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 8.0.w,
                      ),
                      SvgPicture.asset(AppAssets.downArrowIcon)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.0.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(8.0.r)),
                padding:
                    EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 4.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 32.0.h,
                        width: 83.0.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0.r)),
                        alignment: Alignment.center,
                        child: Text(
                          "All",
                          style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0.sp,
                              color: const Color(0xFF19173B)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 32.0.h,
                        width: 83.0.w,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 14.0.h,
                              width: 14.0.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF40A69F)),
                            ),
                            SizedBox(
                              width: 8.0.w,
                            ),
                            Text(
                              "Tasks",
                              style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0.sp,
                                  color: const Color(0xFF19173B)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 32.0.h,
                        width: 83.0.w,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 14.0.h,
                              width: 14.0.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFFFFB319)),
                            ),
                            SizedBox(
                              width: 8.0.w,
                            ),
                            Text(
                              "Logs",
                              style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0.sp,
                                  color: const Color(0xFF19173B)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 32.0.h,
                        width: 83.0.w,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 14.0.h,
                              width: 14.0.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF3448F0)),
                            ),
                            SizedBox(
                              width: 8.0.w,
                            ),
                            Text(
                              "Events",
                              style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0.sp,
                                  color: const Color(0xFF19173B)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0.h,
              ),
              Obx(
                () => Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0.r),
                      bottomLeft: Radius.circular(8.0.r),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(color: Color(0xFFDCDAF0), width: 1),
                          bottom:
                              BorderSide(color: Color(0xFFDCDAF0), width: 1),
                          left: BorderSide(color: Color(0xFFDCDAF0), width: 1),
                        ),
                      ),
                      child: controller.isLoading.value
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                              ),
                            )
                          : controller.timelineDisplayItems.isEmpty
                              ? const Center(
                                  child: Text("No timeline activity yet."),
                                )
                              : TimelineViewWidget(
                                  items: controller.timelineDisplayItems,
                                  onToggleTaskStatus: (itemId, currentStatus) {
                                    controller.toggleTaskStatus(
                                        itemId, currentStatus);
                                  },
                                ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:task_one/app/modules/dashboard/controllers/dashboard_controller.dart';

class TimelineViewWidget extends StatelessWidget {
  final List<TimelineDisplayItem> items;
  final Function(String itemId, bool currentStatus) onToggleTaskStatus;

  const TimelineViewWidget(
      {super.key, required this.items, required this.onToggleTaskStatus});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(child: Text("No items to display."));
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final currentItem = items[index];
        final showDateHeader = _shouldShowDateHeader(index, items);

        bool isLastItem = index == items.length - 1;
        bool isNextItemSameDate =
            !isLastItem && !_shouldShowDateHeader(index + 1, items);

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 60.w,
                child: showDateHeader
                    ? Padding(
                        padding: EdgeInsets.only(
                            top: (index == 0 ? 0 : 12.h), right: 8.w),
                        child: Text(
                          DateFormat('MMM d').format(currentItem.date),
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: Colors.grey[600]),
                        ),
                      )
                    : null,
              ),
              SizedBox(
                width: 20.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 2.w,
                      height: 12.h,
                      color: (showDateHeader && index != 0)
                          ? Colors.transparent
                          : Color(0xFFDCDAF0),
                    ),
                    Container(
                      width: 10.w,
                      height: 10.w,
                      decoration: BoxDecoration(
                          color: currentItem.type == TimelineItemType.task
                              ? Color(0xFF40A69F)
                              : Color(0xFFFFB319),
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Colors.white, width: 1.5.w)),
                    ),
                    Expanded(
                      child: Container(
                        width: 2.w,
                        color:
                            isLastItem ? Colors.transparent : Color(0xFFDCDAF0),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 16.h, top: 8.h, right: 8.w),
                  child: _TimelineListItemContentWidget(
                    item: currentItem,
                    onToggleTaskStatus: onToggleTaskStatus,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  bool _shouldShowDateHeader(
      int currentIndex, List<TimelineDisplayItem> allItems) {
    if (currentIndex == 0) return true;
    final currentItemDate = allItems[currentIndex].date;
    final previousItemDate = allItems[currentIndex - 1].date;
    return currentItemDate.year != previousItemDate.year ||
        currentItemDate.month != previousItemDate.month ||
        currentItemDate.day != previousItemDate.day;
  }
}

class _TimelineListItemContentWidget extends StatelessWidget {
  final TimelineDisplayItem item;
  final Function(String itemId, bool currentStatus) onToggleTaskStatus;

  const _TimelineListItemContentWidget(
      {required this.item, required this.onToggleTaskStatus});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(item.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
        if (item.description.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Text(item.description,
                style: TextStyle(color: Colors.grey[700], fontSize: 12.sp)),
          ),
        if (item.type == TimelineItemType.task)
          Padding(
            padding: EdgeInsets.only(top: 0.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: Checkbox(
                    visualDensity: VisualDensity.compact,
                    value: item.isTaskDone ?? false,
                    onChanged: (bool? newValue) {
                      onToggleTaskStatus(item.id, item.isTaskDone ?? false);
                    },
                    activeColor: Color(0xFF4E46B4),
                  ),
                ),
                Text(
                  (item.isTaskDone ?? false)
                      ? "Mark as undone"
                      : "Mark as done",
                  style: TextStyle(fontSize: 12.sp, color: Color(0xFF4E46B4)),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

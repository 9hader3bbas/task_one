enum TimelineItemType { task, log }

class TimelineDisplayItem {
  final String id;
  final DateTime date;
  final String title;
  final String description;
  final TimelineItemType type;
  bool? isTaskDone;
  final dynamic originalData;

  TimelineDisplayItem({
    required this.id,
    required this.date,
    required this.title,
    required this.description,
    required this.type,
    this.isTaskDone,
    this.originalData,
  });

  static DateTime? _parseDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return null;
    }
    return DateTime.tryParse(dateString);
  }
}

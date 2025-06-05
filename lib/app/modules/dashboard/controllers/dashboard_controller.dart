import 'package:get/get.dart';
import 'package:task_one/app/data/services/lead_services/lead_services.dart'; // Your LeadService
import 'package:task_one/app/modules/dashboard/models/client_model/client_model.dart';
import 'package:task_one/app/modules/dashboard/models/lead_model/lead_model.dart';
import 'package:task_one/app/modules/dashboard/models/client_event_model/client_event_model.dart'; // Assuming path
import 'package:task_one/app/modules/dashboard/models/client_log_model/client_log_model.dart'; // Assuming path

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
    if (dateString == null || dateString.isEmpty) return null;
    return DateTime.tryParse(dateString);
  }
}

TimelineDisplayItem transformClientEventToTimelineItem(ClientEventModel event) {
  String title = event.description ?? "Task Event";
  String description = event.comments ?? "";
  bool isDone = false;
  DateTime? eventDate = TimelineDisplayItem._parseDate(event.startDate);

  return TimelineDisplayItem(
    id: 'event_${event.id}',
    date: eventDate ?? DateTime.now(),
    title: title,
    description: description,
    type: TimelineItemType.task,
    isTaskDone: isDone,
    originalData: event,
  );
}

TimelineDisplayItem transformClientLogToTimelineItem(ClientLogModel log) {
  String title = "Log Entry (Type: ${log.typeId})";
  String description = log.comments ?? "";
  DateTime? logDate = TimelineDisplayItem._parseDate(log.createdAt);

  return TimelineDisplayItem(
    id: 'log_${log.id}',
    date: logDate ?? DateTime.now(),
    title: title,
    description: description,
    type: TimelineItemType.log,
    originalData: log,
  );
}

abstract class DashboardController extends GetxController {
  LeadModel? get lead;
  RxBool get isLoading;
  List<TimelineDisplayItem> get timelineDisplayItems;

  Future<void> fetchLead();
  void toggleTaskStatus(String itemId, bool currentStatus);
}

class DashboardControllerImpl extends DashboardController {
  LeadModel? _lead;
  final RxBool _isLoading = true.obs;

  // To hold raw events and logs
  final RxList<ClientEventModel> _clientEvents = <ClientEventModel>[].obs;
  final RxList<ClientLogModel> _clientLogs = <ClientLogModel>[].obs;

  // Transformed list for the UI
  final RxList<TimelineDisplayItem> _timelineDisplayItems =
      <TimelineDisplayItem>[].obs;

  @override
  LeadModel? get lead => _lead;

  @override
  RxBool get isLoading => _isLoading;

  @override
  List<TimelineDisplayItem> get timelineDisplayItems =>
      _timelineDisplayItems.toList();

  @override
  void onInit() {
    super.onInit();
    fetchLead();
  }

  @override
  Future<void> fetchLead() async {
    _isLoading.value = true;
    _clientEvents.clear();
    _clientLogs.clear();
    _timelineDisplayItems.clear();
    _lead = await LeadService.fetchLeadDetails(89);

    _clientEvents.assignAll([
      ClientEventModel(
          id: 1,
          subjectId: 1,
          description: "Follow-up: Project Alpha",
          startDate: "2025-10-22T10:00:00Z",
          endDate: "2025-10-22T11:00:00Z",
          client: ClientModel(
              id: 1,
              name: "c1",
              whatsppNumber: null,
              phone: null,
              email: null,
              comments: null,
              userId: 1,
              type: 1,
              createdAt: null,
              updatedAt: null),
          comments: "Discuss next steps and milestones.",
          userId: 1,
          isAccount: false,
          users: [],
          createdAt: "",
          updatedAt: ""),
    ]);
    _clientLogs.assignAll([
      ClientLogModel(
          id: 1,
          typeId: 1,
          comments: "Initial call with the client. Positive response.",
          userId: 1,
          createdAt: "2025-11-03T14:30:00Z",
          updatedAt: "2025-11-03T14:30:00Z"),
      ClientLogModel(
          id: 2,
          typeId: 2,
          comments: "Sent them the proposal document.",
          userId: 1,
          createdAt: "2025-11-03T17:00:00Z",
          updatedAt: "2025-11-03T17:00:00Z"),
    ]);

    _processAndSortTimelineData();

    _isLoading.value = false;
  }

  void _processAndSortTimelineData() {
    List<TimelineDisplayItem> processedItems = [];
    for (var event in _clientEvents) {
      processedItems.add(transformClientEventToTimelineItem(event));
    }
    for (var log in _clientLogs) {
      processedItems.add(transformClientLogToTimelineItem(log));
    }

    processedItems.sort((a, b) => a.date.compareTo(b.date));
    _timelineDisplayItems.assignAll(processedItems);
  }

  @override
  void toggleTaskStatus(String itemId, bool currentStatus) {
    final itemIndex = _timelineDisplayItems.indexWhere(
        (item) => item.id == itemId && item.type == TimelineItemType.task);
    if (itemIndex != -1) {
      final item = _timelineDisplayItems[itemIndex];
      item.isTaskDone = !currentStatus;
      _timelineDisplayItems[itemIndex] = item;
      print("Task ${item.id} status updated to ${item.isTaskDone}");
    }
  }
}

class StageModel {
  final int id;
  final String? name;
  final int status;
  final int order;
  final String? color;
  final int userId;
  final bool lastStage;
  final String? createdAt;
  final String? updatedAt;

  StageModel({
    required this.id,
    required this.name,
    required this.status,
    required this.order,
    required this.color,
    required this.userId,
    required this.lastStage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StageModel.fromJson(Map<String, dynamic> json) {
    return StageModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      status: json['status'] ?? 0,
      order: json['order'] ?? 0,
      color: json['color'] ?? '#FFFFFF',
      userId: json['user_id'] ?? 0,
      lastStage: json['last_stage'] ?? false,
      createdAt: json['created_at']?.toString() ?? '',
      updatedAt: json['updated_at']?.toString() ?? '',
    );
  }
}

class ClientLogModel {
  final int id;
  final int typeId;
  final String? comments;
  final int userId;
  final String? createdAt;
  final String? updatedAt;

  ClientLogModel({
    required this.id,
    required this.typeId,
    required this.comments,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ClientLogModel.fromJson(Map<String, dynamic> json) {
    return ClientLogModel(
      id: json['id'] ?? 0,
      typeId: json['type_id'] ?? 0,
      comments: (json['comments'] == null || json['comments'] == 'null')
          ? null
          : json['comments'].toString(),
      userId: json['user_id'] ?? 0,
      createdAt: json['created_at']?.toString() ?? '',
      updatedAt: json['updated_at']?.toString() ?? '',
    );
  }
}

import 'package:task_one/app/modules/dashboard/models/client_model/client_model.dart';
import 'package:task_one/app/modules/login/models/user_model/user_model.dart';

class ClientEventModel {
  final int id;
  final int subjectId;
  final String? description;
  final String? startDate;
  final String? endDate;
  final ClientModel client;
  final String? comments;
  final int userId;
  final bool isAccount;
  final List<UserModel> users;
  final String? createdAt;
  final String? updatedAt;

  ClientEventModel({
    required this.id,
    required this.subjectId,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.client,
    this.comments,
    required this.userId,
    required this.isAccount,
    required this.users,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ClientEventModel.fromJson(Map<String, dynamic> json) {
    return ClientEventModel(
      id: json['id'] ?? 0,
      subjectId: json['subject_id'] ?? 0,
      description: json['description'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      client: ClientModel.fromJson(json['client'] ?? {}),
      comments: (json['comments'] == null || json['comments'] == 'null')
          ? null
          : json['comments'].toString(),
      userId: json['user_id'] ?? 0,
      isAccount: json['isAccount'] ?? false,
      users: (json['users'] as List<dynamic>? ?? [])
          .map((user) => UserModel.fromJson(user))
          .toList(),
      createdAt: json['created_at']?.toString() ?? '',
      updatedAt: json['updated_at']?.toString() ?? '',
    );
  }
}

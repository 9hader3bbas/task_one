class ClientModel {
  final int id;
  final String? name;
  final String? whatsppNumber;
  final String? phone;
  final String? email;
  final String? comments;
  final int userId;
  final int type;
  final String? createdAt;
  final String? updatedAt;

  ClientModel({
    required this.id,
    required this.name,
    required this.whatsppNumber,
    required this.phone,
    required this.email,
    required this.comments,
    required this.userId,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      whatsppNumber: json['whatspp_number'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      comments: (json['comments'] == null || json['comments'] == 'null')
          ? null
          : json['comments'].toString(),
      userId: json['user_id'] ?? 0,
      type: json['type'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}

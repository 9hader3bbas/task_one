class UserModel {
  final int id;
  final String name;
  final String email;
  final String? password; // Make password nullable if it can be absent
  final int status;
  final int type;
  final String roleId; // Or int roleId, see suggestion below
  final bool isAdmin; // Or provide a default, see suggestion below
  final String createdAt;
  final String updatedAt;
  final List<dynamic> permissions;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.password,
    required this.status,
    required this.type,
    required this.roleId,
    required this.isAdmin,
    required this.createdAt,
    required this.updatedAt,
    required this.permissions,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'],
      status: json['status'] ?? 0,
      type: json['type'] ?? 0,
      roleId: (json['role_id']?.toString()) ?? 'default_role',
      isAdmin: json['isAdmin'] ?? false,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      permissions: List<dynamic>.from(json['permissions'] ?? []),
    );
  }
}

class LocationModel {
  final int id;
  final String? city;
  final String? district;
  final String? description;
  final int userId;
  final String? createdAt;
  final String? updatedAt;

  LocationModel({
    required this.id,
    required this.city,
    required this.district,
    required this.description,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'] ?? 0,
      city: json['city'] ?? '',
      district: json['district'] ?? '',
      description: json['description'] ?? '',
      userId: json['user_id'] ?? 0,
      createdAt: json['created_at']?.toString() ?? '',
      updatedAt: json['updated_at']?.toString() ?? '',
    );
  }
}

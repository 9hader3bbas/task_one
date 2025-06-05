import 'package:task_one/app/modules/dashboard/models/lead_source/lead_source_model.dart';
import 'package:task_one/app/modules/dashboard/models/location_model/location_model.dart';
import 'package:task_one/app/modules/dashboard/models/stage_model/stage_model.dart';
import 'package:task_one/app/modules/dashboard/models/tag_model/tag_model.dart';
import 'package:task_one/app/modules/login/models/user_model/user_model.dart';

class LeadModel {
  final int id;
  final String? name;
  final String? company;
  final LeadSourceModel? leadSource;
  final LocationModel? location;
  final StageModel? stage;
  final String? whatsppNumber;
  final String? phone;
  final String? email;
  final String? industry;
  final String? comments;
  final UserModel? user;
  final int type;
  final List<TagModel> tags;
  final String? createdAt;
  final String? updatedAt;

  LeadModel({
    required this.id,
    required this.name,
    this.company,
    this.leadSource,
    this.location,
    this.stage,
    this.whatsppNumber,
    this.phone,
    this.email,
    this.industry,
    this.comments,
    this.user,
    required this.type,
    required this.tags,
    this.createdAt,
    this.updatedAt,
  });

  factory LeadModel.fromJson(Map<String, dynamic> json) {
    return LeadModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      company: json['company'],
      leadSource: json['lead_source'] != null
          ? LeadSourceModel.fromJson(json['lead_source'])
          : null,
      location: json['location'] != null
          ? LocationModel.fromJson(json['location'])
          : null,
      stage: json['stage'] != null ? StageModel.fromJson(json['stage']) : null,
      whatsppNumber: json['whatspp_number']?.toString(),
      phone: json['phone']?.toString(),
      email: json['email']?.toString(),
      industry: json['industry']?.toString(),
      comments: (json['comments'] == null || json['comments'] == 'null')
          ? null
          : json['comments'].toString(),
      user:
          json['user_id'] != null ? UserModel.fromJson(json['user_id']) : null,
      type: json['type'] ?? 0,
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => TagModel.fromJson(e))
              .toList() ??
          [],
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
    );
  }
}

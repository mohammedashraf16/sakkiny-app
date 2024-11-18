import 'property.dart';

class UserPropertyModel {
  bool? status;
  String? message;
  List<Property>? properties;

  UserPropertyModel({this.status, this.message, this.properties});

  factory UserPropertyModel.fromJson(Map<String, dynamic> json) {
    return UserPropertyModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      properties: (json['properties'] as List<dynamic>?)
          ?.map((e) => Property.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'properties': properties?.map((e) => e.toJson()).toList(),
      };
}

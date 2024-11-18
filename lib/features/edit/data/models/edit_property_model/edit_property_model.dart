import 'property.dart';

class EditPropertyModel {
  String? message;
  Property? property;

  EditPropertyModel({this.message, this.property});

  factory EditPropertyModel.fromJson(Map<String, dynamic> json) {
    return EditPropertyModel(
      message: json['message'] as String?,
      property: json['property'] == null
          ? null
          : Property.fromJson(json['property'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'property': property?.toJson(),
      };
}


import 'package:sakkiny/features/user_property/data/model/user_property_model/essentials.dart';
import 'package:sakkiny/features/user_property/data/model/user_property_model/property_image.dart';

class Property {
  Essentials? essentials;
  String? id;
  String? description;
  String? type;
  int? roomsNumber;
  int? bedrooms;
  int? bathrooms;
  String? addedBy;
  bool? userVerified;
  String? addedByType;
  List<PropertyImage>? propertyImages;
  int? area;
  String? level;
  bool? isFurnished;
  int? price;
  String? per;
  String? numberOfGuests;
  String? propertyStatus;
  String? address;
  num? latitude;
  num? longitude;
  String? customId;
  int? likesCount;
  bool? bannedUser;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Property({
    this.essentials,
    this.id,
    this.description,
    this.type,
    this.roomsNumber,
    this.bedrooms,
    this.bathrooms,
    this.addedBy,
    this.userVerified,
    this.addedByType,
    this.propertyImages,
    this.area,
    this.level,
    this.isFurnished,
    this.price,
    this.per,
    this.numberOfGuests,
    this.propertyStatus,
    this.address,
    this.latitude,
    this.longitude,
    this.customId,
    this.likesCount,
    this.bannedUser,
    this.createdAt,
    this.updatedAt,
    this.v,
  });
factory Property.fromJson(Map<String, dynamic> json) => Property(
      essentials: json['essentials'] == null
          ? null
          : Essentials.fromJson(json['essentials'] as Map<String, dynamic>),
      id: json['_id'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      roomsNumber: json['roomsNumber'] as int?,
      bedrooms: json['bedrooms'] as int?,
      bathrooms: json['bathrooms'] as int?,
      addedBy: json['addedBy'] as String?,
      userVerified: json['userVerified'] as bool?,
      addedByType: json['addedByType'] as String?,
      propertyImages: (json['propertyImages'] as List<dynamic>?)
          ?.map((e) => PropertyImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      area: json['area'] as int?,
      level: json['level'] as String?,
      isFurnished: json['isFurnished'] as bool?,
      price: json['price'] as int?,
      per: json['per'] as String?,
      numberOfGuests: json['numberOfGuests'] as String?,
      propertyStatus: json['propertyStatus'] as String?,
      address: json['address'] as String?,
      // latitude: json['latitude'] as num, // Handle double to int conversion
      // longitude: json['longitude']?.toDouble()?.toInt(), // Handle double to int conversion
       latitude: json['latitude'] as num?,
        longitude: json['longitude'] as num?,
      customId: json['customId'] as String?,
      likesCount: json['likesCount'] as int?,
      bannedUser: json['bannedUser'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
    );
  // factory Property.fromJson(Map<String, dynamic> json) {
  //   return Property(
  //     essentials: json['essentials'] == null
  //         ? null
  //         : Essentials.fromJson(json['essentials'] as Map<String, dynamic>),
  //     id: json['_id'] as String?,
  //     description: json['description'] as String?,
  //     type: json['type'] as String?,
  //     roomsNumber: json['roomsNumber'] as int?,
  //     bedrooms: json['bedrooms'] as int?,
  //     bathrooms: json['bathrooms'] as int?,
  //     addedBy: json['addedBy'] as String?,
  //     userVerified: json['userVerified'] as bool?,
  //     addedByType: json['addedByType'] as String?,
  //     propertyImages: (json['propertyImages'] as List<dynamic>?)
  //         ?.map((e) => PropertyImage.fromJson(e as Map<String, dynamic>))
  //         .toList(),
  //     area: json['area'] as int?,
  //     level: json['level'] as String?,
  //     isFurnished: json['isFurnished'] as bool?,
  //     price: json['price'] as int?,
  //     per: json['per'] as String?,
  //     numberOfGuests: json['numberOfGuests'] as String?,
  //     propertyStatus: json['propertyStatus'] as String?,
  //     address: json['address'] as String?,
  //     latitude: (json['latitude'] as num?)?.toDouble(),
  //     longitude: (json['longitude'] as num?)?.toDouble(),
  //     customId: json['customId'] as String?,
  //     likesCount: json['likesCount'] as int?,
  //     bannedUser: json['bannedUser'] as bool?,
  //     createdAt: json['createdAt'] == null
  //         ? null
  //         : DateTime.parse(json['createdAt'] as String),
  //     updatedAt: json['updatedAt'] == null
  //         ? null
  //         : DateTime.parse(json['updatedAt'] as String),
  //     v: json['__v'] as int?,
  //   );
  // }

  Map<String, dynamic> toJson() => {
        'essentials': essentials?.toJson(),
        '_id': id,
        'description': description,
        'type': type,
        'roomsNumber': roomsNumber,
        'bedrooms': bedrooms,
        'bathrooms': bathrooms,
        'addedBy': addedBy,
        'userVerified': userVerified,
        'addedByType': addedByType,
        'propertyImages': propertyImages?.map((e) => e.toJson()).toList(),
        'area': area,
        'level': level,
        'isFurnished': isFurnished,
        'price': price,
        'per': per,
        'numberOfGuests': numberOfGuests,
        'propertyStatus': propertyStatus,
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
        'customId': customId,
        'likesCount': likesCount,
        'bannedUser': bannedUser,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}

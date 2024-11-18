import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/features/edit/data/models/edit_property_model/edit_property_model.dart';

abstract class EditRepo {
  Future<Either<Failures, EditPropertyModel>> editProperty({
    required String id,
     required String status,
    required bool isFurnished,
    required int price,
    required int bedrooms,
    required String level,
    required int? bathrooms,
    required int area,
    required String details,
    required String address,
    required num lat,
    required num long,
    required List<MultipartFile> propertyImages,
    required String type,
    required String per,
    required String description,
  });
}

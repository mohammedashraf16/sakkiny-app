import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/utils/dio_helper.dart';
import 'package:sakkiny/features/edit/data/models/edit_property_model/edit_property_model.dart';
import 'package:sakkiny/features/edit/data/repos/edit_property_repo.dart';

class EditRepoImpl implements EditRepo {
  @override
  Future<Either<Failures, EditPropertyModel>> editProperty({
      required String id,
    required bool isFurnished,
    required int price,
    required int bedrooms,
    required String level,
    required int? bathrooms,
    required int area,
    required String details,
     required String status,
    required String address,
    required List<MultipartFile> propertyImages,
    required String type,
    required String per,
    required String description,
    required num lat,
    required num long,
  }) async {
    try {
      var data = await DioHelper.putDataWithImage(
        url: '/hosting/update/$id',
        token: token,
        data: {
          "propertyStatus":status,
            "id": id,
          "description": description,
          "type": type,
          "bathrooms": bathrooms,
          "bedrooms": bedrooms,

          "area": area,
          "level": level,
          "isFurnished": isFurnished,
          "details": details,
          "price": price,
          "per": per,
          "address": address,
          "propertyImages": propertyImages,
          "longitude": long,
          'latitude': lat,
        },
      );
      return right(EditPropertyModel.fromJson(data.data));
    } catch (e) {
      if (e is DioException) {
        print(ServerFailure.formDioError(e).error);
        return left(ServerFailure.formDioError(e));
      } else {
        print(e.toString());
        return left(ServerFailure(e.toString()));
      }
    }
  }
}

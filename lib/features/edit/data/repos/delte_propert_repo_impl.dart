import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/core/utils/dio_helper.dart';
import 'package:sakkiny/features/edit/data/repos/delte_property_repo.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';

class DelteProperyRepoImpl implements DeletePropertyRepo {
  @override
  Future<Either<Failures, Property>> deltePropert({required String id}) async {
    try {
      var data = await DioHelper.deleteData(
          url: '/hosting/delete/$id',
          token:
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVzbGFtYWltbjU5NUBnbWFpbC5jb20iLCJpZCI6IjY2N2RjMjJiZDZkNmQzZDRhMWZiOWQ0YyIsImlzbG9nZ2VkIjp0cnVlLCJpYXQiOjE3MjAyNzkwNzB9.U8_njcOJ2Ic_TphFtAJ0HP2FcnihwGQuulu_xFIW4K0',
          query: {
            "id": id,
          });
      return right(Property.fromJson(data.data));
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

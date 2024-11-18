import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/utils/dio_helper.dart';
import 'package:sakkiny/core/utils/end_points.dart';
import 'package:sakkiny/features/user_property/data/model/user_property_model/property.dart';
//import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/user_property/data/repo/user_property_repo.dart';

class UserPropertyRepoImpl extends UserPropertyRepo {
  @override
  Future<Either<Failures, List<Property>>> fetchUserProperty() async {
    try {
      var data = await DioHelper.getData(
          url: getUserProperty ,
          // token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVzbGFtYWltbjU5NUBnbWFpbC5jb20iLCJpZCI6IjY2N2RjMjJiZDZkNmQzZDRhMWZiOWQ0YyIsInJvbGUiOiJVc2VyIiwiaXNsb2dnZWQiOnRydWUsImlhdCI6MTcxOTUxODY0NH0.y7_df9LJNh90-XAjYBnItu_RsDR4iRXfO_BRjB1Wr10'
          token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImVzbGFtYWltbjU5NUBnbWFpbC5jb20iLCJpZCI6IjY2N2RjMjJiZDZkNmQzZDRhMWZiOWQ0YyIsImlzbG9nZ2VkIjp0cnVlLCJpYXQiOjE3MjAyNzkwNzB9.U8_njcOJ2Ic_TphFtAJ0HP2FcnihwGQuulu_xFIW4K0'
          )
        ;
      List<Property> properties = [];
      for (var homeMap in data.data['properties']) {
        properties.add(Property.fromJson(homeMap));
      }
      return right(properties);
    } catch (e) {
      if (e is DioException) {
        print(left(ServerFailure.formDioError(e)));
        return left(ServerFailure.formDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }}
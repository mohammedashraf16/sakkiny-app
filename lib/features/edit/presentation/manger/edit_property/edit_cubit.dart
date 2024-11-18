// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sakkiny/features/edit/data/repos/edit_property_repo_impl.dart';
import 'package:sakkiny/features/edit/presentation/manger/edit_property/edit_state.dart';
import 'package:sakkiny/features/home/presentation/manger/property_cubit/property_cubit.dart';

class EditPropertyCubit extends Cubit<EditPropertyState> {
  //EditPropertyCubit() : super(EditPropertyInitial());
  static EditPropertyCubit get(context) => BlocProvider.of(context);
final PropertyCubit propertyCubit;

  EditPropertyCubit(this.propertyCubit) : super(EditPropertyInitial());
  Future<void> editProperty({
     required String id,
    required bool isFurnished,
    required int price,
     required String status,
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
    // required String addedByType,
  }) async {
    emit(EditPropertyLoading());
    var result = await EditRepoImpl().editProperty(
        id: id,
        isFurnished: isFurnished,
        price: price,
        area: area,
        bedrooms: bedrooms,
        level: level,
        bathrooms: bathrooms,
        details: details,
        address: address,
        propertyImages: propertyImages,
        type: type,
        status: status,
        per: per,
        description: description,
        lat: lat,
        long: long);

   // result.fold((er
    result.fold((error) {
      emit(EditPropertyFailure(error: error.toString()));
    }, (editPropertyModel) {
      // Trigger a refresh of the property list
      propertyCubit.fetchProperty();
      emit( EditPropertySuccess(editPropertyModel:editPropertyModel ));
    });
  }
}

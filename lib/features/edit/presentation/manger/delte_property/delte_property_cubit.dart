// ignore_for_file: avoid_print
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/features/edit/data/repos/delte_propert_repo_impl.dart';

import 'package:sakkiny/features/edit/presentation/manger/delte_property/delte_propert_state.dart';
import 'package:sakkiny/features/home/presentation/manger/property_cubit/property_cubit.dart';

// class DeltePropertyCubit extends Cubit<DeltePropertyState> {
//   DeltePropertyCubit() : super(DeltePropertyInitial());
//   static DeltePropertyCubit get(context) => BlocProvider.of(context);

//   Future<void> delteProperty({
//    required String id,

//   }) async {
//     emit( DeltePropertyLoading());
//     var result = await DelteProperyRepoImpl().deltePropert(id: id);

//     result.fold((error) {
//       emit(DeltePropertyFailure(error: error.toString()));
//       print(error);
//     }, (deltePropertyModel) {
//       emit(DeltePropertySuccess(deltePropertyModel: deltePropertyModel));
//     });
//   }
// }
class DeltePropertyCubit extends Cubit<DeltePropertyState> {
  final PropertyCubit propertyCubit;

  DeltePropertyCubit(this.propertyCubit) : super(DeltePropertyInitial());

  static DeltePropertyCubit get(context) => BlocProvider.of(context);

  Future<void> delteProperty({required String id}) async {
    emit(DeltePropertyLoading());
    var result = await DelteProperyRepoImpl().deltePropert(id: id);

    result.fold((error) {
      emit(DeltePropertyFailure(error: error.toString()));
    }, (deletedProperty) {
      // Trigger a refresh of the property list
      propertyCubit.fetchProperty();
      emit(DeltePropertySuccess(deltePropertyModel: deletedProperty));
    });
  }
}

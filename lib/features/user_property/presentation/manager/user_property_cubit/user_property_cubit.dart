import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sakkiny/features/user_property/data/repo/user_peopert_repo_impl.dart';
import 'package:sakkiny/features/user_property/presentation/manager/user_property_cubit/user_property_states.dart';

class UserPropertyCubit extends Cubit<UserPropertyStates> {
  UserPropertyCubit() : super(InitialUserPropertyState());
  static UserPropertyCubit get(context) => BlocProvider.of(context);

  Map<String?, bool?> favorites = {};

  Future<void> fetchUserProperty() async {
    emit(LoadingUserPropertyState());
    var result = await UserPropertyRepoImpl().fetchUserProperty();
    result.fold((failure) {
      print(failure.error.toString());
      emit(FailureUserPropertyState(failure.error));
    }, (properties) {
      favorites = {
        for (var element in properties)
          element.id: element.likesCount != null && element.likesCount! > 0
      };
      emit(SuccessUserPropertyState(properties));
    });
  }
}

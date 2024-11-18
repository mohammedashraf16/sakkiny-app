import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/widgets/custom_error_widget.dart';
import 'package:sakkiny/features/user_property/presentation/manager/user_property_cubit/user_property_cubit.dart';
import 'package:sakkiny/features/user_property/presentation/manager/user_property_cubit/user_property_states.dart';
import 'package:sakkiny/features/user_property/presentation/view/widgets/list_view_property_indicator.dart';
import 'package:sakkiny/features/user_property/presentation/view/widgets/list_view_user_property.dart';


class UserPropertyBlocBuilder extends StatelessWidget {
  const UserPropertyBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPropertyCubit, UserPropertyStates>(
      builder: (context, state) {
        if (state is SuccessUserPropertyState) {
          if (state.properties.isEmpty) {
            return CustomErrorWidget(
                errorMassage:
                    "No properties have been added yet..".tr(context));
          } else {
            return ListViewUserProperty(properties: state.properties);
          }
        } else if (state is FailureUserPropertyState) {
          return CustomErrorWidget(errorMassage: state.error);
        } else {
          return const ListViewUserPropertyLoadingIndicator();
        }
      },
    );
  }
}
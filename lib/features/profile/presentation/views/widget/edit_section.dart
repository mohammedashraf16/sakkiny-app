import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/features/profile/presentation/views/widget/custom_container_bottom.dart';

// class EditSection extends StatelessWidget {
//   const EditSection({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CustomContainerBottom(
//       onTap: () {
//         GoRouter.of(context).push(AppRouter.kEditView);
//       },
//       text: 'Edit Your Property'.tr(context),
//       firstIcon: Icons.edit_outlined,
//     );
//   }
// }
class EditSection extends StatelessWidget {
  const EditSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainerBottom(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kUserPropertyView);
      },
      text: 'Edit Your Property'.tr(context),
      firstIcon: Icons.edit_outlined,
    );
  }
}
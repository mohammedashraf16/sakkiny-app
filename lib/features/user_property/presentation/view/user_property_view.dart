import 'package:flutter/material.dart';
import 'package:sakkiny/features/user_property/presentation/view/widgets/user_property_view_body.dart';

class UserPropertyView extends StatelessWidget {
  const UserPropertyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: UserPropertyViewBody(),
    );
  }
}

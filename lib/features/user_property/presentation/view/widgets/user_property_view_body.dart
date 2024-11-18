import 'package:flutter/material.dart';

import 'package:sakkiny/features/user_property/presentation/view/widgets/user_propert_bloc_bulider.dart';


class UserPropertyViewBody extends StatelessWidget {
  const UserPropertyViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            const UserPropertyBlocBuilder(),
          ],
        ),
      ),
    );
  }
}

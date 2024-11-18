import 'package:flutter/material.dart';
import 'package:sakkiny/features/edit/presentation/views/widget/edit_property_view.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';

class EditView extends StatelessWidget {
  const EditView({Key? key, required this.property}) : super(key: key);
  final Property property;
  @override
  Widget build(BuildContext context) {
    // return const EditViewBody();
    return EditPropertyView(property: property);
  }
}

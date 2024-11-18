import 'package:flutter/cupertino.dart';
import 'package:sakkiny/core/widgets/custom_divider.dart';
//import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/user_property/data/model/user_property_model/property.dart';
import 'package:sakkiny/features/user_property/presentation/view/widgets/custom_user_property_detailss.dart';

class ListViewUserProperty extends StatelessWidget {
  const ListViewUserProperty({Key? key, required this.properties})
      : super(key: key);
  final List<Property> properties;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Change to NeverScrollableScrollPhysics
      itemBuilder: (context, index) => CustomUserPropertyDetails(property: properties[index]),
      separatorBuilder: (context, index) => const CustomDivider(),
      itemCount: properties.length,
    );
  }
}
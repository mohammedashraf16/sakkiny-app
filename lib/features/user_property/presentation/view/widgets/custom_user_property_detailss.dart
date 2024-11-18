import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/app_router.dart';
import 'package:sakkiny/core/utils/const.dart';
//import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/user_property/data/model/user_property_model/property.dart';
import 'package:sakkiny/features/user_property/presentation/view/widgets/custom_user_property_image.dart';

class CustomUserPropertyDetails extends StatelessWidget {
  const CustomUserPropertyDetails({Key? key, required this.property})
      : super(key: key);
  final Property property;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      child: InkWell(
        onTap: () {
          GoRouter.of(context).push(
            AppRouter.kSelectedView,
            extra: property,
          );
        },
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .25,
              width: MediaQuery.of(context).size.width * .8,
              child: CustomUserPropertyImage(property: property),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(
                    property.type!.tr(context),
                    style: const TextStyle(
                      color: kLogoColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${property.price} ${'LE'.tr(context)} / ${property.per!.tr(context)}',
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: kLocationColor,
                ),
                Text(
                  property.address!,
                  style: const TextStyle(
                    fontSize: 13,
                    color: kLocationColor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.bed),
                const SizedBox(width: 10),
                Text('${property.bedrooms!} ${'Rooms'.tr(context)}'),
                const SizedBox(width: 20),
                const Icon(Icons.photo_size_select_small),
                const SizedBox(width: 10),
                Text('${property.area!}${'M'.tr(context)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

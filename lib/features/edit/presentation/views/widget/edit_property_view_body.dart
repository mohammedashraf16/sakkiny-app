import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sakkiny/core/errors/failures.dart';
import 'package:sakkiny/core/utils/app_localizations.dart';
import 'package:sakkiny/core/utils/const.dart';
import 'package:sakkiny/core/widgets/custom_button.dart';
import 'package:sakkiny/core/widgets/custom_text_form_field.dart';
import 'package:sakkiny/core/widgets/show_toast.dart';
import 'package:sakkiny/features/add/presentation/views/widget/bathroom_details.dart';
import 'package:sakkiny/features/add/presentation/views/widget/custom_chose_image.dart';
import 'package:sakkiny/features/add/presentation/views/widget/floor_details.dart';
import 'package:sakkiny/features/add/presentation/views/widget/rental_rate_details.dart';
import 'package:sakkiny/features/add/presentation/views/widget/search_map.text.dart';
import 'package:sakkiny/features/add/presentation/views/widget/text_field_details.dart';
import 'package:sakkiny/features/add/presentation/views/widget/type_property_details.dart';
import 'package:sakkiny/features/edit/presentation/manger/delte_property/delte_propert_state.dart';
import 'package:sakkiny/features/edit/presentation/manger/delte_property/delte_property_cubit.dart';
import 'package:sakkiny/features/edit/presentation/manger/edit_property/edit_cubit.dart';
import 'package:sakkiny/features/edit/presentation/manger/edit_property/edit_state.dart';
import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/home/presentation/manger/property_cubit/property_cubit.dart';

class EditPropertyViewBody extends StatefulWidget {
  final Property property; // Add this line

  const EditPropertyViewBody(
      {super.key, required this.property}); // Modify constructor

  @override
  State<EditPropertyViewBody> createState() => _EditPropertyViewBodyState();
}

class _EditPropertyViewBodyState extends State<EditPropertyViewBody> {
  var formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  List<XFile> selectedImages = [];
  List<String> existingImages = [];
  TextEditingController priceController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController bedroomController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController rentalController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController bathroomsController = TextEditingController();
  TextEditingController luxuriesController = TextEditingController();
  double lang = 0;
  double lat = 0;
  bool isFurnished = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Initialize form fields with the property data
    priceController.text = widget.property.price.toString();
    addressController.text = widget.property.address.toString();
    typeController.text = widget.property.type.toString();
    descController.text = widget.property.description.toString();
    rentalController.text = widget.property.per.toString();
    statusController.text=widget.property.propertyStatus.toString();
    floorController.text = widget.property.level.toString();
    bathroomsController.text = widget.property.bathrooms.toString();
    bedroomController.text = widget.property.bedrooms.toString();
    unitController.text = widget.property.area.toString();
    //luxuriesController.text = widget.property.essentials?.toString() ?? '';
    //luxuriesController.text = widget.property.essentials?.join(', ') ?? '';
    lang = widget.property.longitude!.toDouble();
    lat = widget.property.latitude!.toDouble();

    // Initialize existing images
    existingImages = widget.property.propertyImages
            ?.map((propertyImage) => propertyImage.secureUrl!)
            .toList() ??
        [];
  }

  @override
  void dispose() {
    priceController.dispose();
    unitController.dispose();
    locationController.dispose();
    addressController.dispose();
    typeController.dispose();
    descController.dispose();
    floorController.dispose();
    bathroomsController.dispose();
    statusController.dispose();
    luxuriesController.dispose();
    super.dispose();
  }

  void handleImageSelection(List<XFile> images) {
    setState(() {
      selectedImages = images;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditPropertyCubit, EditPropertyState>(
      listener: (context, state) {
        if (state is EditPropertyLoading) {
          isLoading = true;
        }
        if (state is EditPropertySuccess) {
          isLoading = false;
          showToast(
            txt: state.editPropertyModel.message!,
            state: ToastState.SUCCESS,
          );
           context.read<PropertyCubit>().fetchProperty();
         Navigator.of(context).pop();
        }
        if (state is EditPropertyFailure) {
          isLoading = false;
          final errorMessage = state.error is ServerFailure
              ? (state.error as ServerFailure).error
              : 'An error occurred';
          showToast(
            txt: errorMessage,
            state: ToastState.ERROR,
          );
          print(errorMessage);
        }
      },
      builder: (context, state) {
        EditPropertyCubit cubit = EditPropertyCubit.get(context);

        return Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Furnished'.tr(context),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isFurnished = true;
                              });
                            },
                            child: Material(
                              elevation: 4,
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: isFurnished
                                      ? kLogoColor
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: Colors.black26),
                                ),
                                child: Text(
                                  'Yes'.tr(context),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: isFurnished
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 40),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isFurnished = false;
                              });
                            },
                            child: Material(
                              elevation: 4,
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  color: isFurnished
                                      ? Colors.transparent
                                      : kLogoColor,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(color: Colors.black26),
                                ),
                                child: Text(
                                  'No'.tr(context),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: isFurnished
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                   SizedBox(height: 30),
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: statusController,
                    isFilled: false,
                    labelText: 'PropertyStatus'.tr(context),
                    keyboardType: TextInputType.text,
                    validatorText: 'Enter PropertyStatus !!'.tr(context),
                  ),
                  SizedBox(height: 30),
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: priceController,
                    isFilled: false,
                    labelText: 'Price'.tr(context),
                    keyboardType: TextInputType.number,
                    validatorText: 'Enter The Price !!'.tr(context),
                  ),
                  SizedBox(height: 30),
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: unitController,
                    isFilled: false,
                    labelText: 'Unit'.tr(context),
                    keyboardType: TextInputType.number,
                    validatorText: 'Enter The Unit !!'.tr(context),
                  ),
                  SizedBox(height: 30),
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: bedroomController,
                    isFilled: false,
                    labelText: 'Bedroom'.tr(context),
                    keyboardType: TextInputType.number,
                    validatorText: 'Enter The Bedroom!!'.tr(context),
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: rentalController,
                    isFilled: false,
                    labelText: 'Rental rate'.tr(context),
                    keyboardType: TextInputType.number,
                    suffixIcon: const Icon(Icons.arrow_forward_ios),
                    validatorText: 'Enter Rental rate !!'.tr(context),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return RentalDetails(controller: rentalController);
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: floorController,
                    isFilled: false,
                    labelText: 'Floor'.tr(context),
                    suffixIcon: const Icon(Icons.arrow_forward_ios),
                    keyboardType: TextInputType.number,
                    validatorText: 'Enter Floor !!'.tr(context),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return FloorDetails(
                              fController: floorController,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: bathroomsController,
                    isFilled: false,
                    labelText: 'Bathrooms'.tr(context),
                    suffixIcon: const Icon(Icons.arrow_forward_ios),
                    keyboardType: TextInputType.number,
                    validatorText: 'Enter number of bathrooms !!'.tr(context),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return BathroomsDetails(
                              bController: bathroomsController,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return TextFieldDetails(
                              controllerOfList: luxuriesController,
                            );
                          },
                        ),
                      );
                    },
                    colorText: Colors.black,
                    controller: luxuriesController,
                    isFilled: false,
                    labelText: 'Luxuries'.tr(context),
                    suffixIcon: const Icon(Icons.arrow_forward_ios),
                    keyboardType: TextInputType.text,
                    validatorText: 'Enter Luxuries !!'.tr(context),
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: descController,
                    isFilled: false,
                    labelText: 'Description'.tr(context),
                    keyboardType: TextInputType.text,
                    validatorText: 'Enter Description !!'.tr(context),
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: addressController,
                    isFilled: false,
                    labelText: 'Address'.tr(context),
                    keyboardType: TextInputType.text,
                    validatorText: 'Enter Address !!'.tr(context),
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    onTap: () async {
                      Map<String, dynamic>? result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return const MapSearchPage();
                        }),
                      );
                      if (result != null) {
                        locationController.text = result['city_name'];
                        lat = result['latLng'].latitude;
                        lang = result['latLng'].longitude;
                      }
                    },
                    colorText: Colors.black,
                    controller: locationController,
                    isFilled: false,
                    labelText: 'Location'.tr(context),
                    keyboardType: TextInputType.text,
                    validatorText: 'Enter The Location !!'.tr(context),
                  ),
                  const SizedBox(height: 30),
                  // Display existing images
                  if (existingImages.isNotEmpty) ...[
                    Text('Existing Images:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: existingImages.map((imageUrl) {
                        return Image.network(
                          imageUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        );
                      }).toList(),
                    ),
                  ],
                   const SizedBox(height: 30),
                  CustomChoseImage(onImagesSelected: handleImageSelection),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    colorText: Colors.black,
                    controller: typeController,
                    isFilled: false,
                    labelText: 'Type'.tr(context),
                    suffixIcon: const Icon(Icons.arrow_forward_ios),
                    validatorText: 'Enter The Type !!'.tr(context),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return TypeDetails(
                              controller: typeController,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomButon(
                    text: 'Edit My Property',
                    width: double.infinity,
                    radius: 10,
                    onPressed: () async {
                      if (formKey.currentState!.validate() &&
                          selectedImages.isNotEmpty) {
                        cubit.editProperty(
                          status:statusController.text,
                          bedrooms: int.tryParse(bedroomController.text) ?? 0,
                          area: int.tryParse(unitController.text) ?? 0,
                          id: widget.property.id!,
                          type: typeController.text,
                          description: descController.text,
                          bathrooms:
                              int.tryParse(bathroomsController.text) ?? 0,
                          details: luxuriesController.text,
                          level: floorController.text,
                          price:
                              double.tryParse(priceController.text)?.toInt() ??
                                  0,
                          per: rentalController.text,
                          isFurnished: isFurnished,
                          address: addressController.text,
                          propertyImages: await Future.wait(
                            selectedImages.map(
                              (image) async => await MultipartFile.fromFile(
                                image.path,
                                filename: image.name,
                              ),
                            ),
                          ),
                          long: lang,
                          lat: lat,
                        );
                      } else {
                        autoValidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                      if (selectedImages.isEmpty) {
                        showToast(
                            txt: 'Choose from gallery five image at least'
                                .tr(context),
                            state: ToastState.ERROR);
                      }
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  BlocConsumer<DeltePropertyCubit, DeltePropertyState>(
                    listener: (context, state) {
                         if (state is DeltePropertyLoading) {
          isLoading = true;
        }
        if (state is DeltePropertySuccess) {
          isLoading = false;
          showToast(
            txt: 'Delte',
            state: ToastState.SUCCESS,
          );
           context.read<PropertyCubit>().fetchProperty();

          Navigator.of(context).pop();
        }if (state is EditPropertyFailure) {
          isLoading = false;
     
          showToast(
            txt: 'An error occurred',
            state: ToastState.ERROR,
          );
        
        }
                    },
                    
                    builder: (context, state) {
                       DeltePropertyCubit cubit = DeltePropertyCubit.get(context);
                      return CustomButon(
                        text: 'Delte My Property',
                        width: double.infinity,
                        radius: 10,
                        background: Colors.red,
                        onPressed: () {
                            cubit.delteProperty(id: widget.property.id!);
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

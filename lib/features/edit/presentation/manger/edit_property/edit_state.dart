import 'package:sakkiny/features/edit/data/models/edit_property_model/edit_property_model.dart';

abstract class EditPropertyState {}

class EditPropertyInitial extends EditPropertyState {}

class EditPropertySuccess extends EditPropertyState {
  final EditPropertyModel editPropertyModel;

  EditPropertySuccess({required this.editPropertyModel});
}

class EditPropertyLoading extends EditPropertyState {}

class EditPropertyFailure extends EditPropertyState {
  final String error;

  EditPropertyFailure({required this.error});
}

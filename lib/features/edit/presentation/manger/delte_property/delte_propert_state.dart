import 'package:sakkiny/features/home/data/models/home_model/property.dart';

abstract class DeltePropertyState {}

class DeltePropertyInitial extends DeltePropertyState {}

class DeltePropertySuccess extends DeltePropertyState {
  final Property deltePropertyModel;

  DeltePropertySuccess({required this.deltePropertyModel});
}

class DeltePropertyLoading extends DeltePropertyState {}

class DeltePropertyFailure extends DeltePropertyState {
  final String error;

  DeltePropertyFailure({required this.error});
}

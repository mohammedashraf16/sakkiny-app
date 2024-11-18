
//import 'package:sakkiny/features/home/data/models/home_model/property.dart';
import 'package:sakkiny/features/user_property/data/model/user_property_model/property.dart';
abstract class UserPropertyStates {}

class InitialUserPropertyState extends UserPropertyStates {}

class LoadingUserPropertyState extends UserPropertyStates {}

class SuccessUserPropertyState extends UserPropertyStates {
  final List<Property> properties;
  SuccessUserPropertyState(this.properties);
}

class FailureUserPropertyState extends UserPropertyStates {
  final String error;
  FailureUserPropertyState(this.error);
}



import 'package:equatable/equatable.dart';

class AuthEvent extends Equatable{
  List<Object> get props=>[];


}
class StartEvent extends AuthEvent{}
class LoginButtonPressed extends StartEvent{
  late final String email;
  late final String password;
  LoginButtonPressed({required this.email,required this.password});
}
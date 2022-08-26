
import 'package:equatable/equatable.dart';

class AuthState extends Equatable{
  List<Object> get props=>[];

}
class LoginInitState extends AuthState{}
class LoginLoadingState extends AuthState{}
class UserLoginSuccess extends AuthState{}
class AdminLoginSuccess extends AuthState{}
class LoginErorrState extends AuthState{
  late final massage;
  LoginErorrState({this.massage});
}
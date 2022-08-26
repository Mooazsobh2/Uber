import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/business_logic/login_bloc/login_event.dart';
import 'package:flutter_maps/business_logic/login_bloc/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repository/repo.dart';
import 'dart:convert';
class AuthBloc extends Bloc<AuthEvent,AuthState>{

  final AuthRepository authRepository;
  AuthBloc(AuthState initalState, this.authRepository):super(initalState);

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async*{
    var pre =await SharedPreferences.getInstance();
    if(event is StartEvent)
      {
        yield LoginInitState();
      }else if(event is LoginButtonPressed){
      yield LoginLoadingState();
      var data=await authRepository.login(event.email,event.password);
      // if(data['isAdmin']==0){
      //   pre.setString('token', data['token']);
      //   pre.setInt('isAdmin', data['isAdmin']);
      //   pre.setString('email', data['email']);
        yield UserLoginSuccess();
    //  }
    // else if(data['isAdmin']==1){
    //     pre.setString('token', data['token']);
    //     pre.setInt('isAdmin', data['isAdmin']);
    //     pre.setString('email', data['email']);
    //     yield AdminLoginSuccess();
    //   }
    }
  }
}
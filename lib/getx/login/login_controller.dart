
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_maps/admin/screens/main_screen.dart';
import 'package:flutter_maps/main.dart';
import 'package:flutter_maps/presentation/screens/map_screen.dart';

import 'package:get/get.dart';

import '../../custome_snakbar.dart';

import '../loader.dart';
import '../register/server_config.dart';
import 'package:http/http.dart' as http;



class LoginController extends GetxController {





  late TextEditingController emailController,passwordController;






  @override
  void onInit() {

    // service =  LoginService();

    super.onInit();
    emailController=TextEditingController();
    passwordController=TextEditingController();
  }


void onClose(){
    super.onClose();

    emailController.dispose();
    passwordController.dispose();
}
  // void changeCheckBox() async {
  //   checkBoxStatus(!(checkBoxStatus.value));
  // }






  void onClickLogin() async {
    if (emailController.text.isEmpty) {
      CustomSnackbar("Error", 'Email is requierd', 'error');
    } else if (passwordController.text.isEmpty) {
      CustomSnackbar("Error", 'password is requierd', 'error');
    } else {
      Get.showOverlay(asyncFunction: ()=>fetchLogin(),loadingWidget: Loader());
    }
  }
  var message;
  // Profile?  list1;

  var url = Uri.parse(ServerConfig.domainNameServer+ServerConfig.login);

   fetchLogin()async{
    var response = await http.post(url, headers: {
      'Accept': 'application/json',
    }, body: {
      // 'name': user.name,
      'email': emailController.text,
      'password': passwordController.text,
    });
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200 ) {
      var jsonResponse = jsonDecode(response.body);
      sharedPreferences.setString('token', jsonResponse[0]['token']);
      print(sharedPreferences.get("token"));

      if(jsonResponse[0]['user']['isAdmin']==0){
        CustomSnackbar('Success','Login is Success','success');
        Get.to(MapScreen());

       return true;
      }else{
        Get.offAllNamed('/AllDrivers');
        CustomSnackbar('Error','Login is Success','Success');
      }

      return true;

    } else if (response.statusCode == 401) {
      CustomSnackbar('Error','Error in Login ','Error');

      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['massage'];
      return false;
    }
    else if (response.statusCode == 422) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['errors'];
      return false;
    }else {
      return false;
    }
  }

}

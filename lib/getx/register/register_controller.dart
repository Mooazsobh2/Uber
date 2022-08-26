
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_maps/getx/loader.dart';
import 'package:flutter_maps/main.dart';
import 'package:flutter_maps/presentation/screens/registration_page.dart';
import 'package:get/get.dart';

import '../../custome_snakbar.dart';
import '../register/server_config.dart';
import '../register/user.dart';
import 'package:http/http.dart' as http;


class RegisterController extends GetxController {
  late TextEditingController
      nameController,
      emailController,
      passwordController,
      password_cController,
      phoneController;





  //
  // late String email ;
  // var password ;
  // var loginStatus ;
  // var message;
  // var isAdmin;

  // late LoginService service ;


  @override
  void onInit() {
    // email = '';
    // password = '';
    // loginStatus = false;
    // isAdmin = '';
    // service =  LoginService();
    super.onInit();
    nameController=TextEditingController();
    emailController=TextEditingController();
    passwordController=TextEditingController();
    password_cController=TextEditingController();
    phoneController=TextEditingController();

  }


  void onClose(){
    super.onClose();
    nameController.dispose();

    emailController.dispose();
    passwordController.dispose();
    password_cController.dispose();
    phoneController.dispose();
  }
  // void changeCheckBox() async {
  //   checkBoxStatus(!(checkBoxStatus.value));
  // }
  void onClickRegistration() async {
    if (emailController.text.isEmpty) {
      CustomSnackbar("Error", 'Email is requierd', 'error');
    } else if (passwordController.text.isEmpty) {
      CustomSnackbar("Error", 'password is requierd', 'error');
    } else {
      Get.showOverlay(asyncFunction: ()=>Registration(),loadingWidget: Loader());
    }
  }
  var message;
  var token=sharedPreferences.get('token');
  var url = Uri.parse(ServerConfig.domainNameServer+ServerConfig.register);

  Registration()async{
    var response = await http.post(url, headers: {
    'Authorization':'Bearer $token',
    }, body: {
      // 'name': user.name,
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'c_password': password_cController.text,
      'phone': phoneController.text,


    });
    print(response.statusCode);
    print(response.body);
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200 ) {
      CustomSnackbar('Success','Register is Success','success');
      Get.to(RegistrationPage());
      return true;

    } else if (response.statusCode == 401) {
      CustomSnackbar('Error','Error in Login ','Error');

      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['errors'];
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

// // EasyLoading.show(status: 'loading.');
// await controller.loginOnClick();
// if (controller.loginStatus) {
//   // EasyLoading.showSuccess(controller.message);
//   Get.to(MapScreen());
// } else {
//   // EasyLoading.showError(
//   //   controller.message,
//   //   duration: Duration(seconds: 2),
//   //   dismissOnTap: true,
//   // );
//   print('error here');
// }

// Future<void> loginOnClick() async {
//
//   Users user = Users(
//     email: email,
//     password: password,
//
//   );
//   loginStatus = await service.login(user);
//   // message = service.message;
//
//   if (message is List) {
//     String temp = '';
//     for (String s in message) temp += s + '\n';
//     message = temp;
//   }
// }
}

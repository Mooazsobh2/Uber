
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_maps/getx/loader.dart';
import 'package:flutter_maps/main.dart';
import 'package:flutter_maps/presentation/screens/registration_page.dart';
import 'package:get/get.dart';

import '../../custome_snakbar.dart';

import 'package:http/http.dart' as http;

import '../../getx/register/server_config.dart';
import '../screens/home.dart';
import '../screens/main_screen.dart';


class AddDriverController extends GetxController {
  late TextEditingController
  nameController,
      emailController,
      passwordController,
      phone_numberController,
      birth_dateController,
  ExpirationController,
  Driving_License_numController;


  @override
  void onInit() {

    super.onInit();
    nameController=TextEditingController();
    emailController=TextEditingController();
    phone_numberController=TextEditingController();
    passwordController=TextEditingController();
    birth_dateController=TextEditingController();
    ExpirationController=TextEditingController();
    Driving_License_numController=TextEditingController();


  }


  void onClose(){
    super.onClose();
    nameController.dispose();
    phone_numberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    birth_dateController.dispose();
    ExpirationController.dispose();
    Driving_License_numController.dispose();
  }

  void onClickAddDrivers() async {
    if (emailController.text.isEmpty) {
      CustomSnackbar("Error", 'Email is requierd', 'error');
    } else if (passwordController.text.isEmpty) {
      CustomSnackbar("Error", 'password is requierd', 'error');
    }
    else if (phone_numberController.text.isEmpty) {
      CustomSnackbar("Error", 'birth date is requierd', 'error');
    }
    else if (birth_dateController.text.isEmpty) {
      CustomSnackbar("Error", 'exp date is requierd', 'error');
    }
    else {
      Get.showOverlay(asyncFunction: ()=>AddDriver(),loadingWidget: Loader());
    }
  }
  var message;
  var token=sharedPreferences.get('token');
  var url = Uri.parse(ServerConfig.domainNameServer+ServerConfig.Create);

  AddDriver()async{
    var response = await http.post(url, headers: {
      'Authorization':'Bearer $token',
    }, body: {
      // 'name': user.name,
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'phone_number': phone_numberController.text,
      'driving_license_num': Driving_License_numController.text,
      'exp_date':ExpirationController.text,
      'birth_date':birth_dateController.text

    });
    Timer.periodic(Duration(microseconds: 1000), (_) {

    });
    print(response.statusCode);
    print(response.body);
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200 ) {
      CustomSnackbar('Success','Creat Driver is Success','success');
      Get.to(Home());

      return response.body+DateTime.now().millisecondsSinceEpoch.toString();

    } else if (response.statusCode == 401) {
      CustomSnackbar('Error','Error in Create ','Error');

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
}

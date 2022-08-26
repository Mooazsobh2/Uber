
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_maps/getx/loader.dart';
import 'package:flutter_maps/main.dart';
import 'package:flutter_maps/presentation/screens/registration_page.dart';
import 'package:get/get.dart';

import '../../custome_snakbar.dart';

import 'package:http/http.dart' as http;

import '../../getx/register/server_config.dart';


class UpdateController extends GetxController {
  late TextEditingController
      EditnameController,
      EditemailController,
      Editphone_number;






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
    EditnameController=TextEditingController();
    EditemailController=TextEditingController();
    Editphone_number=TextEditingController();

  }


  void onClose(){
    super.onClose();
    EditnameController.dispose();

    EditemailController.dispose();

    Editphone_number.dispose();
  }
  // void changeCheckBox() async {
  //   checkBoxStatus(!(checkBoxStatus.value));
  // }
  void onClickUpdate(int id, int driver_id) async {
    if (EditemailController.text.isEmpty) {
      CustomSnackbar("Error", 'EditemailController is requierd', 'error');
    } else if (Editphone_number.text.isEmpty) {
      CustomSnackbar("Error", 'Editphone_number is requierd', 'error');
    } else {
      Get.showOverlay(asyncFunction: ()=>Update(id,driver_id),loadingWidget: Loader());
    }
  }
  var message;
  var token=sharedPreferences.get('token');

  Update(int id,int driver_id)async{
    var response = await http.put(Uri.parse('http://10.0.2.2:8000/api/drivers/edit/$driver_id/$id'), headers: {
      'Authorization':'Bearer $token',
    }, body: {
       'name': EditnameController.text,
      'email': EditemailController.text,
      'phone_number': Editphone_number.text,


    });
    print(response.statusCode);
    print(response.body);
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200 ) {
      CustomSnackbar('Success','Register is Success','success');

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

}

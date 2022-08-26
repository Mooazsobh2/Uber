
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_maps/getx/loader.dart';
import 'package:flutter_maps/main.dart';
import 'package:flutter_maps/presentation/screens/map_screen.dart';
import 'package:flutter_maps/presentation/screens/registration_page.dart';
import 'package:get/get.dart';

import '../../custome_snakbar.dart';
import '../register/server_config.dart';
import '../register/user.dart';
import 'package:http/http.dart' as http;


class PurshaseController extends GetxController {
  late TextEditingController
  Car_TypeController,
      model_nameController,
      manyfactor_yearController,
      technical_conditioncController,
      priceController;




  @override
  void onInit() {

    super.onInit();
    Car_TypeController=TextEditingController();
    model_nameController=TextEditingController();
    manyfactor_yearController=TextEditingController();
    technical_conditioncController=TextEditingController();
    priceController=TextEditingController();

  }


  void onClose(){
    super.onClose();
    Car_TypeController.dispose();

    model_nameController.dispose();
    manyfactor_yearController.dispose();
    technical_conditioncController.dispose();
    priceController.dispose();
  }
  // void changeCheckBox() async {
  //   checkBoxStatus(!(checkBoxStatus.value));
  // }
  void onClickPurcher() async {
    if (priceController.text.isEmpty) {

      CustomSnackbar("Error", 'price is requierd', 'error');
    } else if (technical_conditioncController.text.isEmpty) {
      CustomSnackbar("Error", 'password is requierd', 'error');
    } else {
      Get.showOverlay(asyncFunction: ()=>Purshase(),loadingWidget: Loader());
    }
  }
  var message;
  var token=sharedPreferences.get("token");
  var url = Uri.parse(ServerConfig.domainNameServer+ServerConfig.purchase);

  Purshase()async{
    var response = await http.post(url, headers: {
      'Authorization':'Bearer $token',

    }, body: {
      // 'name': user.name,
     'car_type': Car_TypeController.text,

     'model_name': model_nameController.text,
    'manyfactor_year':manyfactor_yearController.text,
    'technical_condition':technical_conditioncController.text,
    'price':priceController.text,

    });
    print(response.statusCode);
    print(response.body);
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 201 ) {
      CustomSnackbar('Success','Purchase is Success','success');
      Get.to(MapScreen());
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

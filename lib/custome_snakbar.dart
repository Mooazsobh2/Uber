import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

CustomSnackbar(title,massage,type){
  Get.snackbar(title,massage,snackPosition: SnackPosition.TOP,
  backgroundColor: type=='error'?Colors.white:Colors.white,
  colorText: Colors.red,
  );
}
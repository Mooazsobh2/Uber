import 'dart:convert';

import 'package:flutter_maps/main.dart';
import 'package:flutter_maps/presentation/screens/map_screen.dart';
import 'package:get/get.dart';


import 'package:http/http.dart'as http;

import '../register/server_config.dart';
import 'modelshow.dart';

class DetialsContrller extends GetxController{




  void onInit(){
    super.onInit();
  }


  var token=sharedPreferences.getString("token");
  ShowPurchase?  list;
  // AllDrivers list=<AllDrivers>[].obs as AllDrivers;
  var isLoading=false.obs;
  // var url = Uri.parse(ServerConfig.domainNameServer+ServerConfig.detials);

   Detials(int id)async{

    var response=await http.get(
        Uri.parse('http://10.0.2.2:8000/api/show-details/$id')
    ,headers: {
      'Authorization':'Bearer $token',
    });

    print(response.statusCode);
    print(response.body);
    if(response.statusCode==201){
      var result=jsonDecode(response.body);
      Get.to(MapScreen());
      return list=Detials(id).fromJson(result);

    }
  }



}
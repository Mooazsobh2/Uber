import 'dart:convert';

import 'package:flutter_maps/main.dart';
import 'package:get/get.dart';


import 'package:http/http.dart'as http;

import '../register/server_config.dart';
import 'modelshow.dart';

class showPurchaseContrller extends GetxController{




  void onInit(){
    super.onInit();
    fechAllcars();
  }


  var token=sharedPreferences.getString("token");
  ShowPurchase?  list;
  // AllDrivers list=<AllDrivers>[].obs as AllDrivers;
  var isLoading=false.obs;
  var url = Uri.parse(ServerConfig.domainNameServer+ServerConfig.showpurchase);

  fechAllcars()async{

    var response=await http.get(url,headers: {
      'Authorization':'Bearer $token',
    });

    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      var result=jsonDecode(response.body);
      return list=ShowPurchase.fromJson(result);

    }
  }



}
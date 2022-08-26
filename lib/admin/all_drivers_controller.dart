import 'dart:convert';

import 'package:flutter_maps/main.dart';
import 'package:get/get.dart';

import '../custome_snakbar.dart';
import '../getx/register/server_config.dart';
import 'model/alldrivers.dart';
import 'package:http/http.dart'as http;

class AllDriversControllers extends GetxController{


  var isLoading=false.obs;


  void onInit(){
    super.onInit();
    fechAllDrivers();
    isLoading.value=false ;
  }


  var token=sharedPreferences.getString("token");
    AllDrivers?  list;
  // AllDrivers list=<AllDrivers>[].obs as AllDrivers;
   var url = Uri.parse(ServerConfig.domainNameServer+ServerConfig.AllDrivers);

   fechAllDrivers()async{

         var response=await http.get(url,headers: {
           'Authorization':'Bearer $token',
         });

         print(response.statusCode);
         print(response.body);
         if(response.statusCode==200){
           var result=jsonDecode(response.body);
           return list=AllDrivers.fromJson(result);

     }
  }


  DeleteDrivers(int id,int driver_id)async{

    var response=await http.delete(Uri.parse("http://10.0.2.2:8000/api/drivers/delete/$driver_id/$id"),headers: {
      'Authorization':'Bearer $token',

    });

    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      CustomSnackbar('Success','Delete is Success','success');

      var result=jsonDecode(response.body);

      return true;
    }
    else{
      print("erorr");
    }
  }

  // UpdateDrivers(int id)async{
  //
  //   var response=await http.get(Uri.parse("http://10.0.2.2:8000/api/drivers/details/$id"),headers: {
  //     'Authorization':'Bearer $token',
  //
  //   });
  //
  //   print(response.statusCode);
  //   print(response.body);
  //   if(response.statusCode==200){
  //     var result=jsonDecode(response.body);
  //     return true;
  //   }
  //   else{
  //     print("erorr");
  //   }
  // }



}




import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/model_login.dart';
 String Url='http://127.0.0.1:8000/api';

String LoginUrl='/login';




class AuthRepository{
  var url = Uri.parse('http://127.0.0.1:8000/api/login');


   login(String email,String password) async {

  var response=await http.post(url,headers: {},body: {
    'email':email,
    'password':password
  });
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  final data=jsonDecode(response.body);
  if(data['massage']=='0'||data['massage']=='isUser'){
    return data;
   }
  }
}
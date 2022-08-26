import 'dart:convert';

import 'package:flutter_maps/getx/register/server_config.dart';
import 'package:flutter_maps/getx/register/user.dart';
import 'package:http/http.dart' as http;

import '../../data/models/model_login.dart';

class SignUpService {
  var message;

  var url = Uri.parse(ServerConfig.domainNameServer);

  Future<bool> register(Users user) async {
    var response = await http.post(url, headers: {
      'Accept': 'application/json',
    }, body: {
      // 'name': user.name,
      'name': user.name,
      'email': user.email,
      'password': user.password,
      'c_password': user.passwordConfirmation,
      'phone_number':user.phone,
    });
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse[''];
      return true;
    } else if (response.statusCode == 422) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['errors'];
      return false;
    } else {
      return false;
    }
  }
}

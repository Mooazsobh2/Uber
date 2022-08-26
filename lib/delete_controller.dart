// import 'package:get/get.dart';
// import 'package:get/get_connect/connect.dart';
// import 'package:http/http.dart%20';

// class TaskProvider extends GetxController {
//   // Fetch Data
//   Future<String> deleteTask(Map data) async {
//     try{
//       final response = await post(
//           "h",body: data);
//       if (response.status.hasError) {
//         return Future.error(response.statusText);
//       } else {
//         return response.body['result'];
//       }
//     }
//     catch(exception)
//     {
//       return Future.error(exception.toString());
//     }
//
//   }
// }

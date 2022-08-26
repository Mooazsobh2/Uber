import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_maps/admin/screens/main_screen.dart';
import 'package:flutter_maps/firebase_options.dart';
import 'package:flutter_maps/presentation/screens/login_page.dart';
import 'package:flutter_maps/presentation/screens/map_screen.dart';
import 'package:flutter_maps/presentation/splash/onboard.dart';
import 'package:flutter_maps/send.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hexcolor/hexcolor.dart';

import 'app_router.dart';
import 'constnats/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

late String initialRoute=splash;
late SharedPreferences sharedPreferences;
void main() async {

  Color _primaryColor = HexColor('#fe5454');
  Color _accentColor = HexColor('#fc3030');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform
  );
  var fcm= FirebaseMessaging.instance.getToken().then((value) => print(value));
FirebaseNotifiaction();
  sharedPreferences =await SharedPreferences.getInstance();


  runApp(
    MyApp(
    ),
  );
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> fbApp = Firebase.initializeApp();


   MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        builder: EasyLoading.init(),

        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/map',
        routes: {
          '/splash':(context)=>OnboardScreen(),
          '/':(context)=>LoginPage(),
          '/map':(context)=>MapScreen(),
          '/AllDrivers':(context)=>AllDrrivers(),

        },
      );

  }
}

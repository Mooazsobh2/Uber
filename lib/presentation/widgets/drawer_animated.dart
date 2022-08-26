import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/presentation/about%20us.dart';
import 'package:flutter_maps/presentation/screens/map_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../getx/showpurshase/showpurshase.dart';
import '../screens/myprofile.dart';
import '../../getx/purchase/purshase.dart';

class DrawerAnimated extends StatelessWidget {
  Color _primaryColor = HexColor('#A30000');
  Color _accentColor = HexColor('#4c0000');
  @override
  Widget build(BuildContext context) {
    return AnimatedDrawer(

      homePageXValue: 150,
      homePageYValue: 80,
      homePageAngle: -0.2,
      homePageSpeed: 100,
      shadowXValue: 122,
      shadowYValue: 110,
      shadowAngle: -0.275,
      shadowSpeed: 550,
        openIcon: Icon(Icons.menu_open, color: HexColor('#ffffff')),
      closeIcon: Icon(Icons.arrow_back_ios, color: HexColor('#ffffff')),
      shadowColor: _primaryColor,
      backgroundGradient: LinearGradient(
        colors: [_accentColor,_accentColor],
      ),
      menuPageContent: Padding(
        padding: const EdgeInsets.only(top: 100.0, left: 15),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image(image: AssetImage("assets/images/ss.png")),
              Row(
                children: [
                  Text(
                    "City Cab",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40),
              ),
              TextButton(onPressed: (){
                Get.to(ProfilePage());
              },
                  child: Text('My Profile',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ))),

              TextButton(onPressed: (){
                Get.to(Purshase());
              },
                  child: Text('Purchase',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ))),
              TextButton(onPressed: (){
                Get.to(ShowPurshase());
              },
                  child: Text('Show Car Purchase',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ))),
              TextButton(onPressed: (){
                Get.to(MapScreen());
              }, child: Text("Home Screen",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,fontSize: 17,),)),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              Divider(
                color: Colors.white,
                thickness: 3,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              TextButton(onPressed: (){
                Get.to(About_Us());
              },
                  child: Text('About Us',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ))),
              TextButton(onPressed: (){
              },
                  child: Text('Language',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ))),
              TextButton(onPressed: (){
                Get.defaultDialog(
                  title: "Are you Sure?",
                  titleStyle: TextStyle(fontSize: 20),
                  middleText: 'LogOut ?',
                  textCancel: "Cancel",
                  textConfirm: "Confirm",
                  cancelTextColor: Colors.red,
                  buttonColor: Colors.red,
                  confirmTextColor: Colors.white,
                  onCancel: () {},
                  onConfirm: () {

                  },
                );
              },
                  child: Text('LogOut',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ))),
            ],
          ),
        ),
      ),
      homePageContent: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: _primaryColor,
        child: Center(
          child:Image.asset("assets/images/bb.png",
            height: MediaQuery.of(context).size.height / 2,
          ),
        ),
      ),
    );
  }
}

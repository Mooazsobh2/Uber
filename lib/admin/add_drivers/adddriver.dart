import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/admin/add_drivers/add_driver_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../presentation/widgets/header_widget.dart';
import '../../presentation/widgets/theme_helper.dart';

class AddDriver  extends StatefulWidget {

  @override
  State<AddDriver> createState() => _State();
}

class _State extends State<AddDriver> {
  AddDriverController addDriverController=Get.put(AddDriverController());
  @override
  void initState(){
    super.initState();
    addDriverController.onClickAddDrivers();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
                color:HexColor("0C72B0"),
              ),
              child:Stack(
                children: [
                  Positioned(
                    top: 60,
                    left: 0,
                    child:Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(58)
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top:70 ,
                      left: 20,
                      child: Text(
                        "All Drivers",style: TextStyle(fontSize: 30,color: HexColor("0C72B0"),fontWeight: FontWeight.bold),
                      ))
                ],
              ) ,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    child: Column(
                      children: [
                        SizedBox(height: 150,),
                        Container(
                          child: TextFormField(
                            controller: addDriverController.nameController,
                            // onChanged: (value) {
                            //   controller.fullName = value;
                            // },
                            decoration: ThemeHelper().textInputDecoration('Full Name', 'Enter your Full name'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),

                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: addDriverController.emailController,

                            // onChanged: (value) {
                            //   controller.email = value;
                            // },

                            decoration: ThemeHelper().textInputDecoration("E-mail address", "Enter your email"),
                            keyboardType: TextInputType.emailAddress,

                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: addDriverController.passwordController,

                            // onChanged: (value) {
                            //   controller.password = value;
                            // },

                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                "Password", "Enter your password"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: addDriverController.phone_numberController,

                            // onChanged: (value) {
                            //   controller.passwordConfirm = value;
                            // },

                            decoration: ThemeHelper().textInputDecoration(
                                "Phone Number", "Enter your Phone Number"),

                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: addDriverController.birth_dateController,

                            // onChanged: (value) {
                            //   controller.passwordConfirm = value;
                            // },

                            decoration: ThemeHelper().textInputDecoration(
                                "Birth Date", "Enter your Birth Date"),

                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ), SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: addDriverController.ExpirationController,

                            // onChanged: (value) {
                            //   controller.passwordConfirm = value;
                            // },

                            decoration: ThemeHelper().textInputDecoration(
                                "Expiration Date", "Enter your Expire Date"),

                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: addDriverController.Driving_License_numController,

                            // onChanged: (value) {
                            //   controller.passwordConfirm = value;
                            // },

                            decoration: ThemeHelper().textInputDecoration(
                                "driving_license_num", "Enter your driving_license_num"),

                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: HexColor('#19267E'),// Background color
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Create".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onPressed: () {
                              addDriverController.onClickAddDrivers();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

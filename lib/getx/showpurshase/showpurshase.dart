import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/getx/showpurshase/detials_controller.dart';
import 'package:flutter_maps/getx/showpurshase/showpurshace_contrller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

import 'details.dart';


class ShowPurshase extends StatefulWidget {
  const ShowPurshase({Key? key}) : super(key: key);

  @override
  State<ShowPurshase> createState() => _ShowPurshase();
}

class _ShowPurshase extends State<ShowPurshase> {
  showPurchaseContrller showPurchaceContrller=Get.put(showPurchaseContrller());
  DetialsContrller _detialsContrller=Get.put(DetialsContrller());
  Color _primaryColor = HexColor('#A30000');

  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
            ),
            color:_primaryColor,
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
                    "Get Cars",style: TextStyle(fontSize: 30,color: _primaryColor,fontWeight: FontWeight.bold),
                  ))
            ],
          ) ,
        ),
        SizedBox(
          height: height*0.005,
        ),

        Expanded(
          child:Obx(()=>showPurchaceContrller.isLoading.value?Center(
            child: CircularProgressIndicator(),
          ):ListView.builder(
            itemCount:showPurchaceContrller.list!.data2.length,
            itemBuilder: (context, index){
              return Container(
                margin:EdgeInsets.only(bottom: 10,top: 25),
                padding: EdgeInsets.only(left: 20,right: 20, bottom: 20),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: _primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80.0),
                      ),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.red.withOpacity(0.3),
                          offset: new Offset(-10.0, 0.8),
                          blurRadius: 20,
                          spreadRadius: 4.0,
                        ),
                      ]
                  ),
                  padding: EdgeInsets.only(
                    left: 12,
                    top:50,
                    bottom: 30,
                  ),
                  child: Column(

                    children: [
                      Row(

                        children: [


                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 55,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/images/KIA_Cerato_2021.jpg'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Column(

                              children: [
                                Text('CarType:'+showPurchaceContrller.list!.data2[index].carType,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                                Divider(color: Colors.black,
                                thickness: 10),
                                Text("modelName:"+showPurchaceContrller.list!.data2[index].modelName,style: TextStyle(color: Colors.white,fontSize: 15,),),
                                Text("price:"+showPurchaceContrller.list!.data2[index].price,style: TextStyle(color: Colors.white,fontSize: 15),),
                                Text("manufactorYear:"+showPurchaceContrller.list!.data2[index].manufactorYear,style: TextStyle(color: Colors.white,fontSize: 15,),),

                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: GestureDetector(
                              child: Icon(
                                Icons.info,
                                size: 40,

                                color: Colors.white,
                              ),
                              onTap: () {
                                _detialsContrller.Detials(_detialsContrller.list!.data2[index].id);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          )
        )

      ],
    );
  }
}
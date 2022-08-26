import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/admin/all_drivers_controller.dart';
import 'package:flutter_maps/admin/screens/home.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';

import '../constant.dart';
import '../add_drivers/adddriver.dart';
import 'components/side_menu.dart';

class AllDrrivers extends StatefulWidget {
  const AllDrrivers({Key? key}) : super(key: key);

  @override
  State<AllDrrivers> createState() => _AllDrriversState();
}

class _AllDrriversState extends State<AllDrrivers> {
  final navigationKey=GlobalKey<CurvedNavigationBarState>();
  var index=1;

  @override
  void initState(){
    super.initState();
  }

  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    final screen=[
      AddDriver(),
      Home(),
    ];
    final items=<Widget>[
      Icon(Icons.add,color: Colors.white,),
      Icon(Icons.home,color: Colors.white,),
    ];

    return Scaffold(
      body:screen[index],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(color: Colors.white)
          ),
        child:CurvedNavigationBar(
          color: HexColor('#19267E'),
        buttonBackgroundColor: HexColor('#19267E'),
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          height: 60,
        items: items,
        index:index,
        onTap: (index)=>setState(() =>this.index=index),
    ),
        ),
    );
  }
}

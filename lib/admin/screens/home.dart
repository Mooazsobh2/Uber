import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/admin/add_drivers/updatedriver.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';

import '../all_drivers_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AllDriversControllers allDriversControllers=Get.put(AllDriversControllers());
UpdateController updateController=Get.put(UpdateController());



void initState(){

  super.initState();
}
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: 130,
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
                  height: 30,
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
                  top:60 ,
                  left: 20,
                  child: Text(
                    "All Drivers",style: TextStyle(fontSize: 30,color: HexColor("0C72B0"),fontWeight: FontWeight.bold),
                  )),

            ],
          ) ,
        ),
        SizedBox(
          height: height*0.005,
        ),

        Expanded(
          child:Obx(() => allDriversControllers.isLoading.value?Center(
            child: CircularProgressIndicator(),
          ):RefreshIndicator(child: ListView.builder(
            itemCount:allDriversControllers.list!.data.length,
            itemBuilder: (context, index){
              return Container(
                margin:EdgeInsets.only(bottom: 10,top: 25),
                padding: EdgeInsets.only(left: 20,right: 20, bottom: 20),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: HexColor("0C72B0"),
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
                    left: 5,
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
                              backgroundImage: AssetImage('assets/images/driver1.jpg'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(

                              children: [
                                Text(allDriversControllers.list!.data[index].name,style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                                Divider(color: Colors.white,
                                    thickness: 10),
                                Text(allDriversControllers.list!.data[index].phoneNumber,style: TextStyle(color: Colors.white,fontSize: 15,),),
                                Text(allDriversControllers.list!.data[index].email,style: TextStyle(color: Colors.white,fontSize: 15),),
                                // Text(allDriversControllers.list!.data[index].password,style: TextStyle(color: Colors.white,fontSize: 15,),),

                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:15),
                                child: GestureDetector(
                                  child: Icon(
                                    Icons.edit,
                                    size: 40,

                                    color: HexColor('#19267E'),
                                  ),
                                  onTap: () {
                                    _buildAddEditEmployeeView(
                                        text: "update",
                                        addEditFlag: 2,
                                        docId:allDriversControllers.list!.data[index].id,
                                        driver_id: allDriversControllers.list!.data[index].driverId
                                    );
                                    // displayDeleteDialog(allDriversControllers.list!.data[index].id);
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:15),
                                child: GestureDetector(
                                  child: Icon(
                                    Icons.delete,
                                    size: 40,

                                    color: HexColor('#19267E'),
                                  ),
                                  onTap: () {
                                    displayDeleteDialog(allDriversControllers.list!.data[index].id,allDriversControllers.list!.data[index].driverId);
                                  },
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
              onRefresh: (){
                setState(() {});
            return allDriversControllers.fechAllDrivers();


              })
          ),
        )

      ],
    );
  }

  displayDeleteDialog(var id,var driver_id) {
    Get.defaultDialog(
      title: "Delete Driver",
      titleStyle: TextStyle(fontSize: 20),
      middleText: 'Are you sure to Delete Driver ?',
      textCancel: "Cancel",
      textConfirm: "Confirm",
      confirmTextColor: Colors.white,
      onCancel: () {},
      onConfirm: () {
        allDriversControllers.DeleteDrivers(id,driver_id);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Home()),
              (Route<dynamic> route) => false,
        );
        Get.back();
      },
    );
  }
  _buildAddEditEmployeeView({String? text, int? addEditFlag, int? docId,required int driver_id}) {
    Get.bottomSheet(

      Container(
        decoration: BoxDecoration(

          borderRadius: BorderRadius.only(
            topRight: Radius.circular(26),
            topLeft: Radius.circular(26),
          ),
          color: HexColor("0C72B7"),
        ),
        child: Padding(
          padding:
          const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${text} Employee',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: updateController.EditnameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      hintStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),

                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: updateController.EditemailController,
                    decoration: InputDecoration(

                      hintText: 'email',
                      hintStyle: TextStyle(color: Colors.white),

                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: updateController.Editphone_number,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'phoneNumber',
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),

                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: Get.context!.width, height: 45),
                    child: ElevatedButton(
                      child: Text(
                        text!,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: () {
                        updateController.onClickUpdate(docId!,driver_id);

                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}

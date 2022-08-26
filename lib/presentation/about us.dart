import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About_Us extends StatelessWidget {
  const About_Us({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Taxi Driver System (City Cab)",style: TextStyle(
            color: Colors.redAccent,
            fontWeight: FontWeight.bold,
          fontSize: 30,
        ),),
SizedBox(height: 20,),
        Text("Developers...",style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),),
        SizedBox(height: 20,),


        Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.redAccent,
                        radius: 40,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage('assets/images/mooaz.jpg'),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Text('Mooaz Al \n  Sobh'),
                      onTap:()=>launch('https://www.facebook.com/mooadal.soph/'),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 40,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage('assets/images/hanaa.jpg'),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Text('Hanaa AL\n  Hoshan'),
                      onTap:()=>launch('https://www.facebook.com/hanaa.sy.16'),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 40,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage('assets/images/kenana.jpg'),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Text('Kenana Al\n  Ghazali'),
                      onTap:()=>launch('https://www.facebook.com/kenana.alghazali.5'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

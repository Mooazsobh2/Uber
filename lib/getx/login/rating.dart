import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingDialog extends StatefulWidget {
  const RatingDialog({Key? key}) : super(key: key);

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  @override
  var _ratingpageController=PageController();
  var _starPosition=200.0;
  var _rating=0;
  var _selectedIndex=-1;
  var _ismoreditaleAccess=false;
  var _moreDiatelsFocse=FocusNode();
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24)
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Container(

            height: max(100, MediaQuery.of(context).size.height*0.3),
            child: PageView(
              controller: _ratingpageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildThanksRating(),
                _causOfRating(),
              ],
            ),
          ),
    // Positioned(
    // bottom: 0,
    // left: 0,
    // right: 0,
    // // child: Container(
    // //
    // // color: Colors.red,
    // // child: MaterialButton(
    // // onPressed: (){},
    // // child:Text('Done'),
    // // textColor: Colors.white,
    // // ),
    // // )
    // ),
    Positioned(right: 0,
    child: MaterialButton(
    onPressed:(){},
    ),),
    Padding(
      padding: const EdgeInsets.only(top: 10),
      child: AnimatedPositioned(
      top: _starPosition,
      right: 0,
      left: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) => IconButton(

      onPressed: () {
        print(">>>>>>>>>>>>>>>>${index+1}");
      setState((){

        _ratingpageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeIn);
      _starPosition=20.0;
      _rating=index+1;
      });
      },
      icon: index < _rating?Icon(Icons.star,size: 32,):Icon(Icons.star_border,size: 32,),
      color: Colors.red,
      )
      )
      ),
      duration: Duration(milliseconds: 300)),
    ),
          if(_ismoreditaleAccess)
          Positioned(
              child: MaterialButton(
                onPressed: (){
                  setState((){
                    _ismoreditaleAccess=false;
                  });
                },
              child:Icon(Icons.arrow_back_ios)
                ,))
        ],
      ),
    );

  }

 _causOfRating() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: !_ismoreditaleAccess,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  spacing: 8.0,
                  alignment: WrapAlignment.center,
                  children: List.generate(
                      0,
                          (index) =>InkWell(
                            onTap: (){
                              setState((){
                                _selectedIndex=index;
                              });
                            },
                            child: Chip(

                              // backgroundColor: _selectedIndex==index?Colors.red:Colors.grey[200],
                              label: Text(""),
                            ),
                  )),
                ),
                SizedBox(height: 1,),
                InkWell(
                  onTap: (){
                    _moreDiatelsFocse.requestFocus();
                    setState((){
                      _ismoreditaleAccess=true;
                    });
                  },

                )
              ],
            ),
            replacement: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Tell us more"),
                Chip(label: Text("Text ${_selectedIndex +1}")),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    focusNode: _moreDiatelsFocse,
                    decoration: InputDecoration(
                      hintText: "write your review here....",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],

                      ),
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
        )
      ],
    );

  }

  _buildThanksRating (){
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment:MainAxisAlignment.center,
    children: [
         Text(
          "Thanks for riding on Bus on Demand",
           style: TextStyle(
             fontSize: 24,
             color: Colors.red,
             fontWeight: FontWeight.bold,
           ),
           textAlign: TextAlign.center,
        ),
      Text("we\'d love to get feedback"),
      Text("How was your Ride Today?"),
    ],
  );
  }
  // _hideDialog(){
  //   if(Navigator.canPop(context)) Navigator.pop(context);
  // }
}


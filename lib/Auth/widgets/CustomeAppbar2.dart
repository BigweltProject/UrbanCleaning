import 'package:flutter/material.dart';
import 'package:maxeyfresh/General/AppConstant.dart';
import 'package:maxeyfresh/screen/AddAddress.dart';

import '../signup.dart';

class CustomAppBar2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        height: height/10,
        width: width,
        padding: EdgeInsets.only(left: 15, top: 25),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors:[AppColors.boxColor1, AppColors.boxColor2]
          ),
        ),
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.close_rounded,),
                onPressed: (){
                  print("pop");

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen()),);

                })
          ],
        ),
      ),
    );
  }
}
class CustomAppBar3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        height: height/10,
        width: width,
        padding: EdgeInsets.only(left: 15, top: 25),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors:[AppColors.boxColor1, AppColors.boxColor2]
          ),
        ),
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.close_rounded,),
                onPressed: (){
                  print("pop");

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddAddress("0")),);

                })
          ],
        ),
      ),
    );
  }
}

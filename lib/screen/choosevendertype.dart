import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maxeyfresh/General/AppConstant.dart';
import 'package:maxeyfresh/General/Home.dart';
import 'package:maxeyfresh/model/RegisterModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class SelectButton extends StatefulWidget {
  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectButton> {
  final pincodeController = TextEditingController();

  SharedPreferences pref;
  void setcity() async {
    pref= await SharedPreferences.getInstance();

      // Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp1()),);


    // snapshot.data[index].loc_id


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setcity();
  }
  bool flag= false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // onWillPop: () async {
      //   showDialog<bool>(
      //       context: context,
      //       builder: (c) => AlertDialog(
      //         title: Text('Warning'),
      //         content: Text('Do you really want to exit'),
      //         actions: [
      //           FlatButton(
      //             child: Text('Yes'),
      //             onPressed: () => {
      //               exit(0),
      //             },
      //           ),
      //           FlatButton(
      //             child: Text('No'),
      //             onPressed: () => Navigator.pop(c, false),
      //           ),
      //         ],
      //       ));
      // },
      child: Scaffold(
        // backgroundColor: AppColors.tela1,
        appBar: AppBar(
          backgroundColor: AppColors.tela,
          // leading: Padding(padding: EdgeInsets.only(left: 0.0),
          //     child:InkWell(
          //       onTap: (){
          //         if (Navigator.canPop(context)) {
          //           Navigator.pop(context);
          //         } else {
          //           SystemNavigator.pop();
          //         }
          //       },
          //
          //       child: Icon(
          //         Icons.arrow_back,size: 30,
          //         color: Colors.white,
          //       ),
          //
          //     )
          // ),


          actions: <Widget>[

          ],
          title:Text("CHOOSE VENDER TYPE",

              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold)),),

        body: Container(
          margin: EdgeInsets.only(top:MediaQuery.of(context).size.height/4 ),
          // color:  AppColors.tela1,
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          child: Column(

            children: [

              // Constant.cityid==null?Container(
              //   child: Text("Yout have not selected any location ${ Constant.pinid}")
              // ): Constant.cityid.length>0?Container(
              //   child: Text("Yout selected location is ${ Constant.pinid}"),
              // ):Container(
              //   child: Text("Yout have not selected any location ${ Constant.pinid}"),
              // ),
              SizedBox(height: 20,),

              RaisedButton(
                onPressed: () {
                  setState(() {
                    flag=true;
                  });

                },
                color: AppColors.tela,
                padding: EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Text(
                  "One Day Delivery",style: TextStyle(color: AppColors.white),

                ),
              ),
              SizedBox(height: 10,),
             flag? Container(
                margin: EdgeInsets.only(left: 20),

                width: MediaQuery.of(context).size.width/2+100,
                child:  TextFormField(
                  controller:pincodeController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,
                    new LengthLimitingTextInputFormatter(6),],
                  validator: (String value){
                    if(value.isEmpty){
                      return " Please enter the pincode";
                    }
                  },
                  decoration: const InputDecoration(
                      hintText: "Enter Pin Code"),
                ),
              ):Row(),





              flag? Container(
                margin: EdgeInsets.only( right: 30,),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    RaisedButton(
                      onPressed: () {
                        _gefreedelivery(pincodeController.text);

                      },
                      color: AppColors.tela,
                      padding: EdgeInsets.only(top: 12, left: 10, right: 10, bottom: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: Text(
                          "Search ",style: TextStyle(color: AppColors.white)
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp1()),);
                      ),
                    ),


                  ],
                ),
              ):Row(),
              SizedBox(height: 30,),


              RaisedButton(
                onPressed: () {
                  setState(() {
                    flag=false;
                    pref.setString("cityid","");
                    Constant.cityid="";
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp1()),);

                  });

                },
                color: AppColors.tela1,
                padding: EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Text(
                  "Normal Delivery",style: TextStyle(color: AppColors.black)

                ),
              ),
            ],
          )



          ,
        ),

      ),
    );
  }



  Future<void> _gefreedelivery(String id) async {
    // print(Constant.base_url+'searchLoc.php?shop_id='+Constant.Shop_id+"&loc="+id);


    final response = await http.get(Constant.base_url+'api/searchLoc.php?shop_id='+Constant.Shop_id+"&loc="+id);

    if (response.statusCode == 200) {

      final jsonBody = json.decode(response.body);
      print(jsonBody["loc"]);

      RegisterModel user = RegisterModel.fromJson(jsonDecode(response.body));
      if(user.success=="false")
        {
       showLongToast(user.message);
        }
      else{
        setState(() {
          String idval=jsonBody["loc"].toString();
          // print(id);
          pref.setString("cityid", idval);
          pref.setString("pin", id);
          Constant.cityid=idval;
          // print(Constant.cityid);
          Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp1()),);

        });

      }




    } else
      throw Exception("Unable to generate Employee Invoice");
//    print("123  Unable to generate Employee Invoice");

  }

}

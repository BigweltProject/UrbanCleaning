import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maxeyfresh/model/CategaryModal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constant {
  static String appname = "Urban Cleaning Services";
  static const String base_url = "http://urbancleaningservices.w4u.in/";
  static const String packageName = "com.urbancleaningservices";
  static const String API_KEY = "F6V8B73XPHASTWQKJ9MLZDGNRCUY24E5";
  static const String Shop_id = "4662";
  static const String registration = "user.php";
  static const String post = "post.php";
  static const String Subscription = "subscription.php";
  static const String postvalue = "post.php?key=1234&action=add";
  static bool isLogin = false;
  static String logo_Image_mv = base_url + "manage/uploads/mv_list/";
  static String logo_Image_cat = base_url + "manage/uploads/mv_cats/";

  static String Base_Imageurl = base_url + "manage/uploads/gallery/5/";
  static String Product_Imageurl = base_url + "manage/uploads/gallery/3/";
  static String Product_Imageurl2 = base_url + "manage/uploads/gallery/";
  static String Product_Imageurl1 = base_url + "manage/uploads/gallery/1/";
  static String Product_Imageurl5 = base_url + "manage/uploads/gallery/5/";
  static String AppName_showon_Homescreen = "Category";
  static String AppName_showon_Homescreen1 = "Creation";
  static String AProduct_type_Name1 = "TRENDING";
  static String AProduct_type_Name2 = "NEW ARRIAVAL";
  static String my_Order = "My Bookings";
  static String Shipping_add = "Shipping addresses";
  static String My_Review = "My review";
  static int val = 0;
  static String rad = "20";

  static String cityid = "";
  static String pinid = "";
  static String citname = "";
  static bool Checkupdate = false;
  static String contact = "1234567891";

  static double latitude = 0.0;
  static double longitude = 0.0;
  static String User_ID = "";
  static bool check = false;
  static String Mobile = "";
  static String username = " ";
  static String email11 = "maxeyfresh@Royalwelttechnologies.Com";
  static String name = " ";
  static String user_id = " ";
  static String email = " ";
  static String image = "";
  static String phone = "tel: 9632114648";
  final String SIGN_IN = 'signin';
  final String SIGN_UP = 'signup';
  static int itemcount = 0;
  static int wishlist = 0;
  static int carditemCount = 0;
  static double totalAmount = 0;
  static double shipingAmount = 0;
  static List<Categary> list = List();

  static Widget setvalue() {}
}

class AppColors {
  static const red = Color(0xFFE3F2FD);
  static const black = Color(0xFF222222);
  static const bgColor = Color(0xFFF4F4F4);
  static const blackdrawer = Color(0xFF222222);
  static const product_title_name = Color(0xFF222222);
  static const App_H_name = Color(0xFF222222);
  static const Appname = Color(0xFFFFFFFF);

  static const tela = Color(0xFF09ba1a);
  static const tela1 = Color(0xFFFFCDD2);
  static const teladep = Color(0xFF222222);
  static const telamoredeep = Color(0xFF40C4FF);
  static const onselectedBottomicon = Color(0xFFFFEB3B);
  static const homeiconcolor = Color(0xFFFF8F00);
  static const category_button_Icon_color = Color(0xFFFF8F00);
  static const categoryicon = Color(0xFF00BCD4);
  static const carticon = Color(0xFFFF80AB);
  static const lightGray = Color(0xFF9B9B9B);
  static const darkGray = Color(0xFF979797);
  static const mrp = Color(0xFF979797);
  static const sellp = Color(0xFF2AA952);
  static const white = Color(0xFFFFFFFF);
  static const button_text_color = Color(0xFF607D8B);
  static const success = Color(0xFF2AA952);
  static const green = Color(0xFF2AA952);
  static const pink = Color(0xFFFF4081);
  static const boxColor1 = Color(0xFF1E88E5);
  static const boxColor2 = Color(0xFFBBDEFB);
  static const checkoup_paybuttoncolor = Color(0xFF40C4FF);
}

Widget showCircle() {
  return Align(
    alignment: Alignment.center,
    child: Padding(
      padding: EdgeInsets.only(left: 15, bottom: 18),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.telamoredeep,
          // color: Colors.blue,
        ),
        child: Text('${Constant.carditemCount}',
            style: TextStyle(color: Colors.white, fontSize: 15.0)),
      ),
    ),
  );
}

Widget showLongToast(String s) {
  Fluttertoast.showToast(
    msg: s,
    toastLength: Toast.LENGTH_LONG,
  );
}

Future cartItemcount(int val) async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  pref.setInt("itemCount", val);
  print(val.toString() + "shair....");
}

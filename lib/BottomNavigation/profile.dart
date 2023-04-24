

import 'package:flutter/material.dart';
import 'package:maxeyfresh/Auth/forgetPassword.dart';
import 'package:maxeyfresh/Auth/signin.dart';
import 'package:maxeyfresh/General/AppConstant.dart';
import 'package:maxeyfresh/WebView.dart/webclass.dart';
import 'package:maxeyfresh/fadeanimation/animation.dart';
import 'package:maxeyfresh/screen/MyReview.dart';
import 'package:maxeyfresh/screen/ShowAddress.dart';
import 'package:maxeyfresh/screen/Wallettransaction.dart';
import 'package:maxeyfresh/screen/editprofile.dart';
import 'package:maxeyfresh/screen/myorder.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  final Function changeView;

  const ProfileView({Key key, this.changeView}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String name = "";
  String image;
  String email = "";
  String user_id = "";
  bool isloginv = false;
  void gatinfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    isloginv = pref.get("isLogin");
    name = pref.get("name");
    email = pref.get("email");
    String image = pref.get("pp");
    String userid = pref.get("user_id");
    if (isloginv == null) {
      isloginv = false;
    }

    setState(() {
      user_id = userid;
      Constant.name = name;
      Constant.email = email;
      Constant.isLogin = isloginv;
      Constant.User_ID = userid;
      Constant.image = image;
      // print( "image " +Constant.image);

      // print(Constant.image.length);
      // print(Constant.name.length);
      // print("Constant.name");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Constant.isLogin = false;

    gatinfo();
  }

  @override
  Widget build(BuildContext context) {
    print("Constant.check");
    print(Constant.check);
    if (Constant.check) {
      gatinfo();
      setState(() {
        Constant.check = false;
      });
    }
    //
    return Container(
      color: AppColors.tela,
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: AppColors.tela,
          //   automaticallyImplyLeading: false,
          //   elevation: 0,
          // ),
          // backgroundColor: Colors.grey[300],
          body: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: AppColors.tela,
                    height: 240,
                    //color: AppColors.tela1,
                    child: Column(children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.only(top: 50),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: AppColors.white,
                            child: ClipOval(
                              child: new SizedBox(
                                width: 120.0,
                                height: 120.0,
                                child: Constant.image == null
                                    ? Image.asset(
                                        'assets/images/logo.png',
                                      )
                                    : Constant.image ==
                                            'https://www.bigwelt.com/manage/uploads/customers/nopp.png'
                                        ? Image.asset(
                                            'assets/images/logo.png',
                                          )
                                        : Image.network(Constant.image,
                                            fit: BoxFit.fill),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          Constant.name == null
                              ? "Hello Guest"
                              : Constant.name.length == 1
                                  ? "Hello Guest"
                                  : Constant.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Constant.isLogin
                          ? Text(
                              Constant.email == null ? " " : Constant.email,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          : InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgetPass()),
                                );
                              },
                              child: Padding(
                                  padding: EdgeInsets.only(left: 6),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color:Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                            ),
                    ]),
                  ),

                  ///---------------------------------------------------profile items----------------------------------
                  SizedBox(
                    height: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.only(left: 15, bottom: 10),
                          //   child: Text(
                          //     "Account Overview",
                          //     style: TextStyle(
                          //       color: AppColors.black,
                          //       fontSize: 15,
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   ),
                          // ),
                          FadeAnimation(
                            0.3,
                            Container(
                              height:90,
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {
                                  if (Constant.isLogin) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TrackOrder()),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignInPage()),
                                    );
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color:
                                              AppColors.tela.withOpacity(0.2),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.ac_unit,
                                          color: AppColors.tela,
                                          size: 15.0,
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        "My Bookings",
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.black,
                                        size: 20.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Container(
                            height: 2,
                            color: Colors.grey.withOpacity(0.2),
                          ),

                          ///------------------------------------------shipping address------------------------------------------------

                          FadeAnimation(
                            0.3,
                            Container(
                              height:90,
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {
                                  if (Constant.isLogin) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ShowAddress("1")),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignInPage()),
                                    );
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color:
                                              AppColors.tela.withOpacity(0.2),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.location_on_outlined,
                                          color: AppColors.tela,
                                          size: 15.0,
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        "My Address",
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.black,
                                        size: 20.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 2,
                            color: Colors.grey.withOpacity(0.2),
                          ),

                          ///-------------------------------my walet----------------------------------------------------
                          // FadeAnimation(
                          //   0.3,
                          //   Container(
                          //     height:90,
                          //     color: Colors.white,
                          //     child: InkWell(
                          //       onTap: () {
                          //         if (Constant.isLogin) {
                          //           Navigator.push(
                          //             context,
                          //             MaterialPageRoute(
                          //                 builder: (context) => WalltReport()),
                          //           );
                          //         } else {
                          //           Navigator.push(
                          //             context,
                          //             MaterialPageRoute(
                          //                 builder: (context) => SignInPage()),
                          //           );
                          //         }
                          //       },
                          //       child: Padding(
                          //         padding: const EdgeInsets.only(
                          //             left: 20, right: 20),
                          //         child: Row(
                          //           mainAxisAlignment:
                          //               MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             Container(
                          //               height: 35,
                          //               width: 35,
                          //               decoration: BoxDecoration(
                          //                 color:
                          //                     AppColors.tela.withOpacity(0.2),
                          //                 borderRadius: BorderRadius.all(
                          //                   Radius.circular(15),
                          //                 ),
                          //               ),
                          //               child: Icon(
                          //                 Icons.account_balance_wallet_outlined,
                          //                 color: AppColors.tela,
                          //                 size: 15.0,
                          //               ),
                          //             ),
                          //             SizedBox(width: 20),
                          //             Text(
                          //               "Wallet",
                          //               style: TextStyle(
                          //                 color: AppColors.black,
                          //                 fontSize: 15,
                          //                 fontWeight: FontWeight.bold,
                          //               ),
                          //             ),
                          //             Spacer(),
                          //             Icon(
                          //               Icons.arrow_forward_ios_rounded,
                          //               color: Colors.black,
                          //               size: 20.0,
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Container(
                          //   height: 2,
                          //   color: Colors.grey.withOpacity(0.2),
                          // ),

                          ///-------------------------------------------------------my review------------------------------------------->>
                          FadeAnimation(
                            0.3,
                            Container(
                              height:90,
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {
                                  if (Constant.isLogin) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyReview()),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignInPage()),
                                    );
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color:
                                              AppColors.tela.withOpacity(0.2),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.reviews,
                                          color:
                                              AppColors.tela.withOpacity(0.8),
                                          size: 15.0,
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        "My review ",
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.black,
                                        size: 20.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 2,
                            color: Colors.grey.withOpacity(0.2),
                          ),

                          ///------------------------------------------------update password-------------------------------------->>>
                          FadeAnimation(
                            0.3,
                            Container(
                              height:90,
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {
                                  if (Constant.isLogin) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ForgetPass()),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignInPage()),
                                    );
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color:
                                              AppColors.tela.withOpacity(0.2),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.password_outlined,
                                          color: AppColors.tela,
                                          size: 15.0,
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        "Change Password",
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.black,
                                        size: 20.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 2,
                            color: Colors.grey.withOpacity(0.2),
                          ),

                          /// --------------------------------------------edit profile-------------------------------->>
                          FadeAnimation(
                            0.3,
                            Container(
                              height:90,
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {
                                  if (Constant.isLogin) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditProfilePage(user_id)),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignInPage()),
                                    );
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color:
                                              AppColors.tela.withOpacity(0.2),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.edit_outlined,
                                          color: AppColors.tela,
                                          size: 15.0,
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        "Update profile ",
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.black,
                                        size: 20.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 2,
                            color: Colors.grey.withOpacity(0.2),
                          ),

                          ///--------------------------------------------About Us--------------------------------------
                          // FadeAnimation(
                          //   0.3,
                          //   Container(
                          //     height:90,
                          //     color: Colors.white,
                          //     child: InkWell(
                          //       onTap: () {
                          //         if (Constant.isLogin) {
                          //           Navigator.push(
                          //             context,
                          //             MaterialPageRoute(
                          //               builder: (context) => WebViewClass(
                          //                 "About Us",
                          //                 "${Constant.base_url}/about",
                          //               ),
                          //             ),
                          //           );
                          //         } else {
                          //           Navigator.push(
                          //             context,
                          //             MaterialPageRoute(
                          //                 builder: (context) => SignInPage()),
                          //           );
                          //         }
                          //       },
                          //       child: Padding(
                          //         padding: const EdgeInsets.only(
                          //             left: 20, right: 20),
                          //         child: Row(
                          //           mainAxisAlignment:
                          //               MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             Container(
                          //               height: 35,
                          //               width: 35,
                          //               decoration: BoxDecoration(
                          //                 color:
                          //                     AppColors.tela.withOpacity(0.2),
                          //                 borderRadius: BorderRadius.all(
                          //                   Radius.circular(15),
                          //                 ),
                          //               ),
                          //               child: Icon(
                          //                 Icons.info,
                          //                 color: AppColors.tela,
                          //                 size: 15.0,
                          //               ),
                          //             ),
                          //             SizedBox(width: 20),
                          //             Text(
                          //               "About Us ",
                          //               style: TextStyle(
                          //                 color: AppColors.black,
                          //                 fontSize: 15,
                          //                 fontWeight: FontWeight.bold,
                          //               ),
                          //             ),
                          //             Spacer(),
                          //             Icon(
                          //               Icons.arrow_forward_ios_rounded,
                          //               color: Colors.black,
                          //               size: 20.0,
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          
                          // Container(
                          //   height: 2,
                          //   color: Colors.grey.withOpacity(0.2),
                          // ),

   ///-----------------------------------------Contact us--------------------------
                        //  FadeAnimation(
                        //     0.3,
                        //     Container(
                        //       height:90,
                        //       color: Colors.white,
                        //       child: InkWell(
                        //         onTap: () {
                        //           if (Constant.isLogin) {
                                   
                        //            _shairApp();


                        //           } else {
                        //             Navigator.push(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (context) => SignInPage()),
                        //             );
                        //           }
                        //         },
                        //         child: Padding(
                        //           padding: const EdgeInsets.only(
                        //               left: 20, right: 20),
                        //           child: Row(
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceBetween,
                        //             children: [
                        //               Container(
                        //                 height: 35,
                        //                 width: 35,
                        //                 decoration: BoxDecoration(
                        //                   color:
                        //                       AppColors.tela.withOpacity(0.2),
                        //                   borderRadius: BorderRadius.all(
                        //                     Radius.circular(15),
                        //                   ),
                        //                 ),
                        //                 child: Icon(
                        //                   Icons.contact_support,
                        //                   color: AppColors.tela,
                        //                   size: 15.0,
                        //                 ),
                        //               ),
                        //               SizedBox(width: 20),
                        //               Text(
                        //                 "Refer",
                        //                 style: TextStyle(
                        //                   color: AppColors.black,
                        //                   fontSize: 15,
                        //                   fontWeight: FontWeight.bold,
                        //                 ),
                        //               ),
                        //               Spacer(),
                        //               Icon(
                        //                 Icons.arrow_forward_ios_rounded,
                        //                 color: Colors.black,
                        //                 size: 20.0,
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        
                        
                        
                        
                        //  Container(
                        //     height: 2,
                        //     color: Colors.grey.withOpacity(0.2),
                        //   ),
  ///-------------------------------------------------LogOut------------------------------                        
                          Constant.isLogin
                              ? FadeAnimation(
                                  0.3,
                                  Container(
                                    height:90,
                                    color: Colors.white,
                                    child: InkWell(
                                      onTap: () {
                                        _callLogoutData();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                color: AppColors.tela
                                                    .withOpacity(0.2),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.logout_outlined,
                                                color: AppColors.tela,
                                                size: 15.0,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Text(
                                              "Log out",
                                              style: TextStyle(
                                                color: AppColors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: Colors.black,
                                              size: 20.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : FadeAnimation(
                                  0.3,
                                  Container(
                                    height:90,
                                    color: Colors.white,
                                    child: InkWell(
                                      onTap: () {
                                        if (Constant.isLogin) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignInPage()),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignInPage()),
                                          );
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                color: AppColors.tela
                                                    .withOpacity(0.2),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.login_outlined,
                                                color: AppColors.tela,
                                                size: 15.0,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Text(
                                              "Log in",
                                              style: TextStyle(
                                                color: AppColors.black,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: Colors.black,
                                              size: 20.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ]),
                  ),

                  ///----------------------------------------------------------------------------
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _callLogoutData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Constant.isLogin = false;
    Constant.email = " ";
    Constant.name = " ";
    Constant.image = " ";

    pref.setString("pp", " ");
    pref.setString("email", " ");
    pref.setString("name", " ");
    pref.setBool("isLogin", false);
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => SignInPage()));
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SignInPage()),
        (route) => false);
  }
}

_shairApp() {
    Share.share("Hi, Looking for best deals online? Download " +
        Constant.appname +
        " app form click on this link  https://play.google.com/store/apps/details?id=${Constant.packageName}");
  }
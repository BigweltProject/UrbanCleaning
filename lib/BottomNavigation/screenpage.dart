// import 'dart:convert';
// import 'dart:math';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:geocoder/geocoder.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:maxeyfresh/General/AnimatedSplashScreen.dart';
// import 'package:maxeyfresh/General/AppConstant.dart';
// import 'package:maxeyfresh/General/Home.dart';
// import 'package:maxeyfresh/dbhelper/CarrtDbhelper.dart';

// import 'package:maxeyfresh/dbhelper/database_helper.dart';
// import 'package:maxeyfresh/model/CategaryModal.dart';
// import 'package:maxeyfresh/model/CoupanModel.dart';
// import 'package:maxeyfresh/model/Gallerymodel.dart';
// import 'package:maxeyfresh/model/ListModel.dart';
// import 'package:maxeyfresh/model/productmodel.dart';
// import 'package:maxeyfresh/model/promotion_banner.dart';
// import 'package:maxeyfresh/model/slidermodal.dart';
// import 'package:maxeyfresh/model/vendor_details.dart';
// import 'package:maxeyfresh/screen/MvProduct.dart';
// import 'package:maxeyfresh/screen/SearchScreen.dart';
// import 'package:maxeyfresh/screen/detailpage1.dart';
// import 'package:maxeyfresh/screen/secondtabview.dart';
// import 'package:maxeyfresh/screen/vendors_by_cat.dart';
// import 'package:new_version/new_version.dart';
// import 'package:share/share.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:http/http.dart' as http;

// class Screen extends StatefulWidget {
//   @override
//   ScreenState createState() => ScreenState();
// }

// // com.willyoudateme
// class ScreenState extends State<Screen> {
//   static int cartvalue = 0;

//   bool progressbar = true;

//   getPackageInfo() async {
//     NewVersion newVersion = NewVersion(context: context);
//     final status = await newVersion.getVersionStatus();
//     // status.canUpdate; // (true)
//     // status.localVersion ;// (1.2.1)
//     // status.storeVersion; // (1.2.3)
//     // status.appStoreLink;
//     newVersion.showAlertIfNecessary();
//     // print(status.canUpdate);
//     // print(status.localVersion);
//     // print(status.storeVersion);
//     // print(status.appStoreLink);
//   }

//   static List<String> imgList5 = [
//     'https://www.liveabout.com/thmb/y4jjlx2A6PVw_QYG4un_xJSFGBQ=/400x250/filters:no_upscale():max_bytes(150000):strip_icc()/asos-plus-size-maxi-dress-56e73ba73df78c5ba05773ab.jpg',
//   ];

//   final List<String> imgList1 = [
//     'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/9329399/2019/4/24/8df4ed41-1e43-4a0d-97fe-eb47edbdbacd1556086871124-Libas-Women-Kurtas-6161556086869769-1.jpg',
//   ];
//   int _current = 0;
//   var _start = 0;
//   List<Categary> list = new List<Categary>();
//   static List<Categary> list1 = new List<Categary>();
//   static List<Categary> list2 = new List<Categary>();
//   static List<Slider1> sliderlist = List<Slider1>();
//   static List<Slider1> sliderlist1 = List<Slider1>();
//   static List<ListModel> shoplist = List<ListModel>();
//   static List<ListModel> items = List<ListModel>();
//   List<Categary> subCatList = new List<Categary>();
//   List<Categary> subCatList1 = new List<Categary>();

//   static List<Products> topProducts = List();
//   static List<Products> dilofdayProducts = List();
//   List<Gallery> galiryImage = List();
//   final List<String> imgL = List();
//   final addController = TextEditingController();
//   VendorList vendorList = VendorList();
//   VendorList vendorList1 = VendorList();
//   PromotionBanner promotionBanner = PromotionBanner();

//   String lastversion = "0";
//   int valcgeck;
//   GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

//   bool _flexibleUpdateAvailable = false;
//   bool clicked = false;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsFlutterBinding.ensureInitialized();

//     if (Constant.Checkupdate) {
//       getPackageInfo();
//       Constant.Checkupdate = false;
//     }

//     if (SplashScreenState.listcat.length > 0) {
//       list.addAll(SplashScreenState.listcat);
//       // print("len----->${list.length}");
//     } else {
//       DatabaseHelper.getData("0").then((usersFromServe) {
//         print("screen1");
//         if (this.mounted) {
//           print("screen1");
//           setState(() {
//             list = usersFromServe;
//             // print("lem----->${list.length}");
//           });
//         }
//       });
//     }
//     getBanner().then((usersFromServe) {
//       if (this.mounted) {
//         setState(() {
//           sliderlist1 = usersFromServe;
//           // list = usersFromServe;
//         });
//       }
//     });

//     DatabaseHelper.getSlider().then((usersFromServe1) {
//       if (this.mounted) {
//         setState(() {
//           ScreenState.sliderlist = usersFromServe1;

//           ScreenState.imgList5.clear();
//           if (ScreenState.sliderlist.length > 0) {
//             for (var i = 0; i < ScreenState.sliderlist.length; i++) {
//               ScreenState.imgList5.add(ScreenState.sliderlist[i].img);
//             }
//           }
//         });
//       }
//     });
//     // getShopList("20").then((usersFromServe1) {
//     //   if (this.mounted) {
//     //     setState(() {
//     //       shoplist = usersFromServe1;
//     //       // print("sliderlist1.length");
//     //       // print(sliderlist1.length);
//     //     });
//     //   }
//     // });

// //
// //     DatabaseHelper.getTopProduct("top", "5").then((usersFromServe) {
// //       if (this.mounted) {
// //         setState(() {
// //           ScreenState.topProducts = usersFromServe;
// // //          ScreenState.topProducts.add(topProducts[0]);
// //
// //         });
// //       }
// //     });

// //    search
// //     DatabaseHelper.getTopProduct1("new", "10").then((usersFromServe) {
// //       if (this.mounted) {
// //         setState(() {
// //           ScreenState.dilofdayProducts = usersFromServe;
// //         });
// //       }
// //     });
//     init();
//   }

//   init() async {
//     if (SplashScreenState.listcat.length > 0) {
//       list.addAll(SplashScreenState.listcat);
//       // print("len----->${list.length}");
//     } else {
//       await DatabaseHelper.getData("0").then((usersFromServe) {
//         // print("screen1");
//         if (this.mounted) {
//           // print("screen1");
//           setState(() {
//             list = usersFromServe;
//             // print("lem----->${list.length}");
//           });
//         }
//       });
//     }

//     promotionBanner = await DatabaseHelper.getPromotionBanner();

//     await DatabaseHelper.getData1(list[0].pcatId.toString(), "API CALL 1")
//         .then((usersFromServe) {
//       // print("Helllllo");
//       if (this.mounted) {
//         setState(() {
//           subCatList = usersFromServe;
//           // print("sub----${subCatList.length}");
//           // print("isLoading---->${isLoading}");
//           // print(promotionBanner.path);
//           // print("sub----${subCatList.first.pCats}");
//         });
//       }
//     });

//     await DatabaseHelper.getData1(list[2].pcatId.toString(), "API CALL 1")
//         .then((usersFromServe) {
//       print("Helllllo");
//       if (this.mounted) {
//         setState(() {
//           subCatList1 = usersFromServe;
//           // print("sub----${subCatList1.length}");
//           isLoading = false;
//           // print("isLoading---->${isLoading}");
//           // print(promotionBanner.path);
//           // print("sub----${subCatList1.first.pCats}");
//         });
//       }
//     });
//   }

//   Position position;
//   void _getCurrentLocation() async {
//     Position res = await Geolocator.getCurrentPosition();
//     setState(() {
//       position = res;
//       Constant.latitude = position.latitude;
//       Constant.longitude = position.longitude;
//       print(' lat ${Constant.latitude},${Constant.longitude}');
//       getAddress1(Constant.latitude, Constant.longitude);
//     });
//   }

//   getAddress1(double lat, double long) async {
//     final coordinates = new Coordinates(lat, long);
//     var addresses =
//         await Geocoder.local.findAddressesFromCoordinates(coordinates);
//     var first = addresses.first;
//     setState(() {
//       var address = first.subLocality.toString() +
//           " " +
//           first.subAdminArea.toString() +
//           " " +
//           first.featureName.toString() +
//           " " +
//           first.thoroughfare.toString();

//       addController.text = address.replaceAll(
//         "null",
//         "",
//       );
//       // print('Rahul ${address}');
//       // pref.setString("lat", lat.toString());
//       // pref.setString("lat", lat.toString());
//       // pref.setString("add", address.toString().replaceAll("null", ""));
//     });
//     return Text(addController.text);
//   }

//   bool check = false;

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }

//   getMV(String catId) async {
//     String link =
//         "${Constant.base_url}/api/mv_list?shop_id=${Constant.Shop_id}&lat=${Constant.latitude}&lng=${Constant.longitude}&rad=&q=&mv_cat=${catId}";
//     var response = await http.get(link);

//     if (response.statusCode == 200) {
//       var responseData = jsonDecode(response.body);
//       setState(() {
//         vendorList = VendorList.fromJson(responseData);
//       });
//       // print("list1---->${vendorList.list.length}");
//       return VendorList.fromJson(responseData);
//     }
//   }

//   getMV1(String catId) async {
//     String link =
//         "${Constant.base_url}/api/mv_list?shop_id=${Constant.Shop_id}&lat=${Constant.latitude}&lng=${Constant.longitude}&rad=&q=&mv_cat=${catId}";
//     var response = await http.get(link);

//     if (response.statusCode == 200) {
//       var responseData = jsonDecode(response.body);
//       setState(() {
//         vendorList1 = VendorList.fromJson(responseData);
//       });
//       // print("list1---->${vendorList.list.length}");
//       return VendorList.fromJson(responseData);
//     }
//   }

//   Widget myContainer() {
//     return Container(
//       margin: EdgeInsets.only(right: 3),
//       height: 2,
//       width: 5,
//       color: AppColors.black,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
// //    showDilogue(context);
//     return isLoading
//         ? Container(
//             child: Center(
//               child: CircularProgressIndicator(
//                 color: AppColors.white,
//               ),
//             ),
//           )
//         : Container(
//             color: AppColors.white,
//             child: CustomScrollView(slivers: <Widget>[
//               SliverList(
//                 // Use a delegate to build items as they're scrolled on screen.
//                 delegate: SliverChildBuilderDelegate(
//                   // The builder function returns a ListTile with a title that
//                   // displays the index of the current item.
//                   (context, index) => Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Container(
//                         height: 50,
//                         margin: EdgeInsets.only(top: 40, right: 5),
//                         color: AppColors.white,
//                         child: GestureDetector(
//                           onTap: () {
//                             _getCurrentLocation();
//                             // Navigator.push(context, MaterialPageRoute(builder: (context) => UserFilterDemo()),);
//                           },
//                           child: Stack(
//                             children: [
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 margin: EdgeInsets.symmetric(
//                                     horizontal: 0, vertical: 0),
//                                 padding: EdgeInsets.only(top: 0, bottom: 0),
//                                 child: TextField(
//                                   controller: addController,
//                                   enabled: false,
//                                   style: TextStyle(fontSize: 12),
//                                   obscureText: false,
//                                   decoration: InputDecoration(
//                                     hintText: "Click here to get location",
//                                     border: InputBorder.none,
//                                     hintStyle: TextStyle(
//                                       fontSize: 12.0,
//                                       color: Colors.black,
//                                     ),
//                                     prefixIcon: Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 0, top: 10),
//                                       child: Icon(
//                                         Icons.location_on_outlined,
//                                         color: AppColors.black,
//                                         size: 22,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 margin: EdgeInsets.only(
//                                     left: 50, right: 2, top: 40),
//                                 child: Row(
//                                   children: [
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     myContainer(),
//                                     // myContainer(),
//                                     // myContainer(),
//                                     // myContainer(),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Container(
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => UserFilterDemo()));

//                             // Navigator.push(context, MaterialPageRoute(builder: (context) => UserVenderSerch()),);
//                             // showSearch(context: context, delegate: DataSerch(shoplist));
//                           },
//                           child: Container(
//                             height: 35,
//                             margin: EdgeInsets.symmetric(
//                                 horizontal: 5, vertical: 8),
//                             padding: EdgeInsets.only(top: 5, bottom: 0),
//                             decoration: BoxDecoration(
//                               border: Border.all(color: Colors.grey),
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             child: TextField(
//                               enabled: false,
//                               obscureText: false,
//                               decoration: InputDecoration(
//                                   hintText: "Search services ",
//                                   border: InputBorder.none,
//                                   hintStyle: TextStyle(
//                                     fontSize: 14.0,
//                                     color: Colors.grey,
//                                   ),
//                                   prefixIcon: Icon(
//                                     Icons.search,
//                                     color: Colors.grey,
//                                   )),
//                             ),
//                           ),
//                         ),
//                       ),
//                       sliderlist != null && sliderlist.length > 0
//                           ? Container(
//                               margin: EdgeInsets.only(
//                                 top: 10.0,
//                                 // left: 10.0,
//                                 // right: 10.0,
//                               ),
//                               // color: AppColors.white,
//                               height: 170.0,
//                               child: Container(
//                                   child: CarouselSlider.builder(
//                                 itemCount: sliderlist.length,
//                                 options: CarouselOptions(
//                                   aspectRatio: 3,
//                                   viewportFraction: 1.3,
//                                   enlargeCenterPage: false,
//                                 ),
//                                 itemBuilder: (ctx, index, realIdx) {
//                                   return Container(
//                                     width:
//                                         MediaQuery.of(context).size.width - 30,
//                                     height: 170,
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         if (!sliderlist[index].title.isEmpty) {
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) => Screen2(
//                                                     sliderlist[index].title,
//                                                     "")),
//                                           );
//                                         } else if (!sliderlist[index]
//                                             .description
//                                             .isEmpty) {
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     ProductDetails1(
//                                                         sliderlist[index]
//                                                             .description)),
//                                           );
// //

//                                         }
//                                       },
//                                       child: Container(
//                                           margin: EdgeInsets.only(
//                                               left: 5.0, right: 5),
//                                           child: ClipRRect(
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(8.0)),
//                                               child: sliderlist[index].img !=
//                                                       null
//                                                   ? Image.network(
//                                                       Constant.Base_Imageurl +
//                                                           sliderlist[index].img,
//                                                       fit: BoxFit.fill,
//                                                     )
//                                                   : Image.asset(
//                                                       "assests/images/logo.png",
//                                                       fit: BoxFit.fill)

//                                               // CachedNetworkImage(
//                                               //   width: MediaQuery.of(context).size.width-30,
//                                               //   fit: BoxFit.fill,
//                                               //   imageUrl: Constant.Base_Imageurl +
//                                               //       sliderlist[index].img,
//                                               //   placeholder: (context, url) =>
//                                               //       Center(
//                                               //           child:
//                                               //           CircularProgressIndicator()),
//                                               //   errorWidget:
//                                               //       (context, url, error) =>
//                                               //   new Icon(Icons.error),
//                                               //
//                                               // )

//                                               )),
//                                     ),
//                                   );
//                                 },
//                               )))
//                           : Row(),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         height: 15,
//                         width: MediaQuery.of(context).size.width,
//                         color: AppColors.bgColor,
//                       ),
//                       list.isNotEmpty || list != null
//                           ? ListView.builder(
//                               primary: false,
//                               physics: NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount: list.length ?? 0,
//                               itemBuilder: (context, index) {
//                                 print("Helloooo---> ");
//                                 return Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       height: 35,
//                                       child: Padding(
//                                         padding: const EdgeInsets.only(
//                                             left: 10, top: 10, bottom: 5),
//                                         child: Text(
//                                           list[index].pCats,
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                       ),
//                                     ),
//                                     list.isNotEmpty && list != null
//                                         ? FutureBuilder(
//                                             future: DatabaseHelper.getData1(
//                                                 list[index].pcatId,
//                                                 "API CALL 2"),
//                                             builder: (ctx, snapshot) {
//                                               return snapshot.hasData == true
//                                                   ? Container(
//                                                       height: 100,
//                                                       child: ListView.builder(
//                                                         itemCount: snapshot
//                                                                 .data.length ??
//                                                             0,
//                                                         scrollDirection:
//                                                             Axis.horizontal,
//                                                         shrinkWrap: true,
//                                                         primary: false,
//                                                         itemBuilder:
//                                                             (BuildContext
//                                                                     context,
//                                                                 int index) {
//                                                           return InkWell(
//                                                             onTap: () {
//                                                               Navigator.push(
//                                                                   context,
//                                                                   MaterialPageRoute(
//                                                                       builder: (context) => VendorsByCat(
//                                                                           snapshot
//                                                                               .data[
//                                                                                   index]
//                                                                               .pcatId,
//                                                                           snapshot
//                                                                               .data[index]
//                                                                               .pCats)));
//                                                             },
//                                                             child: Container(
//                                                               height: 100,
//                                                               width: 85,
//                                                               decoration:
//                                                                   BoxDecoration(
//                                                                       border:
//                                                                           Border(
//                                                                 right: BorderSide(
//                                                                     width: 3,
//                                                                     color: AppColors
//                                                                         .bgColor),
//                                                               )),
//                                                               child: Column(
//                                                                 children: [
//                                                                   SizedBox(
//                                                                     height: 10,
//                                                                   ),
//                                                                   Container(
//                                                                       height:
//                                                                           35,
//                                                                       width: 35,
//                                                                       child: snapshot
//                                                                               .data[
//                                                                                   index]
//                                                                               .img
//                                                                               .isEmpty
//                                                                           ? Image.asset(
//                                                                               'assets/images/logo.png')
//                                                                           : Image
//                                                                               .network(
//                                                                               Constant.base_url + "manage/uploads/mv_cats/" + snapshot.data[index].img,
//                                                                               fit: BoxFit.contain,
//                                                                             )),
//                                                                   Align(
//                                                                     alignment:
//                                                                         Alignment
//                                                                             .center,
//                                                                     child:
//                                                                         Container(
//                                                                       alignment:
//                                                                           Alignment
//                                                                               .center,
//                                                                       margin: EdgeInsets.only(
//                                                                           left:
//                                                                               10,
//                                                                           right:
//                                                                               10,
//                                                                           top:
//                                                                               10),
//                                                                       height:
//                                                                           30,
//                                                                       width:
//                                                                           110,
//                                                                       child:
//                                                                           Text(
//                                                                         snapshot
//                                                                             .data[index]
//                                                                             .pCats,
//                                                                         maxLines:
//                                                                             2,
//                                                                         style:
//                                                                             TextStyle(
//                                                                           fontWeight:
//                                                                               FontWeight.w600,
//                                                                           fontSize:
//                                                                               10,
//                                                                         ),
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           );
//                                                         },
//                                                       ),
//                                                     )
//                                                   : Container(
//                                                       child: Center(
//                                                         child:
//                                                             CircularProgressIndicator(),
//                                                       ),
//                                                     );
//                                             },
//                                           )
//                                         : Container(),
//                                     Container(
//                                       height: 15,
//                                       width: MediaQuery.of(context).size.width,
//                                       color: AppColors.bgColor,
//                                     ),
//                                   ],
//                                 );
//                               })
//                           : Container(),
//                       sliderlist1.length > 0
//                           ? Container(
//                               height: 200,
//                               child: ListView.builder(
//                                 itemCount: sliderlist1.length,
//                                 shrinkWrap: true,
//                                 primary: false,
//                                 physics: NeverScrollableScrollPhysics(),
//                                 scrollDirection: Axis.vertical,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   // Slider1 item = snapshot.data[index];
//                                   return Container(
//                                     width: MediaQuery.of(context).size.width,
//                                     // height: 250,
//                                     child: InkWell(
//                                         onTap: () {
//                                           // print(item.title + "TITLE");
//                                           // print(item.description + "DESCR");
//                                           if (!sliderlist1[index]
//                                               .title
//                                               .isEmpty) {
//                                             // Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2(sliderlist1[index].title, "")),);
//                                             // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductList(list[index].pcatId,"Vender List")),);

//                                           } else if (!sliderlist1[index]
//                                               .description
//                                               .isEmpty) {
// //                                         Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails1(sliderlist1[index].description)),);
// // //

//                                           }
//                                         },
//                                         child: Container(
//                                           padding: EdgeInsets.only(
//                                               top: 0.0,
//                                               left: 8.0,
//                                               right: 8.0,
//                                               bottom: 5),
//                                           child: CachedNetworkImage(
//                                             fit: BoxFit.fill,
//                                             imageUrl:
//                                                 Constant.Product_Imageurl2 +
//                                                     sliderlist1[index].img,
//                                             placeholder: (context, url) => Center(
//                                                 child:
//                                                     CircularProgressIndicator()),
//                                             errorWidget:
//                                                 (context, url, error) =>
//                                                     new Icon(Icons.error),
//                                           ),
//                                         )),
//                                   );
//                                 },
//                               ),
//                             )
//                           : Container(),
//                       Container(
//                         height: 15,
//                         width: MediaQuery.of(context).size.width,
//                         color: AppColors.bgColor,
//                       ),
//                       Container(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 15, top: 15),
//                               child: Text(
//                                 subCatList[index].pCats,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 20),
//                               ),
//                             ),
//                             FutureBuilder(
//                                 builder: (ctx, snapshot) {
//                                   return snapshot.hasData
//                                       ? GridView.builder(
//                                           primary: false,
//                                           shrinkWrap: true,
//                                           itemCount: vendorList.list.isNotEmpty
//                                               ? vendorList.list.length < 4
//                                                   ? vendorList.list.length
//                                                   : 4
//                                               : 0,
//                                           gridDelegate:
//                                               SliverGridDelegateWithFixedCrossAxisCount(
//                                             crossAxisCount: 2,
//                                             childAspectRatio: 1.35,
//                                           ),
//                                           itemBuilder: (context, index) {
//                                             return InkWell(
//                                               onTap: () {
//                                                 Navigator.of(context).push(
//                                                     MaterialPageRoute(
//                                                         builder: (cpntext) =>
//                                                             MV_products(
//                                                                 vendorList
//                                                                     .list[index]
//                                                                     .name,
//                                                                 vendorList
//                                                                     .list[index]
//                                                                     .mvId,
//                                                                 vendorList
//                                                                     .list[index]
//                                                                     .cat,
//                                                                 vendorList
//                                                                     .list[index]
//                                                                     .openTime,
//                                                                 vendorList
//                                                                     .list[index]
//                                                                     .closeTime)));
//                                               },
//                                               child: Container(
//                                                 margin: index.isEven
//                                                     ? EdgeInsets.only(
//                                                         left: 15,
//                                                         bottom: 15,
//                                                         right: 15)
//                                                     : EdgeInsets.only(
//                                                         right: 15, bottom: 15),
//                                                 child: Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   children: [
//                                                     Container(
//                                                       height: 100,
//                                                       width: 200,
//                                                       child: ClipRRect(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(5),
//                                                         child:
//                                                             vendorList
//                                                                     .list[index]
//                                                                     .pp
//                                                                     .isEmpty
//                                                                 ? Image.asset(
//                                                                     "assets/images/logo.png",
//                                                                     fit: BoxFit
//                                                                         .fill,
//                                                                   )
//                                                                 : Image.network(
//                                                                     Constant.logo_Image_mv +
//                                                                         vendorList
//                                                                             .list[index]
//                                                                             .pp,
//                                                                     fit: BoxFit
//                                                                         .fill,
//                                                                   ),
//                                                       ),
//                                                     ),
//                                                     SizedBox(height: 10),
//                                                     Text(
//                                                       vendorList
//                                                           .list[index].company,
//                                                       maxLines: 2,
//                                                       style: TextStyle(
//                                                           fontWeight:
//                                                               FontWeight.w700,
//                                                           fontSize: 12),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             );
//                                           })
//                                       : Center(
//                                           child: Container(
//                                               child: Center(
//                                             child: CircularProgressIndicator(
//                                               color: AppColors.tela,
//                                             ),
//                                           )),
//                                         );
//                                 },
//                                 future: getMV(subCatList[0].pcatId)),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => VendorsByCat(
//                                             subCatList[0].pcatId,
//                                             subCatList[0].pCats)));
//                               },
//                               child: Container(
//                                 margin: EdgeInsets.only(left: 15, right: 15),
//                                 height: 50,
//                                 width: MediaQuery.of(context).size.width,
//                                 child: Center(
//                                   child: Text(
//                                     'View All',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         color: AppColors.black,
//                                         fontSize: 12),
//                                   ),
//                                 ),
//                                 decoration: BoxDecoration(
//                                     color: AppColors.red,
//                                     borderRadius: BorderRadius.circular(4),
//                                     border: Border.all(
//                                         color: AppColors.tela, width: 1)),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 15, top: 15),
//                               child: Text(
//                                 subCatList1[index].pCats,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 20),
//                               ),
//                             ),
//                             FutureBuilder(
//                                 builder: (ctx, snapshot) {
//                                   return snapshot.hasData
//                                       ? GridView.builder(
//                                           primary: false,
//                                           shrinkWrap: true,
//                                           itemCount:
//                                               vendorList1.list.length >= 3
//                                                   ? 3
//                                                   : 0,
//                                           gridDelegate:
//                                               SliverGridDelegateWithFixedCrossAxisCount(
//                                                   crossAxisCount: 2,
//                                                   // childAspectRatio: 1.35,'
//                                                   mainAxisExtent: 150),
//                                           itemBuilder: (context, index) {
//                                             return InkWell(
//                                               onTap: () {
//                                                 Navigator.of(context).push(
//                                                   MaterialPageRoute(
//                                                     builder: (cpntext) =>
//                                                         MV_products(
//                                                             vendorList1
//                                                                 .list[index]
//                                                                 .name,
//                                                             vendorList1
//                                                                 .list[index]
//                                                                 .mvId,
//                                                             vendorList1
//                                                                 .list[index]
//                                                                 .cat,
//                                                             vendorList1
//                                                                 .list[index]
//                                                                 .openTime,
//                                                             vendorList1
//                                                                 .list[index]
//                                                                 .closeTime),
//                                                   ),
//                                                 );
//                                               },
//                                               child: Container(
//                                                 height: 100,
//                                                 width: 200,
//                                                 margin: index.isEven
//                                                     ? EdgeInsets.only(
//                                                         left: 15,
//                                                         bottom: 15,
//                                                         right: 15)
//                                                     : EdgeInsets.only(
//                                                         right: 15, bottom: 15),
//                                                 child: Column(
//                                                   children: [
//                                                     Container(
//                                                       height: 100,
//                                                       width: 200,
//                                                       child: ClipRRect(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(5),
//                                                         child:
//                                                             vendorList
//                                                                     .list[index]
//                                                                     .pp
//                                                                     .isEmpty
//                                                                 ? Image.asset(
//                                                                     "assets/images/logo.png",
//                                                                     fit: BoxFit
//                                                                         .fill,
//                                                                   )
//                                                                 : Image.network(
//                                                                     Constant.logo_Image_mv +
//                                                                         vendorList1
//                                                                             .list[index]
//                                                                             .pp,
//                                                                     fit: BoxFit
//                                                                         .fill,
//                                                                   ),
//                                                       ),
//                                                     ),
//                                                     SizedBox(height: 10),
//                                                     Text(
//                                                       vendorList1
//                                                           .list[index].company,
//                                                       style: TextStyle(
//                                                           fontWeight:
//                                                               FontWeight.w700,
//                                                           fontSize: 12),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             );
//                                           })
//                                       : Center(
//                                           child: Container(
//                                             child: CircularProgressIndicator(
//                                               color: AppColors.tela,
//                                             ),
//                                           ),
//                                         );
//                                 },
//                                 future: getMV1(subCatList1[index].pcatId)),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => VendorsByCat(
//                                             subCatList1[0].pcatId,
//                                             subCatList1[0].pCats)));
//                               },
//                               child: Container(
//                                 margin: EdgeInsets.only(left: 15, right: 15),
//                                 height: 50,
//                                 width: MediaQuery.of(context).size.width,
//                                 child: Center(
//                                   child: Text(
//                                     'View All',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         color: AppColors.black,
//                                         fontSize: 12),
//                                   ),
//                                 ),
//                                 decoration: BoxDecoration(
//                                     color: AppColors.red,
//                                     borderRadius: BorderRadius.circular(4),
//                                     border: Border.all(
//                                         color: AppColors.tela, width: 1)),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         height: 15,
//                         color: AppColors.bgColor,
//                       ),
//                       promotionBanner.images.isNotEmpty
//                           ? Container(
//                               margin: EdgeInsets.only(left: 15, right: 15),
//                               height: 150,
//                               width: MediaQuery.of(context).size.width,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: Image.network(
//                                   Constant.base_url +
//                                       promotionBanner.path +
//                                       promotionBanner.images,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             )
//                           : Container(),
//                       Container(
//                         height: 10,
//                         color: AppColors.bgColor,
//                       ),

//                       /* Container(
// //                            color: AppColors.black,
//                             height: 280.0,

//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius
//                                     .circular(0),
//                                 gradient: LinearGradient(
//                                     begin: Alignment
//                                         .bottomRight,
//                                     colors: [
//                                       Colors.blue
//                                           .withOpacity(.4),
//                                       Colors.teal
//                                           .withOpacity(.1),
//                                     ]
//                                 )

//                             ),
//                             child: topProducts.length != null ? Container(
// //                              color: AppColors.tela,
//                               margin: EdgeInsets.only(left: 8.0,top:20,bottom: 20),
//                               height: 230.0,
//                               child: ListView.builder(
//                                   scrollDirection: Axis.horizontal,
//                                   itemCount: topProducts.length == null
//                                       ? 0
//                                       : topProducts.length,
//                                   itemBuilder: (BuildContext context, int index) {
//                                     return
//                                       Container(
//                                         width: topProducts[index]!=0?130.0:230.0,
//                                         color: Colors.white,
//                                         margin: EdgeInsets.only(right: 10),

//                                         child:
//                                         Column(
//                                           children: <Widget>[

// //                                          shape: RoundedRectangleBorder(
// //                                            borderRadius: BorderRadius.circular(
// //                                                10.0),
// //                                          ),

//                                             InkWell(
//                                               onTap: () {
//                                                 Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           ProductDetails(
//                                                               topProducts[index])),
//                                                 );
// //
//                                               },
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                                 children: <Widget>[
//                                                   SizedBox(
//                                                     height: 130,
// //                                            width: 162,

//                                                     child: CachedNetworkImage(
//                                                       fit: BoxFit.cover,
//                                                       imageUrl: Constant
//                                                           .Product_Imageurl +
//                                                           topProducts[index].img,
// //                                                  =="no-cover.png"? getImage(topProducts[index].productIs):topProducts[index].image,
//                                                       placeholder: (context, url) =>
//                                                           Center(
//                                                               child:
//                                                               CircularProgressIndicator()),
//                                                       errorWidget:
//                                                           (context, url, error) =>
//                                                       new Icon(Icons.error),

//                                                     ),
//                                                   ),

//                                                 ],
//                                               ),
//                                             ),

//                                             Expanded(
//                                               child: Container(
//                                                 margin: EdgeInsets.only(left: 5,right: 5,top: 5),
//                                                 padding:EdgeInsets.only(left: 3,right: 5),

//                                                 color:AppColors.white,
//                                                 child: Column(
//                                                   crossAxisAlignment: CrossAxisAlignment.start,

//                                                   children: <Widget>[
//                                                     Text(
//                                                       topProducts[index].productName,
//                                                       overflow:TextOverflow.ellipsis,
//                                                       maxLines: 2,
//                                                       style: TextStyle(
//                                                         fontSize: 12,color:AppColors.black,

//                                                       ),
//                                                     ),
//                                                     SizedBox(height: 8,),

//                                                     Text('(\u{20B9} ${topProducts[index].buyPrice})',
//                                                       overflow:TextOverflow.ellipsis,
//                                                       maxLines: 2,
//                                                       style: TextStyle(
//                                                           fontWeight: FontWeight.w700,
//                                                           fontStyle: FontStyle.italic,fontSize: 12,
//                                                           color: AppColors.black,
//                                                           decoration: TextDecoration.lineThrough
//                                                       ),
//                                                     ),
//                                                     SizedBox(height: 8,),
//                                                     Padding(
//                                                       padding: const EdgeInsets.only(top: 2.0, bottom: 1),
//                                                       child: Text('\u{20B9} ${calDiscount(topProducts[index].buyPrice,topProducts[index].discount)}', style: TextStyle(
//                                                           color: AppColors.green,
//                                                           fontWeight: FontWeight.w700,fontSize: 12
//                                                       )),
//                                                     ),

//                                                   ],
//                                                 ),
//                                               ),
//                                             ),

//                                           ],
//                                         ),
//                                       );
//                                   }),

//                             ) : Center(child: CircularProgressIndicator(
//                               backgroundColor: AppColors.tela,
//                             ),),
//                           ),*/

//                       /*Container(
//                             color: Colors.white,
//                             padding: EdgeInsets.only(bottom: 10),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       top: 8.0, left: 8.0, right: 8.0),
//                                   child: Text(Constant.AProduct_type_Name2,
//                                     style: TextStyle(
//                                         color: AppColors.product_title_name,
//                                         fontSize: 15,
//                                         fontFamily: 'Roboto',
//                                         fontWeight: FontWeight.bold),),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       right: 8.0, top: 8.0, left: 8.0),
//                                   child: RaisedButton(
//                                       color: Colors.white,
//                                       child: Text('View All',
//                                           style: TextStyle(
//                                               color: Colors.blueGrey)),
//                                       onPressed: () {
//                                         Navigator.push(
//                                           context,
//                                           MaterialPageRoute(builder: (context) =>
//                                               ProductList("day",
//                                                   Constant.AProduct_type_Name2)),
//                                         );
//                                       }),
//                                 )
//                               ],
//                             ),
//                           ),*/

//                       /* Container(
//                             color: Colors.black12,
//                             child: GridView.count(
//                                 physics:ClampingScrollPhysics() ,
//                                 controller: new ScrollController(keepScrollOffset: false),
//                                 shrinkWrap: true,
//                                 crossAxisCount: 2,
//                                 childAspectRatio: 0.7,
//                                 padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 0),
//                                 children: List.generate(dilofdayProducts.length, (index){

//                                   return Container(
//                                     height: 170,
//                                     child: Card(
//                                       elevation: 2.0,
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(10.0),
//                                       ),
//                                       child: Column(
//                                         children: <Widget>[
//                                           InkWell(
//                                             onTap: () {
//                                               Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         ProductDetails(
//                                                             dilofdayProducts[index])),
//                                               );
// //
//                                             },
//                                             child:  SizedBox(
//                                               height: 180,
//                                               width: double.infinity,
//                                               child: CachedNetworkImage(
//                                                 fit: BoxFit.cover,
//                                                 imageUrl: Constant
//                                                     .Product_Imageurl +
//                                                     dilofdayProducts[index].img,
// //                                                  =="no-cover.png"? getImage(topProducts[index].productIs):topProducts[index].image,
//                                                 placeholder: (context, url) =>
//                                                     Center(
//                                                         child:
//                                                         CircularProgressIndicator()),
//                                                 errorWidget:
//                                                     (context, url, error) =>
//                                                 new Icon(Icons.error),

//                                               ),
//                                             ),
//                                           ),

//                                           Expanded(
//                                             child: Container(
//                                               margin: EdgeInsets.only(left: 5,right: 5,top: 5),
//                                               padding:EdgeInsets.only(left: 3,right: 5),

//                                               color:AppColors.white,
//                                               child: Column(
//                                                 crossAxisAlignment: CrossAxisAlignment.start,

//                                                 children: <Widget>[
//                                                   Text(
//                                                     dilofdayProducts[index].productName,
//                                                     overflow:TextOverflow.ellipsis,
//                                                     maxLines: 2,
//                                                     style: TextStyle(
//                                                       fontSize: 12,color:AppColors.black,

//                                                     ),
//                                                   ),
//                                                   SizedBox(height: 4,),

//                                                   Row(
//                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                     children: [
//                                                       Text('(\u{20B9} ${dilofdayProducts[index].buyPrice})',
//                                                         overflow:TextOverflow.ellipsis,
//                                                         maxLines: 2,
//                                                         style: TextStyle(
//                                                             fontWeight: FontWeight.w700,
//                                                             fontStyle: FontStyle.italic,fontSize: 12,
//                                                             color: AppColors.black,
//                                                             decoration: TextDecoration.lineThrough
//                                                         ),
//                                                       ),

//                                                       Padding(
//                                                         padding: const EdgeInsets.only(top: 2.0, bottom: 1,right: 10),
//                                                         child: Text('\u{20B9} ${calDiscount(dilofdayProducts[index].buyPrice,dilofdayProducts[index].discount)}', style: TextStyle(
//                                                             color: AppColors.green,
//                                                             fontWeight: FontWeight.w700,fontSize: 12
//                                                         )),
//                                                       ),

//                                                     ],
//                                                   ),

//                                                 ],
//                                               ),
//                                             ),
//                                           ),

//                                         ],
//                                       ),
//                                     ),
//                                   );

//                                 })),
//                           ),*/

//                       /*Container(
//                             margin: EdgeInsets.symmetric(vertical: 8.0),
//                             height: 138.0,
//                             child: ListView.builder(
//                                 scrollDirection: Axis.horizontal,
//                                 itemCount: dilofdayProducts.length == null
//                                     ? 0
//                                     : dilofdayProducts.length,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   return Container(
//                                     width: 130.0,

//                                     child: Card(
//                                       shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(
//                                             10.0),
//                                       ),
//                                       clipBehavior: Clip.antiAlias,
//                                       child:
//                                       InkWell(
//                                         onTap: () {
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     ProductDetails(
//                                                         dilofdayProducts[index])),
//                                           );
// //
//                                         },
//                                         child: Column(
//                                           crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                           children: <Widget>[
//                                             SizedBox(
//                                               height: 130,

//                                               child: CachedNetworkImage(
//                                                 fit: BoxFit.cover,
//                                                 imageUrl: Constant
//                                                     .Product_Imageurl +
//                                                     dilofdayProducts[index].img,
// //                                                  =="no-cover.png"? getImage(topProducts[index].productIs):topProducts[index].image,
//                                                 placeholder: (context, url) =>
//                                                     Center(
//                                                         child:
//                                                         CircularProgressIndicator()),
//                                                 errorWidget:
//                                                     (context, url, error) =>
//                                                 new Icon(Icons.error),

//                                               ),
//                                             ),

//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 }),

//                           ),*/

//                       /*  Container(
//                           child: Padding(
//                             padding: EdgeInsets.only(
//                                 top: 6.0, left: 8.0, right: 8.0, bottom: 10),
//                             child: Image(
//                               fit: BoxFit.cover,
//                               image: AssetImage('assets/images/banner-2.png'),
//                             ),
//                           ),
//                         )*/
//                     ],
//                   ),
//                   // Builds 1000 ListTiles
//                   childCount: 1,
//                 ),
//               )
//             ]));
//   }

//   /*Showpop(){
//     showDialog(
//       barrierDismissible: false, // JUST MENTION THIS LINE
//       context: context,
//       builder: (BuildContext context) {
//         // return object of type Dialog
//         return WillPopScope(
//           onWillPop: () {},
//           child: AlertDialog(
//               content: Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child:  Container(
//                   height: 110.0,
//                   width: 320.0,

//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Padding(
//                           padding:  EdgeInsets.all(5.0),
//                           child: Text("New Version is avaliable on Playstore",style: TextStyle(fontSize: 18,color: Colors.black),)
//                       ),
// //          Padding(
// //              padding:  EdgeInsets.all(10.0),
// //              child: Text('${_updateInfo.availableVersionCode}',style: TextStyle(fontSize: 18,color: Colors.black),)
// //          ),

//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           (_updateInfo.availableVersionCode-valcgeck)<3? FlatButton(
//                               onPressed: (){
//                                 Navigator.of(context).pop();
//                               },
//                               child: Text('Cancel !', style: TextStyle(color: AppColors.black, fontSize: 18.0),)):Row(),

//                           FlatButton(
//                               onPressed: (){
//                                 Navigator.of(context).pop();
//                                 // _launchURL();
//                               },
//                               child: Text('Update ', style: TextStyle(color: AppColors.green, fontSize: 18.0),)),

//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               )
//           ),
//         );
//       },
//     );
//   }*/

// //  showDilogue(BuildContext context) {
// //    Dialog errorDialog = Dialog(
// //      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
// //      //this right here
// //      child: Container(
// //        height: 160.0,
// //        width: 300.0,
// //
// //        child: Column(
// //          mainAxisAlignment: MainAxisAlignment.center,
// //          children: <Widget>[
// //            Padding(
// //                padding: EdgeInsets.all(10.0),
// //                child: Text("New Version is avaliable on Playstore",
// //                  style: TextStyle(fontSize: 18, color: Colors.black),)
// //            ),
// ////          Padding(
// ////              padding:  EdgeInsets.all(10.0),
// ////              child: Text('${_updateInfo.availableVersionCode}',style: TextStyle(fontSize: 18,color: Colors.black),)
// ////          ),
// //
// //            Row(
// //              mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //              children: <Widget>[
// //                FlatButton(
// //                    onPressed: () {
// //                      Navigator.of(context).pop();
// //                    },
// //                    child: Text('Cancel !', style: TextStyle(
// //                        color: AppColors.black, fontSize: 18.0),)),
// //
// //                FlatButton(
// //                    onPressed: () {
// //                      Navigator.of(context).pop();
// //                      _launchURL();
// //                    },
// //                    child: Text('Update Now ', style: TextStyle(
// //                        color: AppColors.green, fontSize: 18.0),)),
// //
// //              ],
// //            )
// //          ],
// //        ),
// //      ),
// //    );
// //    showDialog(
// //        context: context, builder: (BuildContext context) => errorDialog);
// //  }

//   String calGst(String byprice, String sgst) {
//     String returnStr;
//     double discount = 0.0;
//     if (sgst.length > 1) {
//       returnStr = discount.toString();
//       double byprice1 = double.parse(byprice);
//       print(sgst);

//       double discount1 = double.parse(sgst);

//       discount = ((byprice1 * discount1) / (100.0 + discount1));

//       returnStr = discount.toStringAsFixed(2);
//       print(returnStr);
//       return returnStr;
//     } else {
//       return '0';
//     }
//   }

//   double sgst1, cgst1, dicountValue, admindiscountprice;

//   int total = 000;
//   int actualprice = 200;
//   double mrp, totalmrp = 000;
//   int _count = 1;
//   getAddrocatrvalue(Products pro) {
//     String mrp_price = calDiscount(pro.buyPrice, pro.discount);
//     totalmrp = double.parse(mrp_price);

//     double dicountValue = double.parse(pro.buyPrice) - totalmrp;
//     String gst_sgst = calGst(mrp_price, pro.sgst);
//     String gst_cgst = calGst(mrp_price, pro.cgst);

//     String adiscount =
//         calDiscount(pro.buyPrice, pro.msrp != null ? pro.msrp : "0");

//     admindiscountprice = (double.parse(pro.buyPrice) - double.parse(adiscount));

//     String color = "";
//     String size = "";
//     _addToproducts(
//         pro.productIs,
//         pro.productName,
//         pro.img,
//         int.parse(mrp_price),
//         int.parse(pro.count),
//         color,
//         size,
//         pro.productDescription,
//         gst_sgst,
//         gst_cgst,
//         pro.discount,
//         dicountValue.toString(),
//         pro.APMC,
//         admindiscountprice.toString(),
//         pro.buyPrice);

//     setState(() {
// //                                                                              cartvalue++;
//       Constant.carditemCount++;
//       MyApp1State.countval = Constant.carditemCount;
//       cartItemcount(Constant.carditemCount);
//     });

//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => MyApp1()),
//     );
//   }

//   final DbProductManager dbmanager = new DbProductManager();

//   ProductsCart products;
// //cost_price=buyprice
//   void _addToproducts(
//       String pID,
//       String p_name,
//       String image,
//       int price,
//       int quantity,
//       String c_val,
//       String p_size,
//       String p_disc,
//       String sgst,
//       String cgst,
//       String discount,
//       String dis_val,
//       String adminper,
//       String adminper_val,
//       String cost_price) {
//     if (products == null) {
// //    print(pID+"......");
// //    print(p_name);
// //    print(image);
// //    print(price);
// //    print(quantity);
// //    print(c_val);
// //    print(p_size);
// //    print(p_disc);
// //    print(sgst);
// //    print(cgst);
// //    print(discount);
// //    print(dis_val);
// //    print(adminper);
// //    print(adminper_val);
// //    print(cost_price);
//       ProductsCart st = new ProductsCart(
//           pid: pID,
//           pname: p_name,
//           pimage: image,
//           pprice: (price * quantity).toString(),
//           pQuantity: quantity,
//           pcolor: c_val,
//           psize: p_size,
//           pdiscription: p_disc,
//           sgst: sgst,
//           cgst: cgst,
//           discount: discount,
//           discountValue: dis_val,
//           adminper: adminper,
//           adminpricevalue: adminper_val,
//           costPrice: cost_price);
//       dbmanager.insertStudent(st).then((id) => {
//             showLongToast(" Products  is added to cart "),
//             print(' Added to Db ${id}')
//           });
//     }
//   }

//   String calDiscount(String byprice, String discount2) {
//     String returnStr;
//     double discount = 0.0;
//     returnStr = discount.toString();
//     double byprice1 = double.parse(byprice);
//     double discount1 = double.parse(discount2);

//     discount = (byprice1 - (byprice1 * discount1) / 100.0);

//     returnStr = discount.toStringAsFixed(Constant.val);
//     print(returnStr);
//     return returnStr;
//   }

//   void _launchMapsUrl(double lat, double lng) async {
//     final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   _shairApp() {
//     Share.share("Hi, Looking for best deals online? Download " +
//         Constant.appname +
//         " app form click on this link  https://play.google.com/store/apps/details?id=com.myhomzsolutions");
//   }

//   void _launchphone(String teli) async {
//     final url = 'tel:' + teli;
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }

// // import 'dart:convert';
// // import 'dart:math';

// // import 'package:cached_network_image/cached_network_image.dart';
// // import 'package:carousel_slider/carousel_slider.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:geocoder/geocoder.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:maxeyfresh/General/AnimatedSplashScreen.dart';
// // import 'package:maxeyfresh/General/AppConstant.dart';
// // import 'package:maxeyfresh/General/Home.dart';
// // import 'package:maxeyfresh/dbhelper/CarrtDbhelper.dart';

// // import 'package:maxeyfresh/dbhelper/database_helper.dart';
// // import 'package:maxeyfresh/model/CategaryModal.dart';
// // import 'package:maxeyfresh/model/CoupanModel.dart';
// // import 'package:maxeyfresh/model/Gallerymodel.dart';
// // import 'package:maxeyfresh/model/ListModel.dart';
// // import 'package:maxeyfresh/model/productmodel.dart';
// // import 'package:maxeyfresh/model/promotion_banner.dart';
// // import 'package:maxeyfresh/model/slidermodal.dart';
// // import 'package:maxeyfresh/model/vendor_details.dart';
// // import 'package:maxeyfresh/screen/MvProduct.dart';
// // import 'package:maxeyfresh/screen/SearchScreen.dart';
// // import 'package:maxeyfresh/screen/detailpage1.dart';
// // import 'package:maxeyfresh/screen/secondtabview.dart';
// // import 'package:maxeyfresh/screen/vendors_by_cat.dart';
// // import 'package:new_version/new_version.dart';
// // import 'package:share/share.dart';
// // import 'package:url_launcher/url_launcher.dart';
// // import 'package:http/http.dart' as http;

// // class Screen extends StatefulWidget {
// //   @override
// //   ScreenState createState() => ScreenState();
// // }

// // // com.willyoudateme
// // class ScreenState extends State<Screen> {
// //   static int cartvalue = 0;

// //   bool progressbar = true;

// //   getPackageInfo() async {
// //     NewVersion newVersion = NewVersion(context: context);
// //     final status = await newVersion.getVersionStatus();
// //     // status.canUpdate; // (true)
// //     // status.localVersion ;// (1.2.1)
// //     // status.storeVersion; // (1.2.3)
// //     // status.appStoreLink;
// //     newVersion.showAlertIfNecessary();
// //     // print(status.canUpdate);
// //     // print(status.localVersion);
// //     // print(status.storeVersion);
// //     // print(status.appStoreLink);
// //   }

// //   static List<String> imgList5 = [
// //     'https://www.liveabout.com/thmb/y4jjlx2A6PVw_QYG4un_xJSFGBQ=/400x250/filters:no_upscale():max_bytes(150000):strip_icc()/asos-plus-size-maxi-dress-56e73ba73df78c5ba05773ab.jpg',
// //   ];

// //   final List<String> imgList1 = [
// //     'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/9329399/2019/4/24/8df4ed41-1e43-4a0d-97fe-eb47edbdbacd1556086871124-Libas-Women-Kurtas-6161556086869769-1.jpg',
// //   ];
// //   int _current = 0;
// //   var _start = 0;
// //   List<Categary> list = new List<Categary>();
// //   static List<Categary> list1 = new List<Categary>();
// //   static List<Categary> list2 = new List<Categary>();
// //   static List<Slider1> sliderlist = List<Slider1>();
// //   static List<Slider1> sliderlist1 = List<Slider1>();
// //   static List<ListModel> shoplist = List<ListModel>();
// //   static List<ListModel> items = List<ListModel>();
// //   List<Categary> subCatList = new List<Categary>();
// //   List<Categary> subCatList1 = new List<Categary>();

// //   static List<Products> topProducts = List();
// //   static List<Products> dilofdayProducts = List();
// //   List<Gallery> galiryImage = List();
// //   final List<String> imgL = List();
// //   final addController = TextEditingController();
// //   VendorList vendorList = VendorList();
// //   VendorList vendorList1 = VendorList();
// //   PromotionBanner promotionBanner = PromotionBanner();

// //   String lastversion = "0";
// //   int valcgeck;
// //   GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

// //   bool _flexibleUpdateAvailable = false;
// //   bool clicked = false;
// //   bool isLoading = true;

// //   @override
// //   void initState() {
// //     super.initState();
// //     WidgetsFlutterBinding.ensureInitialized();

// //     if (Constant.Checkupdate) {
// //       getPackageInfo();
// //       Constant.Checkupdate = false;
// //     }

// //     if (SplashScreenState.listcat.length > 0) {
// //       list.addAll(SplashScreenState.listcat);
// //       print("len----->${list.length}");
// //     } else {
// //       DatabaseHelper.getData("0").then((usersFromServe) {
// //         print("screen1");
// //         if (this.mounted) {
// //           print("screen1");
// //           setState(() {
// //             list = usersFromServe;
// //             print("lem----->${list.length}");
// //           });
// //         }
// //       });
// //     }
// //     getBanner().then((usersFromServe) {
// //       if (this.mounted) {
// //         setState(() {
// //           sliderlist1 = usersFromServe;
// //           // list = usersFromServe;
// //         });
// //       }
// //     });

// //     DatabaseHelper.getSlider().then((usersFromServe1) {
// //       if (this.mounted) {
// //         setState(() {
// //           ScreenState.sliderlist = usersFromServe1;

// //           ScreenState.imgList5.clear();
// //           if (ScreenState.sliderlist.length > 0) {
// //             for (var i = 0; i < ScreenState.sliderlist.length; i++) {
// //               ScreenState.imgList5.add(ScreenState.sliderlist[i].img);
// //             }
// //           }
// //         });
// //       }
// //     });
// //     // getShopList("20").then((usersFromServe1) {
// //     //   if (this.mounted) {
// //     //     setState(() {
// //     //       shoplist = usersFromServe1;
// //     //       // print("sliderlist1.length");
// //     //       // print(sliderlist1.length);
// //     //     });
// //     //   }
// //     // });

// // //
// // //     DatabaseHelper.getTopProduct("top", "5").then((usersFromServe) {
// // //       if (this.mounted) {
// // //         setState(() {
// // //           ScreenState.topProducts = usersFromServe;
// // // //          ScreenState.topProducts.add(topProducts[0]);
// // //
// // //         });
// // //       }
// // //     });

// // //    search
// // //     DatabaseHelper.getTopProduct1("new", "10").then((usersFromServe) {
// // //       if (this.mounted) {
// // //         setState(() {
// // //           ScreenState.dilofdayProducts = usersFromServe;
// // //         });
// // //       }
// // //     });
// //     init();
// //   }

// //   init() async {
// //     if (SplashScreenState.listcat.length > 0) {
// //       list.addAll(SplashScreenState.listcat);
// //       print("len----->${list.length}");
// //     } else {
// //       await DatabaseHelper.getData("").then((usersFromServe) {
// //         print("screen1");
// //         if (this.mounted) {
// //           print("screen1");
// //           setState(() {
// //             list = usersFromServe;
// //             print("lem----->${list.length}");
// //           });
// //         }
// //       });
// //     }

// //     promotionBanner = await DatabaseHelper.getPromotionBanner();

// //     // list.first.pcatId.toString(),

// //     await DatabaseHelper.getData1(list[1].pcatId, "API CALL 1")
// //         .then((usersFromServe) {
// //       print("Helllllo");
// //       if (this.mounted) {
// //         setState(() {
// //           subCatList = usersFromServe;
// //           print("sub----${subCatList.length}");
// //           // print("isLoading---->${isLoading}");
// //           // print(promotionBanner.path);
// //           // print("sub----${subCatList.first.pCats}");
// //         });
// //       }
// //     });

// //     await DatabaseHelper.getData1(list.last.pcatId.toString(), "API CALL 1")
// //         .then((usersFromServe) {
// //       print("Helllllo");
// //       if (this.mounted) {
// //         setState(() {
// //           subCatList1 = usersFromServe;
// //           // print("sub----${subCatList1.length}");
// //           isLoading = false;
// //           // print("isLoading---->${isLoading}");
// //           // print(promotionBanner.path);
// //           // print("sub----${subCatList1.first.pCats}");
// //         });
// //       }
// //     });
// //   }

// //   Position position;
// //   void _getCurrentLocation() async {
// //     Position res = await Geolocator.getCurrentPosition();
// //     setState(() {
// //       position = res;
// //       Constant.latitude = position.latitude;
// //       Constant.longitude = position.longitude;
// //       print(' lat ${Constant.latitude},${Constant.longitude}');
// //       getAddress1(Constant.latitude, Constant.longitude);
// //     });
// //   }

// //   getAddress1(double lat, double long) async {
// //     final coordinates = new Coordinates(lat, long);
// //     var addresses =
// //         await Geocoder.local.findAddressesFromCoordinates(coordinates);
// //     var first = addresses.first;
// //     setState(() {
// //       var address = first.subLocality.toString() +
// //           " " +
// //           first.subAdminArea.toString() +
// //           " " +
// //           first.featureName.toString() +
// //           " " +
// //           first.thoroughfare.toString();

// //       addController.text = address.replaceAll(
// //         "null",
// //         "",
// //       );
// //       // print('Rahul ${address}');
// //       // pref.setString("lat", lat.toString());
// //       // pref.setString("lat", lat.toString());
// //       // pref.setString("add", address.toString().replaceAll("null", ""));
// //     });
// //     return Text(addController.text);
// //   }

// //   bool check = false;

// //   @override
// //   void dispose() {
// //     // TODO: implement dispose
// //     super.dispose();
// //   }

// //   getMV(String catId) async {
// //     String link =
// //         "${Constant.base_url}/api/mv_list?shop_id=${Constant.Shop_id}&lat=${Constant.latitude}&lng=${Constant.longitude}&rad=&q=&mv_cat=${catId}";
// //     var response = await http.get(link);

// //     if (response.statusCode == 200) {
// //       var responseData = jsonDecode(response.body);
// //       setState(() {
// //         vendorList = VendorList.fromJson(responseData);
// //       });
// //       print("list1---->${vendorList.list.length}");
// //       return VendorList.fromJson(responseData);
// //     }
// //   }

// //   getMV1(String catId) async {
// //     String link =
// //         "${Constant.base_url}/api/mv_list?shop_id=${Constant.Shop_id}&lat=${Constant.latitude}&lng=${Constant.longitude}&rad=&q=&mv_cat=${catId}";
// //     var response = await http.get(link);

// //     if (response.statusCode == 200) {
// //       var responseData = jsonDecode(response.body);
// //       setState(() {
// //         vendorList1 = VendorList.fromJson(responseData);
// //       });
// //       print("list1----->${vendorList.list.length}");
// //       return VendorList.fromJson(responseData);
// //     }
// //   }

// //   Widget myContainer() {
// //     return Container(
// //       margin: EdgeInsets.only(right: 3),
// //       height: 2,
// //       width: 5,
// //       color: AppColors.black,
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// // //    showDilogue(context);
// //     return isLoading
// //         ? Container(
// //             child: Center(
// //               child: CircularProgressIndicator(
// //                 color: AppColors.white,
// //               ),
// //             ),
// //           )
// //         : Container(
// //             color: AppColors.white,
// //             child: CustomScrollView(slivers: <Widget>[
// //               SliverList(
// //                 // Use a delegate to build items as they're scrolled on screen.
// //                 delegate: SliverChildBuilderDelegate(
// //                   // The builder function returns a ListTile with a title that
// //                   // displays the index of the current item.
// //                   (context, index) => Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: <Widget>[
// //                       Container(
// //                         height: 50,
// //                         margin: EdgeInsets.only(top: 40, right: 5),
// //                         color: AppColors.white,
// //                         child: GestureDetector(
// //                           onTap: () {
// //                             _getCurrentLocation();
// //                             // Navigator.push(context, MaterialPageRoute(builder: (context) => UserFilterDemo()),);
// //                           },
// //                           child: Stack(
// //                             children: [
// //                               Container(
// //                                 width: MediaQuery.of(context).size.width,
// //                                 decoration: BoxDecoration(
// //                                   borderRadius: BorderRadius.circular(10),
// //                                 ),
// //                                 margin: EdgeInsets.symmetric(
// //                                     horizontal: 0, vertical: 0),
// //                                 padding: EdgeInsets.only(top: 0, bottom: 0),
// //                                 child: TextField(
// //                                   controller: addController,
// //                                   enabled: false,
// //                                   style: TextStyle(fontSize: 12),
// //                                   obscureText: false,
// //                                   decoration: InputDecoration(
// //                                     hintText: "Click here to get location",
// //                                     border: InputBorder.none,
// //                                     hintStyle: TextStyle(
// //                                       fontSize: 12.0,
// //                                       color: Colors.black,
// //                                     ),
// //                                     prefixIcon: Padding(
// //                                       padding: const EdgeInsets.only(
// //                                           left: 0, top: 10),
// //                                       child: Icon(
// //                                         Icons.location_on_outlined,
// //                                         color: AppColors.black,
// //                                         size: 22,
// //                                       ),
// //                                     ),
// //                                   ),
// //                                 ),
// //                               ),
// //                               Container(
// //                                 margin: EdgeInsets.only(
// //                                     left: 50, right: 2, top: 40),
// //                                 child: Row(
// //                                   children: [
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     myContainer(),
// //                                     // myContainer(),
// //                                     // myContainer(),
// //                                     // myContainer(),
// //                                     // myContainer(),
// //                                   ],
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       ),
// //                       Container(
// //                         child: GestureDetector(
// //                           onTap: () {
// //                             Navigator.push(
// //                                 context,
// //                                 MaterialPageRoute(
// //                                     builder: (context) => UserFilterDemo()));

// //                             // Navigator.push(context, MaterialPageRoute(builder: (context) => UserVenderSerch()),);
// //                             // showSearch(context: context, delegate: DataSerch(shoplist));
// //                           },
// //                           child: Container(
// //                             height: 35,
// //                             margin: EdgeInsets.symmetric(
// //                                 horizontal: 5, vertical: 8),
// //                             padding: EdgeInsets.only(top: 5, bottom: 0),
// //                             decoration: BoxDecoration(
// //                               border: Border.all(color: Colors.grey),
// //                               borderRadius: BorderRadius.circular(5),
// //                             ),
// //                             child: TextField(
// //                               enabled: false,
// //                               obscureText: false,
// //                               decoration: InputDecoration(
// //                                   hintText: "Search services ",
// //                                   border: InputBorder.none,
// //                                   hintStyle: TextStyle(
// //                                     fontSize: 14.0,
// //                                     color: Colors.grey,
// //                                   ),
// //                                   prefixIcon: Icon(
// //                                     Icons.search,
// //                                     color: Colors.grey,
// //                                   )),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       sliderlist != null && sliderlist.length > 0
// //                           ? Container(
// //                               margin: EdgeInsets.only(
// //                                 top: 10.0,
// //                                 // left: 10.0,
// //                                 // right: 10.0,
// //                               ),
// //                               // color: AppColors.white,
// //                               height: 170.0,
// //                               child: Container(
// //                                   child: CarouselSlider.builder(
// //                                 itemCount: sliderlist.length,
// //                                 options: CarouselOptions(
// //                                   aspectRatio: 3,
// //                                   viewportFraction: 1.3,
// //                                   enlargeCenterPage: false,
// //                                 ),
// //                                 itemBuilder: (ctx, index, realIdx) {
// //                                   return Container(
// //                                     width:
// //                                         MediaQuery.of(context).size.width - 30,
// //                                     height: 170,
// //                                     child: GestureDetector(
// //                                       onTap: () {
// //                                         if (!sliderlist[index].title.isEmpty) {
// //                                           Navigator.push(
// //                                             context,
// //                                             MaterialPageRoute(
// //                                                 builder: (context) => Screen2(
// //                                                     sliderlist[index].title,
// //                                                     "")),
// //                                           );
// //                                         } else if (!sliderlist[index]
// //                                             .description
// //                                             .isEmpty) {
// //                                           Navigator.push(
// //                                             context,
// //                                             MaterialPageRoute(
// //                                                 builder: (context) =>
// //                                                     ProductDetails1(
// //                                                         sliderlist[index]
// //                                                             .description)),
// //                                           );
// // //

// //                                         }
// //                                       },
// //                                       child: Container(
// //                                           margin: EdgeInsets.only(
// //                                               left: 5.0, right: 5),
// //                                           child: ClipRRect(
// //                                               borderRadius: BorderRadius.all(
// //                                                   Radius.circular(8.0)),
// //                                               child: sliderlist[index].img !=
// //                                                       null
// //                                                   ? Image.network(
// //                                                       Constant.Base_Imageurl +
// //                                                           sliderlist[index].img,
// //                                                       fit: BoxFit.fill,
// //                                                     )
// //                                                   : Image.asset(
// //                                                       "assests/images/logo.png",
// //                                                       fit: BoxFit.fill)

// //                                               // CachedNetworkImage(
// //                                               //   width: MediaQuery.of(context).size.width-30,
// //                                               //   fit: BoxFit.fill,
// //                                               //   imageUrl: Constant.Base_Imageurl +
// //                                               //       sliderlist[index].img,
// //                                               //   placeholder: (context, url) =>
// //                                               //       Center(
// //                                               //           child:
// //                                               //           CircularProgressIndicator()),
// //                                               //   errorWidget:
// //                                               //       (context, url, error) =>
// //                                               //   new Icon(Icons.error),
// //                                               //
// //                                               // )

// //                                               )),
// //                                     ),
// //                                   );
// //                                 },
// //                               )))
// //                           : Row(),
// //                       SizedBox(
// //                         height: 10,
// //                       ),
// //                       Container(
// //                         height: 15,
// //                         width: MediaQuery.of(context).size.width,
// //                         color: AppColors.bgColor,
// //                       ),
// //                       list.isNotEmpty || list != null
// //                           ? ListView.builder(
// //                               primary: false,
// //                               physics: NeverScrollableScrollPhysics(),
// //                               shrinkWrap: true,
// //                               itemCount: list.length,
// //                               itemBuilder: (context, index) {
// //                                 print("Helloooo---> ");
// //                                 return Column(
// //                                   crossAxisAlignment: CrossAxisAlignment.start,
// //                                   mainAxisAlignment: MainAxisAlignment.start,
// //                                   children: [
// //                                     Container(
// //                                       height: 35,
// //                                       child: Padding(
// //                                         padding: const EdgeInsets.only(
// //                                             left: 10, top: 10, bottom: 5),
// //                                         child: Text(
// //                                           list[index].pCats,
// //                                           style: TextStyle(
// //                                               fontWeight: FontWeight.bold),
// //                                         ),
// //                                       ),
// //                                     ),
// //                                     list.isNotEmpty && list != null
// //                                         ? FutureBuilder(
// //                                             future: DatabaseHelper.getData1(
// //                                                 list[index].pcatId,
// //                                                 "API CALL 2"),
// //                                             builder: (ctx, snapshot) {
// //                                               return snapshot.hasData == true
// //                                                   ? Container(
// //                                                       height: 100,
// //                                                       child: ListView.builder(
// //                                                         itemCount: snapshot
// //                                                             .data.length,
// //                                                         scrollDirection:
// //                                                             Axis.horizontal,
// //                                                         shrinkWrap: true,
// //                                                         primary: false,
// //                                                         itemBuilder:
// //                                                             (BuildContext
// //                                                                     context,
// //                                                                 int index) {
// //                                                           return InkWell(
// //                                                             onTap: () {
// //                                                               Navigator.push(
// //                                                                   context,
// //                                                                   MaterialPageRoute(
// //                                                                       builder: (context) => VendorsByCat(
// //                                                                           snapshot
// //                                                                               .data[
// //                                                                                   index]
// //                                                                               .pcatId,
// //                                                                           snapshot
// //                                                                               .data[index]
// //                                                                               .pCats)));
// //                                                             },
// //                                                             child: Container(
// //                                                               height: 100,
// //                                                               width: 85,
// //                                                               decoration:
// //                                                                   BoxDecoration(
// //                                                                       border:
// //                                                                           Border(
// //                                                                 right: BorderSide(
// //                                                                     width: 3,
// //                                                                     color: AppColors
// //                                                                         .bgColor),
// //                                                               )),
// //                                                               child: Column(
// //                                                                 children: [
// //                                                                   SizedBox(
// //                                                                     height: 10,
// //                                                                   ),
// //                                                                   Container(
// //                                                                       height:
// //                                                                           35,
// //                                                                       width: 35,
// //                                                                       child: snapshot
// //                                                                               .data[
// //                                                                                   index]
// //                                                                               .img
// //                                                                               .isEmpty
// //                                                                           ? Image.asset(
// //                                                                               'assets/images/logo.png')
// //                                                                           : Image
// //                                                                               .network(
// //                                                                               Constant.base_url + "manage/uploads/mv_cats/" + snapshot.data[index].img,
// //                                                                               fit: BoxFit.contain,
// //                                                                             )),
// //                                                                   Align(
// //                                                                     alignment:
// //                                                                         Alignment
// //                                                                             .center,
// //                                                                     child:
// //                                                                         Container(
// //                                                                       alignment:
// //                                                                           Alignment
// //                                                                               .center,
// //                                                                       margin: EdgeInsets.only(
// //                                                                           left:
// //                                                                               10,
// //                                                                           right:
// //                                                                               10,
// //                                                                           top:
// //                                                                               10),
// //                                                                       height:
// //                                                                           30,
// //                                                                       width:
// //                                                                           110,
// //                                                                       child:
// //                                                                           Text(
// //                                                                         snapshot
// //                                                                             .data[index]
// //                                                                             .pCats,
// //                                                                         maxLines:
// //                                                                             2,
// //                                                                         style:
// //                                                                             TextStyle(
// //                                                                           fontWeight:
// //                                                                               FontWeight.w600,
// //                                                                           fontSize:
// //                                                                               10,
// //                                                                         ),
// //                                                                       ),
// //                                                                     ),
// //                                                                   ),
// //                                                                 ],
// //                                                               ),
// //                                                             ),
// //                                                           );
// //                                                         },
// //                                                       ),
// //                                                     )
// //                                                   : Container(
// //                                                       child: Center(
// //                                                         child:
// //                                                             CircularProgressIndicator(),
// //                                                       ),
// //                                                     );
// //                                             },
// //                                           )
// //                                         : Container(),
// //                                     Container(
// //                                       height: 15,
// //                                       width: MediaQuery.of(context).size.width,
// //                                       color: AppColors.bgColor,
// //                                     ),
// //                                   ],
// //                                 );
// //                               })
// //                           : Container(),
// //                       // after category slider----------===---------------------------------
// //                       sliderlist1.length > 0
// //                           ? Container(
// //                               height: 200,
// //                               child: ListView.builder(
// //                                 itemCount: sliderlist1.length,
// //                                 shrinkWrap: true,
// //                                 primary: false,
// //                                 physics: NeverScrollableScrollPhysics(),
// //                                 scrollDirection: Axis.vertical,
// //                                 itemBuilder: (BuildContext context, int index) {
// //                                   // Slider1 item = snapshot.data[index];
// //                                   return Container(
// //                                     width: MediaQuery.of(context).size.width,
// //                                     // height: 250,
// //                                     child: InkWell(
// //                                         onTap: () {
// //                                           // print(item.title + "TITLE");
// //                                           // print(item.description + "DESCR");
// //                                           if (!sliderlist1[index]
// //                                               .title
// //                                               .isEmpty) {
// //                                             // Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2(sliderlist1[index].title, "")),);
// //                                             // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductList(list[index].pcatId,"Vender List")),);

// //                                           } else if (!sliderlist1[index]
// //                                               .description
// //                                               .isEmpty) {
// // //                                         Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails1(sliderlist1[index].description)),);
// // // //

// //                                           }
// //                                         },
// //                                         child: Container(
// //                                           padding: EdgeInsets.only(
// //                                               top: 0.0,
// //                                               left: 8.0,
// //                                               right: 8.0,
// //                                               bottom: 5),
// //                                           child: CachedNetworkImage(
// //                                             fit: BoxFit.fill,
// //                                             imageUrl:
// //                                                 Constant.Product_Imageurl2 +
// //                                                     sliderlist1[index].img,
// //                                             placeholder: (context, url) => Center(
// //                                                 child:
// //                                                     CircularProgressIndicator()),
// //                                             errorWidget:
// //                                                 (context, url, error) =>
// //                                                     new Icon(Icons.error),
// //                                           ),
// //                                         )),
// //                                   );
// //                                 },
// //                               ),
// //                             )
// //                           : Container(),
// //                       Container(
// //                         height: 15,
// //                         width: MediaQuery.of(context).size.width,
// //                         color: AppColors.bgColor,
// //                       ),
// //                       // first 4 vendor display=============================================================
// //                       Container(
// //                         child: Column(
// //                           mainAxisAlignment: MainAxisAlignment.start,
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Padding(
// //                               padding: const EdgeInsets.only(left: 15, top: 15),
// //                               child: Text(
// //                                 "hello",
// //                                 // subCatList.,
// //                                 style: TextStyle(
// //                                     fontWeight: FontWeight.bold, fontSize: 20),
// //                               ),
// //                             ),
// //                             FutureBuilder(
// //                               future: getMV(subCatList.last.pcatId),
// //                               builder: (ctx, snapshot) {
// //                                 return snapshot.hasData
// //                                     ? GridView.builder(
// //                                         primary: false,
// //                                         shrinkWrap: true,
// //                                         itemCount: vendorList.list.length,
// //                                         // .isNotEmpty
// //                                         //     ? vendorList.list.length < 4
// //                                         //         ? vendorList.list.length
// //                                         //         : 4
// //                                         //     : 0,
// //                                         gridDelegate:
// //                                             SliverGridDelegateWithFixedCrossAxisCount(
// //                                           crossAxisCount: 2,
// //                                           childAspectRatio: 1.35,
// //                                         ),
// //                                         itemBuilder: (context, index) {
// //                                           return InkWell(
// //                                             onTap: () {
// //                                               Navigator.of(context).push(
// //                                                   MaterialPageRoute(
// //                                                       builder: (cpntext) =>
// //                                                           MV_products(
// //                                                               vendorList
// //                                                                   .list[index]
// //                                                                   .name,
// //                                                               vendorList
// //                                                                   .list[index]
// //                                                                   .mvId,
// //                                                               vendorList
// //                                                                   .list[index]
// //                                                                   .cat,
// //                                                               vendorList
// //                                                                   .list[index]
// //                                                                   .openTime,
// //                                                               vendorList
// //                                                                   .list[index]
// //                                                                   .closeTime)));
// //                                             },
// //                                             child: Container(
// //                                               margin: index.isEven
// //                                                   ? EdgeInsets.only(
// //                                                       left: 15,
// //                                                       bottom: 15,
// //                                                       right: 15)
// //                                                   : EdgeInsets.only(
// //                                                       right: 15, bottom: 15),
// //                                               child: Column(
// //                                                 mainAxisAlignment:
// //                                                     MainAxisAlignment.start,
// //                                                 children: [
// //                                                   Container(
// //                                                     height: 100,
// //                                                     width: 200,
// //                                                     child: ClipRRect(
// //                                                       borderRadius:
// //                                                           BorderRadius.circular(
// //                                                               5),
// //                                                       child: vendorList
// //                                                               .list[index]
// //                                                               .pp
// //                                                               .isEmpty
// //                                                           ? Image.asset(
// //                                                               "assets/images/logo.png",
// //                                                               fit: BoxFit.fill,
// //                                                             )
// //                                                           : Image.network(
// //                                                               Constant.logo_Image_mv +
// //                                                                   vendorList
// //                                                                       .list[
// //                                                                           index]
// //                                                                       .pp,
// //                                                               fit: BoxFit.fill,
// //                                                             ),
// //                                                     ),
// //                                                   ),
// //                                                   SizedBox(height: 10),
// //                                                   Text(
// //                                                     vendorList
// //                                                         .list[index].company,
// //                                                     maxLines: 2,
// //                                                     style: TextStyle(
// //                                                         fontWeight:
// //                                                             FontWeight.w700,
// //                                                         fontSize: 12),
// //                                                   ),
// //                                                 ],
// //                                               ),
// //                                             ),
// //                                           );
// //                                         })
// //                                     : Center(
// //                                         child: Container(
// //                                             child: Center(
// //                                           child: CircularProgressIndicator(
// //                                             color: AppColors.tela,
// //                                           ),
// //                                         )),
// //                                       );
// //                               },
// //                             ),
// //                             InkWell(
// //                               onTap: () {
// //                                 Navigator.push(
// //                                     context,
// //                                     MaterialPageRoute(
// //                                         builder: (context) => VendorsByCat(
// //                                             subCatList.last.pcatId,
// //                                             subCatList.last.pCats)));
// //                               },
// //                               child: Container(
// //                                 margin: EdgeInsets.only(left: 15, right: 15),
// //                                 height: 50,
// //                                 width: MediaQuery.of(context).size.width,
// //                                 child: Center(
// //                                   child: Text(
// //                                     'View All',
// //                                     style: TextStyle(
// //                                         fontWeight: FontWeight.bold,
// //                                         color: AppColors.black,
// //                                         fontSize: 12),
// //                                   ),
// //                                 ),
// //                                 decoration: BoxDecoration(
// //                                     color: AppColors.red,
// //                                     borderRadius: BorderRadius.circular(4),
// //                                     border: Border.all(
// //                                         color: AppColors.tela, width: 1)),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                       Container(
// //                         child: Column(
// //                           mainAxisAlignment: MainAxisAlignment.start,
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Padding(
// //                               padding: const EdgeInsets.only(left: 15, top: 15),
// //                               child: Text(
// //                                 subCatList1[1].pCats,
// //                                 style: TextStyle(
// //                                     fontWeight: FontWeight.bold, fontSize: 20),
// //                               ),
// //                             ),
// //                             FutureBuilder(
// //                                 builder: (ctx, snapshot) {
// //                                   return snapshot.hasData
// //                                       ? GridView.builder(
// //                                           primary: false,
// //                                           shrinkWrap: true,
// //                                           itemCount: vendorList1.list.isNotEmpty
// //                                               ? vendorList1.list.length < 4
// //                                                   ? vendorList1.list.length
// //                                                   : 4
// //                                               : 0,
// //                                           gridDelegate:
// //                                               SliverGridDelegateWithFixedCrossAxisCount(
// //                                             crossAxisCount: 2,
// //                                             childAspectRatio: 1.35,
// //                                           ),
// //                                           itemBuilder: (context, index) {
// //                                             return InkWell(
// //                                               onTap: () {
// //                                                 Navigator.of(context).push(
// //                                                   MaterialPageRoute(
// //                                                     builder: (cpntext) =>
// //                                                         MV_products(
// //                                                             vendorList1
// //                                                                 .list[index]
// //                                                                 .name,
// //                                                             vendorList1
// //                                                                 .list[index]
// //                                                                 .mvId,
// //                                                             vendorList1
// //                                                                 .list[index]
// //                                                                 .cat,
// //                                                             vendorList1
// //                                                                 .list[index]
// //                                                                 .openTime,
// //                                                             vendorList1
// //                                                                 .list[index]
// //                                                                 .closeTime),
// //                                                   ),
// //                                                 );
// //                                               },
// //                                               child: Container(
// //                                                 height: 100,
// //                                                 // width: 200,
// //                                                 // // margin: index.isEven
// //                                                 // //     ? EdgeInsets.only(
// //                                                 // //         left: 15,
// //                                                 // //         bottom: 15,
// //                                                 // //         right: 15)
// //                                                 // //     : EdgeInsets.only(
// //                                                 // //         right: 15, bottom: 15),
// //                                                 child: Column(
// //                                                   children: [
// //                                                     Container(
// //                                                       height: 100,
// //                                                       width: 200,
// //                                                       child: ClipRRect(
// //                                                         borderRadius:
// //                                                             BorderRadius
// //                                                                 .circular(5),
// //                                                         child:
// //                                                             vendorList1
// //                                                                     .list[index]
// //                                                                     .pp
// //                                                                     .isEmpty
// //                                                                 ? Image.asset(
// //                                                                     "assets/images/logo.png",
// //                                                                     fit: BoxFit
// //                                                                         .fill,
// //                                                                   )
// //                                                                 : Image.network(
// //                                                                     Constant.logo_Image_mv +
// //                                                                         vendorList1
// //                                                                             .list[index]
// //                                                                             .pp,
// //                                                                     fit: BoxFit
// //                                                                         .fill,
// //                                                                   ),
// //                                                       ),
// //                                                     ),
// //                                                     SizedBox(height: 10),
// //                                                     Text(
// //                                                       vendorList1
// //                                                           .list[index].company,
// //                                                       style: TextStyle(
// //                                                           fontWeight:
// //                                                               FontWeight.w700,
// //                                                           fontSize: 12),
// //                                                     ),
// //                                                   ],
// //                                                 ),
// //                                               ),
// //                                             );
// //                                           })
// //                                       : Center(
// //                                           child: Container(
// //                                             child: CircularProgressIndicator(
// //                                               color: AppColors.tela,
// //                                             ),
// //                                           ),
// //                                         );
// //                                 },
// //                                 future: getMV1(subCatList1[1].pcatId)),
// //                             InkWell(
// //                               onTap: () {
// //                                 Navigator.push(
// //                                     context,
// //                                     MaterialPageRoute(
// //                                         builder: (context) => VendorsByCat(
// //                                             subCatList1[1].pcatId,
// //                                             subCatList1[1].pCats)));
// //                               },
// //                               child: Container(
// //                                 margin: EdgeInsets.only(left: 15, right: 15),
// //                                 height: 50,
// //                                 width: MediaQuery.of(context).size.width,
// //                                 child: Center(
// //                                   child: Text(
// //                                     'View All',
// //                                     style: TextStyle(
// //                                         fontWeight: FontWeight.bold,
// //                                         color: AppColors.black,
// //                                         fontSize: 12),
// //                                   ),
// //                                 ),
// //                                 decoration: BoxDecoration(
// //                                     color: AppColors.red,
// //                                     borderRadius: BorderRadius.circular(4),
// //                                     border: Border.all(
// //                                         color: AppColors.tela, width: 1)),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                       Container(
// //                         height: 15,
// //                         color: AppColors.bgColor,
// //                       ),
// //                       promotionBanner.images.isNotEmpty
// //                           ? Container(
// //                               margin: EdgeInsets.only(left: 15, right: 15),
// //                               height: 150,
// //                               width: MediaQuery.of(context).size.width,
// //                               child: ClipRRect(
// //                                 borderRadius: BorderRadius.circular(10),
// //                                 child: Image.network(
// //                                   Constant.base_url +
// //                                       promotionBanner.path +
// //                                       promotionBanner.images,
// //                                   fit: BoxFit.cover,
// //                                 ),
// //                               ),
// //                             )
// //                           : Container(),
// //                       Container(
// //                         height: 10,
// //                         color: AppColors.bgColor,
// //                       ),

// //                       /* Container(
// // //                            color: AppColors.black,
// //                             height: 280.0,

// //                             decoration: BoxDecoration(
// //                                 borderRadius: BorderRadius
// //                                     .circular(0),
// //                                 gradient: LinearGradient(
// //                                     begin: Alignment
// //                                         .bottomRight,
// //                                     colors: [
// //                                       Colors.blue
// //                                           .withOpacity(.4),
// //                                       Colors.teal
// //                                           .withOpacity(.1),
// //                                     ]
// //                                 )

// //                             ),
// //                             child: topProducts.length != null ? Container(
// // //                              color: AppColors.tela,
// //                               margin: EdgeInsets.only(left: 8.0,top:20,bottom: 20),
// //                               height: 230.0,
// //                               child: ListView.builder(
// //                                   scrollDirection: Axis.horizontal,
// //                                   itemCount: topProducts.length == null
// //                                       ? 0
// //                                       : topProducts.length,
// //                                   itemBuilder: (BuildContext context, int index) {
// //                                     return
// //                                       Container(
// //                                         width: topProducts[index]!=0?130.0:230.0,
// //                                         color: Colors.white,
// //                                         margin: EdgeInsets.only(right: 10),

// //                                         child:
// //                                         Column(
// //                                           children: <Widget>[

// // //                                          shape: RoundedRectangleBorder(
// // //                                            borderRadius: BorderRadius.circular(
// // //                                                10.0),
// // //                                          ),

// //                                             InkWell(
// //                                               onTap: () {
// //                                                 Navigator.push(
// //                                                   context,
// //                                                   MaterialPageRoute(
// //                                                       builder: (context) =>
// //                                                           ProductDetails(
// //                                                               topProducts[index])),
// //                                                 );
// // //
// //                                               },
// //                                               child: Column(
// //                                                 crossAxisAlignment:
// //                                                 CrossAxisAlignment.start,
// //                                                 children: <Widget>[
// //                                                   SizedBox(
// //                                                     height: 130,
// // //                                            width: 162,

// //                                                     child: CachedNetworkImage(
// //                                                       fit: BoxFit.cover,
// //                                                       imageUrl: Constant
// //                                                           .Product_Imageurl +
// //                                                           topProducts[index].img,
// // //                                                  =="no-cover.png"? getImage(topProducts[index].productIs):topProducts[index].image,
// //                                                       placeholder: (context, url) =>
// //                                                           Center(
// //                                                               child:
// //                                                               CircularProgressIndicator()),
// //                                                       errorWidget:
// //                                                           (context, url, error) =>
// //                                                       new Icon(Icons.error),

// //                                                     ),
// //                                                   ),

// //                                                 ],
// //                                               ),
// //                                             ),

// //                                             Expanded(
// //                                               child: Container(
// //                                                 margin: EdgeInsets.only(left: 5,right: 5,top: 5),
// //                                                 padding:EdgeInsets.only(left: 3,right: 5),

// //                                                 color:AppColors.white,
// //                                                 child: Column(
// //                                                   crossAxisAlignment: CrossAxisAlignment.start,

// //                                                   children: <Widget>[
// //                                                     Text(
// //                                                       topProducts[index].productName,
// //                                                       overflow:TextOverflow.ellipsis,
// //                                                       maxLines: 2,
// //                                                       style: TextStyle(
// //                                                         fontSize: 12,color:AppColors.black,

// //                                                       ),
// //                                                     ),
// //                                                     SizedBox(height: 8,),

// //                                                     Text('(\u{20B9} ${topProducts[index].buyPrice})',
// //                                                       overflow:TextOverflow.ellipsis,
// //                                                       maxLines: 2,
// //                                                       style: TextStyle(
// //                                                           fontWeight: FontWeight.w700,
// //                                                           fontStyle: FontStyle.italic,fontSize: 12,
// //                                                           color: AppColors.black,
// //                                                           decoration: TextDecoration.lineThrough
// //                                                       ),
// //                                                     ),
// //                                                     SizedBox(height: 8,),
// //                                                     Padding(
// //                                                       padding: const EdgeInsets.only(top: 2.0, bottom: 1),
// //                                                       child: Text('\u{20B9} ${calDiscount(topProducts[index].buyPrice,topProducts[index].discount)}', style: TextStyle(
// //                                                           color: AppColors.green,
// //                                                           fontWeight: FontWeight.w700,fontSize: 12
// //                                                       )),
// //                                                     ),

// //                                                   ],
// //                                                 ),
// //                                               ),
// //                                             ),

// //                                           ],
// //                                         ),
// //                                       );
// //                                   }),

// //                             ) : Center(child: CircularProgressIndicator(
// //                               backgroundColor: AppColors.tela,
// //                             ),),
// //                           ),*/

// //                       /*Container(
// //                             color: Colors.white,
// //                             padding: EdgeInsets.only(bottom: 10),
// //                             child: Row(
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: <Widget>[
// //                                 Padding(
// //                                   padding: EdgeInsets.only(
// //                                       top: 8.0, left: 8.0, right: 8.0),
// //                                   child: Text(Constant.AProduct_type_Name2,
// //                                     style: TextStyle(
// //                                         color: AppColors.product_title_name,
// //                                         fontSize: 15,
// //                                         fontFamily: 'Roboto',
// //                                         fontWeight: FontWeight.bold),),
// //                                 ),
// //                                 Padding(
// //                                   padding: const EdgeInsets.only(
// //                                       right: 8.0, top: 8.0, left: 8.0),
// //                                   child: RaisedButton(
// //                                       color: Colors.white,
// //                                       child: Text('View All',
// //                                           style: TextStyle(
// //                                               color: Colors.blueGrey)),
// //                                       onPressed: () {
// //                                         Navigator.push(
// //                                           context,
// //                                           MaterialPageRoute(builder: (context) =>
// //                                               ProductList("day",
// //                                                   Constant.AProduct_type_Name2)),
// //                                         );
// //                                       }),
// //                                 )
// //                               ],
// //                             ),
// //                           ),*/

// //                       /* Container(
// //                             color: Colors.black12,
// //                             child: GridView.count(
// //                                 physics:ClampingScrollPhysics() ,
// //                                 controller: new ScrollController(keepScrollOffset: false),
// //                                 shrinkWrap: true,
// //                                 crossAxisCount: 2,
// //                                 childAspectRatio: 0.7,
// //                                 padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 0),
// //                                 children: List.generate(dilofdayProducts.length, (index){

// //                                   return Container(
// //                                     height: 170,
// //                                     child: Card(
// //                                       elevation: 2.0,
// //                                       shape: RoundedRectangleBorder(
// //                                         borderRadius: BorderRadius.circular(10.0),
// //                                       ),
// //                                       child: Column(
// //                                         children: <Widget>[
// //                                           InkWell(
// //                                             onTap: () {
// //                                               Navigator.push(
// //                                                 context,
// //                                                 MaterialPageRoute(
// //                                                     builder: (context) =>
// //                                                         ProductDetails(
// //                                                             dilofdayProducts[index])),
// //                                               );
// // //
// //                                             },
// //                                             child:  SizedBox(
// //                                               height: 180,
// //                                               width: double.infinity,
// //                                               child: CachedNetworkImage(
// //                                                 fit: BoxFit.cover,
// //                                                 imageUrl: Constant
// //                                                     .Product_Imageurl +
// //                                                     dilofdayProducts[index].img,
// // //                                                  =="no-cover.png"? getImage(topProducts[index].productIs):topProducts[index].image,
// //                                                 placeholder: (context, url) =>
// //                                                     Center(
// //                                                         child:
// //                                                         CircularProgressIndicator()),
// //                                                 errorWidget:
// //                                                     (context, url, error) =>
// //                                                 new Icon(Icons.error),

// //                                               ),
// //                                             ),
// //                                           ),

// //                                           Expanded(
// //                                             child: Container(
// //                                               margin: EdgeInsets.only(left: 5,right: 5,top: 5),
// //                                               padding:EdgeInsets.only(left: 3,right: 5),

// //                                               color:AppColors.white,
// //                                               child: Column(
// //                                                 crossAxisAlignment: CrossAxisAlignment.start,

// //                                                 children: <Widget>[
// //                                                   Text(
// //                                                     dilofdayProducts[index].productName,
// //                                                     overflow:TextOverflow.ellipsis,
// //                                                     maxLines: 2,
// //                                                     style: TextStyle(
// //                                                       fontSize: 12,color:AppColors.black,

// //                                                     ),
// //                                                   ),
// //                                                   SizedBox(height: 4,),

// //                                                   Row(
// //                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                                                     children: [
// //                                                       Text('(\u{20B9} ${dilofdayProducts[index].buyPrice})',
// //                                                         overflow:TextOverflow.ellipsis,
// //                                                         maxLines: 2,
// //                                                         style: TextStyle(
// //                                                             fontWeight: FontWeight.w700,
// //                                                             fontStyle: FontStyle.italic,fontSize: 12,
// //                                                             color: AppColors.black,
// //                                                             decoration: TextDecoration.lineThrough
// //                                                         ),
// //                                                       ),

// //                                                       Padding(
// //                                                         padding: const EdgeInsets.only(top: 2.0, bottom: 1,right: 10),
// //                                                         child: Text('\u{20B9} ${calDiscount(dilofdayProducts[index].buyPrice,dilofdayProducts[index].discount)}', style: TextStyle(
// //                                                             color: AppColors.green,
// //                                                             fontWeight: FontWeight.w700,fontSize: 12
// //                                                         )),
// //                                                       ),

// //                                                     ],
// //                                                   ),

// //                                                 ],
// //                                               ),
// //                                             ),
// //                                           ),

// //                                         ],
// //                                       ),
// //                                     ),
// //                                   );

// //                                 })),
// //                           ),*/

// //                       /*Container(
// //                             margin: EdgeInsets.symmetric(vertical: 8.0),
// //                             height: 138.0,
// //                             child: ListView.builder(
// //                                 scrollDirection: Axis.horizontal,
// //                                 itemCount: dilofdayProducts.length == null
// //                                     ? 0
// //                                     : dilofdayProducts.length,
// //                                 itemBuilder: (BuildContext context, int index) {
// //                                   return Container(
// //                                     width: 130.0,

// //                                     child: Card(
// //                                       shape: RoundedRectangleBorder(
// //                                         borderRadius: BorderRadius.circular(
// //                                             10.0),
// //                                       ),
// //                                       clipBehavior: Clip.antiAlias,
// //                                       child:
// //                                       InkWell(
// //                                         onTap: () {
// //                                           Navigator.push(
// //                                             context,
// //                                             MaterialPageRoute(
// //                                                 builder: (context) =>
// //                                                     ProductDetails(
// //                                                         dilofdayProducts[index])),
// //                                           );
// // //
// //                                         },
// //                                         child: Column(
// //                                           crossAxisAlignment:
// //                                           CrossAxisAlignment.start,
// //                                           children: <Widget>[
// //                                             SizedBox(
// //                                               height: 130,

// //                                               child: CachedNetworkImage(
// //                                                 fit: BoxFit.cover,
// //                                                 imageUrl: Constant
// //                                                     .Product_Imageurl +
// //                                                     dilofdayProducts[index].img,
// // //                                                  =="no-cover.png"? getImage(topProducts[index].productIs):topProducts[index].image,
// //                                                 placeholder: (context, url) =>
// //                                                     Center(
// //                                                         child:
// //                                                         CircularProgressIndicator()),
// //                                                 errorWidget:
// //                                                     (context, url, error) =>
// //                                                 new Icon(Icons.error),

// //                                               ),
// //                                             ),

// //                                           ],
// //                                         ),
// //                                       ),
// //                                     ),
// //                                   );
// //                                 }),

// //                           ),*/

// //                       /*  Container(
// //                           child: Padding(
// //                             padding: EdgeInsets.only(
// //                                 top: 6.0, left: 8.0, right: 8.0, bottom: 10),
// //                             child: Image(
// //                               fit: BoxFit.cover,
// //                               image: AssetImage('assets/images/banner-2.png'),
// //                             ),
// //                           ),
// //                         )*/
// //                     ],
// //                   ),
// //                   // Builds 1000 ListTiles
// //                   childCount: 1,
// //                 ),
// //               )
// //             ]));
// //   }

// //   /*Showpop(){
// //     showDialog(
// //       barrierDismissible: false, // JUST MENTION THIS LINE
// //       context: context,
// //       builder: (BuildContext context) {
// //         // return object of type Dialog
// //         return WillPopScope(
// //           onWillPop: () {},
// //           child: AlertDialog(
// //               content: Padding(
// //                 padding: const EdgeInsets.all(5.0),
// //                 child:  Container(
// //                   height: 110.0,
// //                   width: 320.0,

// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: <Widget>[
// //                       Padding(
// //                           padding:  EdgeInsets.all(5.0),
// //                           child: Text("New Version is avaliable on Playstore",style: TextStyle(fontSize: 18,color: Colors.black),)
// //                       ),
// // //          Padding(
// // //              padding:  EdgeInsets.all(10.0),
// // //              child: Text('${_updateInfo.availableVersionCode}',style: TextStyle(fontSize: 18,color: Colors.black),)
// // //          ),

// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                         children: <Widget>[
// //                           (_updateInfo.availableVersionCode-valcgeck)<3? FlatButton(
// //                               onPressed: (){
// //                                 Navigator.of(context).pop();
// //                               },
// //                               child: Text('Cancel !', style: TextStyle(color: AppColors.black, fontSize: 18.0),)):Row(),

// //                           FlatButton(
// //                               onPressed: (){
// //                                 Navigator.of(context).pop();
// //                                 // _launchURL();
// //                               },
// //                               child: Text('Update ', style: TextStyle(color: AppColors.green, fontSize: 18.0),)),

// //                         ],
// //                       )
// //                     ],
// //                   ),
// //                 ),
// //               )
// //           ),
// //         );
// //       },
// //     );
// //   }*/

// // //  showDilogue(BuildContext context) {
// // //    Dialog errorDialog = Dialog(
// // //      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
// // //      //this right here
// // //      child: Container(
// // //        height: 160.0,
// // //        width: 300.0,
// // //
// // //        child: Column(
// // //          mainAxisAlignment: MainAxisAlignment.center,
// // //          children: <Widget>[
// // //            Padding(
// // //                padding: EdgeInsets.all(10.0),
// // //                child: Text("New Version is avaliable on Playstore",
// // //                  style: TextStyle(fontSize: 18, color: Colors.black),)
// // //            ),
// // ////          Padding(
// // ////              padding:  EdgeInsets.all(10.0),
// // ////              child: Text('${_updateInfo.availableVersionCode}',style: TextStyle(fontSize: 18,color: Colors.black),)
// // ////          ),
// // //
// // //            Row(
// // //              mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //              children: <Widget>[
// // //                FlatButton(
// // //                    onPressed: () {
// // //                      Navigator.of(context).pop();
// // //                    },
// // //                    child: Text('Cancel !', style: TextStyle(
// // //                        color: AppColors.black, fontSize: 18.0),)),
// // //
// // //                FlatButton(
// // //                    onPressed: () {
// // //                      Navigator.of(context).pop();
// // //                      _launchURL();
// // //                    },
// // //                    child: Text('Update Now ', style: TextStyle(
// // //                        color: AppColors.green, fontSize: 18.0),)),
// // //
// // //              ],
// // //            )
// // //          ],
// // //        ),
// // //      ),
// // //    );
// // //    showDialog(
// // //        context: context, builder: (BuildContext context) => errorDialog);
// // //  }

// //   String calGst(String byprice, String sgst) {
// //     String returnStr;
// //     double discount = 0.0;
// //     if (sgst.length > 1) {
// //       returnStr = discount.toString();
// //       double byprice1 = double.parse(byprice);
// //       print(sgst);

// //       double discount1 = double.parse(sgst);

// //       discount = ((byprice1 * discount1) / (100.0 + discount1));

// //       returnStr = discount.toStringAsFixed(2);
// //       print(returnStr);
// //       return returnStr;
// //     } else {
// //       return '0';
// //     }
// //   }

// //   double sgst1, cgst1, dicountValue, admindiscountprice;

// //   int total = 000;
// //   int actualprice = 200;
// //   double mrp, totalmrp = 000;
// //   int _count = 1;
// //   getAddrocatrvalue(Products pro) {
// //     String mrp_price = calDiscount(pro.buyPrice, pro.discount);
// //     totalmrp = double.parse(mrp_price);

// //     double dicountValue = double.parse(pro.buyPrice) - totalmrp;
// //     String gst_sgst = calGst(mrp_price, pro.sgst);
// //     String gst_cgst = calGst(mrp_price, pro.cgst);

// //     String adiscount =
// //         calDiscount(pro.buyPrice, pro.msrp != null ? pro.msrp : "0");

// //     admindiscountprice = (double.parse(pro.buyPrice) - double.parse(adiscount));

// //     String color = "";
// //     String size = "";
// //     _addToproducts(
// //         pro.productIs,
// //         pro.productName,
// //         pro.img,
// //         int.parse(mrp_price),
// //         int.parse(pro.count),
// //         color,
// //         size,
// //         pro.productDescription,
// //         gst_sgst,
// //         gst_cgst,
// //         pro.discount,
// //         dicountValue.toString(),
// //         pro.APMC,
// //         admindiscountprice.toString(),
// //         pro.buyPrice);

// //     setState(() {
// // //                                                                              cartvalue++;
// //       Constant.carditemCount++;
// //       MyApp1State.countval = Constant.carditemCount;
// //       cartItemcount(Constant.carditemCount);
// //     });

// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(builder: (context) => MyApp1()),
// //     );
// //   }

// //   final DbProductManager dbmanager = new DbProductManager();

// //   ProductsCart products;
// // //cost_price=buyprice
// //   void _addToproducts(
// //       String pID,
// //       String p_name,
// //       String image,
// //       int price,
// //       int quantity,
// //       String c_val,
// //       String p_size,
// //       String p_disc,
// //       String sgst,
// //       String cgst,
// //       String discount,
// //       String dis_val,
// //       String adminper,
// //       String adminper_val,
// //       String cost_price) {
// //     if (products == null) {
// // //    print(pID+"......");
// // //    print(p_name);
// // //    print(image);
// // //    print(price);
// // //    print(quantity);
// // //    print(c_val);
// // //    print(p_size);
// // //    print(p_disc);
// // //    print(sgst);
// // //    print(cgst);
// // //    print(discount);
// // //    print(dis_val);
// // //    print(adminper);
// // //    print(adminper_val);
// // //    print(cost_price);
// //       ProductsCart st = new ProductsCart(
// //           pid: pID,
// //           pname: p_name,
// //           pimage: image,
// //           pprice: (price * quantity).toString(),
// //           pQuantity: quantity,
// //           pcolor: c_val,
// //           psize: p_size,
// //           pdiscription: p_disc,
// //           sgst: sgst,
// //           cgst: cgst,
// //           discount: discount,
// //           discountValue: dis_val,
// //           adminper: adminper,
// //           adminpricevalue: adminper_val,
// //           costPrice: cost_price);
// //       dbmanager.insertStudent(st).then((id) => {
// //             showLongToast(" Products  is added to cart "),
// //             print(' Added to Db ${id}')
// //           });
// //     }
// //   }

// //   String calDiscount(String byprice, String discount2) {
// //     String returnStr;
// //     double discount = 0.0;
// //     returnStr = discount.toString();
// //     double byprice1 = double.parse(byprice);
// //     double discount1 = double.parse(discount2);

// //     discount = (byprice1 - (byprice1 * discount1) / 100.0);

// //     returnStr = discount.toStringAsFixed(Constant.val);
// //     print(returnStr);
// //     return returnStr;
// //   }

// //   void _launchMapsUrl(double lat, double lng) async {
// //     final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
// //     if (await canLaunch(url)) {
// //       await launch(url);
// //     } else {
// //       throw 'Could not launch $url';
// //     }
// //   }

// //   _shairApp() {
// //     Share.share("Hi, Looking for best deals online? Download " +
// //         Constant.appname +
// //         " app form click on this link  https://play.google.com/store/apps/details?id=com.myhomzsolutions");
// //   }

// //   void _launchphone(String teli) async {
// //     final url = 'tel:' + teli;
// //     if (await canLaunch(url)) {
// //       await launch(url);
// //     } else {
// //       throw 'Could not launch $url';
// //     }
// //   }
// // }
import 'dart:convert';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maxeyfresh/General/AnimatedSplashScreen.dart';
import 'package:maxeyfresh/General/AppConstant.dart';
import 'package:maxeyfresh/General/Home.dart';
import 'package:maxeyfresh/dbhelper/CarrtDbhelper.dart';

import 'package:maxeyfresh/dbhelper/database_helper.dart';
import 'package:maxeyfresh/model/CategaryModal.dart';
import 'package:maxeyfresh/model/CoupanModel.dart';
import 'package:maxeyfresh/model/Gallerymodel.dart';
import 'package:maxeyfresh/model/ListModel.dart';
import 'package:maxeyfresh/model/productmodel.dart';
import 'package:maxeyfresh/model/promotion_banner.dart';
import 'package:maxeyfresh/model/slidermodal.dart';
import 'package:maxeyfresh/model/vendor_details.dart';
import 'package:maxeyfresh/screen/MvProduct.dart';
import 'package:maxeyfresh/screen/SearchScreen.dart';
import 'package:maxeyfresh/screen/detailpage1.dart';
import 'package:maxeyfresh/screen/secondtabview.dart';
import 'package:maxeyfresh/screen/vendors_by_cat.dart';
import 'package:new_version/new_version.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class Screen extends StatefulWidget {
  @override
  ScreenState createState() => ScreenState();
}

// com.willyoudateme
class ScreenState extends State<Screen> {
  static int cartvalue = 0;

  bool progressbar = true;

  getPackageInfo() async {
    NewVersion newVersion = NewVersion(context: context);
    final status = await newVersion.getVersionStatus();
    newVersion.showAlertIfNecessary();
  }

  static List<String> imgList5 = [
    'https://www.liveabout.com/thmb/y4jjlx2A6PVw_QYG4un_xJSFGBQ=/400x250/filters:no_upscale():max_bytes(150000):strip_icc()/asos-plus-size-maxi-dress-56e73ba73df78c5ba05773ab.jpg',
  ];

  final List<String> imgList1 = [
    'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/9329399/2019/4/24/8df4ed41-1e43-4a0d-97fe-eb47edbdbacd1556086871124-Libas-Women-Kurtas-6161556086869769-1.jpg',
  ];
  int _current = 0;
  var _start = 0;
  List<Categary> list = new List<Categary>();
  static List<Categary> list1 = new List<Categary>();
  static List<Categary> list2 = new List<Categary>();
  static List<Slider1> sliderlist = List<Slider1>();
  static List<Slider1> sliderlist1 = List<Slider1>();
  static List<ListModel> shoplist = List<ListModel>();
  static List<ListModel> items = List<ListModel>();
  List<Categary> subCatList = new List<Categary>();
  List<Categary> subCatList1 = new List<Categary>();
  List<Categary> subCatList2 = new List<Categary>();
  List<String> gridcats = [];
  static List<Products> topProducts = List();
  static List<Products> dilofdayProducts = List();
  List<Gallery> galiryImage = List();
  final List<String> imgL = List();
  final addController = TextEditingController();
  VendorList vendorList = VendorList();
  VendorList vendorList1 = VendorList();
  PromotionBanner promotionBanner = PromotionBanner();
  List<String> imagess = [];
  String lastversion = "0";
  int valcgeck;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  bool _flexibleUpdateAvailable = false;
  bool clicked = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();

    if (Constant.Checkupdate) {
      getPackageInfo();
      Constant.Checkupdate = false;
    }

    if (SplashScreenState.listcat.length > 0) {
      list.addAll(SplashScreenState.listcat);
      print("len----->${list.length}");
    } else {
      DatabaseHelper.getData("0").then((usersFromServe) {
        print("screen1");
        if (this.mounted) {
          print("screen1");
          setState(() {
            list = usersFromServe;
            print("lem----->${list.length}");
          });
        }
      });
    }
    getBanner().then((usersFromServe) {
      if (this.mounted) {
        setState(() {
          sliderlist1 = usersFromServe;
          // list = usersFromServe;
        });
      }
    });

    DatabaseHelper.getSlider().then((usersFromServe1) {
      if (this.mounted) {
        setState(() {
          ScreenState.sliderlist = usersFromServe1;

          ScreenState.imgList5.clear();
          if (ScreenState.sliderlist.length > 0) {
            for (var i = 0; i < ScreenState.sliderlist.length; i++) {
              ScreenState.imgList5.add(ScreenState.sliderlist[i].img);
            }
          }
        });
      }
    });
    // getShopList("20").then((usersFromServe1) {
    //   if (this.mounted) {
    //     setState(() {
    //       shoplist = usersFromServe1;
    //       // print("sliderlist1.length");
    //       // print(sliderlist1.length);
    //     });
    //   }
    // });

//
//     DatabaseHelper.getTopProduct("top", "5").then((usersFromServe) {
//       if (this.mounted) {
//         setState(() {
//           ScreenState.topProducts = usersFromServe;
// //          ScreenState.topProducts.add(topProducts[0]);
//
//         });
//       }
//     });

//    search
//     DatabaseHelper.getTopProduct1("new", "10").then((usersFromServe) {
//       if (this.mounted) {
//         setState(() {
//           ScreenState.dilofdayProducts = usersFromServe;
//         });
//       }
//     });
    init();
  }

  init() async {
    if (SplashScreenState.listcat.length > 0) {
      list.addAll(SplashScreenState.listcat);
      print("len----->${list.length}");
    } else {
      await DatabaseHelper.getData("0").then((usersFromServe) {
        print("screen1");
        if (this.mounted) {
          print("screen1");
          setState(() {
            list = usersFromServe;
            //  isLoading=false;
            print("lem----->${list.length}");
          });
        }
      });
    }

    promotionBanner = await DatabaseHelper.getPromotionBanner();

    await DatabaseHelper.getData1(list.first.pcatId.toString(), "API CALL 1")
        .then((usersFromServe) {
      print("Helllllo");
      if (this.mounted) {
        setState(() {
          subCatList = usersFromServe;
          print("sub----${subCatList.length}");
          print("isLoading---->${isLoading}");
          print(promotionBanner.path);
          print("sub----${subCatList.first.pCats}");
        });
      }
    });

    await DatabaseHelper.getData1(list[1].pcatId.toString(), "API CALL 1")
        .then((usersFromServe) {
      print("Helllllo");
      if (this.mounted) {
        setState(() {
          subCatList1 = usersFromServe;
          print("sub----${subCatList1.length}");
          isLoading = false;
          print("isLoading---->${isLoading}");
          print(promotionBanner.path);
          print("sub----${subCatList1.first.pCats}");
        });
      }
    });
    await DatabaseHelper.getData1(list[2].pcatId.toString(), "API CALL 1")
        .then((usersFromServe) {
      print("Helllllo");
      if (this.mounted) {
        setState(() {
          subCatList2 = usersFromServe;
          print("sub----${subCatList.length}");
          print("isLoading---->${isLoading}");
          print(promotionBanner.path);
          print("sub----${subCatList.first.pCats}");
        });
      }
    });
    imagess = [
      'assets/images/logo.png',
      'assets/images/logo.png',
      'assets/images/logo.png',
    ];
    gridcats = [
      subCatList.first.pCats,
      subCatList1.first.pCats,
      subCatList2.first.pCats
    ];
  }

  Position position;
  void _getCurrentLocation() async {
    Position res = await Geolocator.getCurrentPosition();
    setState(() {
      position = res;
      Constant.latitude = position.latitude;
      Constant.longitude = position.longitude;
      print(' lat ${Constant.latitude},${Constant.longitude}');
      getAddress1(Constant.latitude, Constant.longitude);
    });
  }

  getAddress1(double lat, double long) async {
    final coordinates = new Coordinates(lat, long);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    setState(() {
      var address = first.subLocality.toString() +
          " " +
          first.subAdminArea.toString() +
          " " +
          first.featureName.toString() +
          " " +
          first.thoroughfare.toString();

      addController.text = address.replaceAll(
        "null",
        "",
      );
      // print('Rahul ${address}');
      // pref.setString("lat", lat.toString());
      // pref.setString("lat", lat.toString());
      // pref.setString("add", address.toString().replaceAll("null", ""));
    });
    return Text(addController.text);
  }

  bool check = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  getMV(String catId) async {
    String link =
        "${Constant.base_url}/api/mv_list?shop_id=${Constant.Shop_id}&lat=${Constant.latitude}&lng=${Constant.longitude}&rad=&q=&mv_cat=${catId}";
    var response = await http.get(link);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      setState(() {
        vendorList = VendorList.fromJson(responseData);
      });
      print("list1---->${vendorList.list.length}");
      return VendorList.fromJson(responseData);
    }
  }

  getMV1(String catId) async {
    String link =
        "${Constant.base_url}/api/mv_list?shop_id=${Constant.Shop_id}&lat=${Constant.latitude}&lng=${Constant.longitude}&rad=&q=&mv_cat=${catId}";
    var response = await http.get(link);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      setState(() {
        vendorList1 = VendorList.fromJson(responseData);
      });
      print("list1---->${vendorList.list.length}");
      return VendorList.fromJson(responseData);
    }
  }

  Widget myContainer() {
    return Container(
      margin: EdgeInsets.only(right: 3),
      height: 2,
      width: 5,
      color: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
//    showDilogue(context);
    return Container(
        color: AppColors.white,
        child: CustomScrollView(slivers: <Widget>[
          SliverList(
            // Use a delegate to build items as they're scrolled on screen.
            delegate: SliverChildBuilderDelegate(
              // The builder function returns a ListTile with a title that
              // displays the index of the current item.
              (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 50,
                    margin: EdgeInsets.only(top: 40, right: 5),
                    color: AppColors.white,
                    child: GestureDetector(
                      onTap: () {
                        _getCurrentLocation();
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => UserFilterDemo()),);
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            padding: EdgeInsets.only(top: 0, bottom: 0),
                            child: TextField(
                              controller: addController,
                              enabled: false,
                              style: TextStyle(fontSize: 12),
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: "Click here to get location",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black,
                                ),
                                prefixIcon: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 0, top: 10),
                                  child: Container(
                                    margin: const EdgeInsets.all(6.0),
                             padding: const EdgeInsets.all(2.0),
                                     
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.red,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 50, right: 2, top: 40),
                            child: Row(
                              children: [
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                                myContainer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserFilterDemo()));

                        // Navigator.push(context, MaterialPageRoute(builder: (context) => UserVenderSerch()),);
                        // showSearch(context: context, delegate: DataSerch(shoplist));
                      },
                      child: Container(
                        height: 35,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                        padding: EdgeInsets.only(top: 5, bottom: 0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          enabled: false,
                          obscureText: false,
                          decoration: InputDecoration(
                              hintText: "Search services ",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              )),
                        ),
                      ),
                    ),
                  ),
                  //  isLoading
                  //       ? Container(
                  //           child: Center(
                  //             child: CircularProgressIndicator(
                  //               color: AppColors.white,
                  //             ),
                  //           ),
                  //         )
                  //       :
                  sliderlist != null && sliderlist.length > 0
                      ? Container(
                          margin: EdgeInsets.only(
                            top: 10.0,
                            // left: 10.0,
                            // right: 10.0,
                          ),
                          // color: AppColors.white,
                          height: 170.0,
                          child: Container(
                              child: CarouselSlider.builder(
                            itemCount: sliderlist.length,
                            options: CarouselOptions(
                              aspectRatio: 3,
                              viewportFraction: 1.3,
                              enlargeCenterPage: false,
                            ),
                            itemBuilder: (ctx, index, realIdx) {
                              return Container(
                                width: MediaQuery.of(context).size.width - 30,
                                height: 170,
                                child: GestureDetector(
                                  onTap: () {
                                    if (!sliderlist[index].title.isEmpty) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Screen2(
                                                sliderlist[index].title, "")),
                                      );
                                    } else if (!sliderlist[index]
                                        .description
                                        .isEmpty) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetails1(
                                                    sliderlist[index]
                                                        .description)),
                                      );
//

                                    }
                                  },
                                  child: Container(
                                      margin:
                                          EdgeInsets.only(left: 5.0, right: 5),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                          child: sliderlist[index].img != null
                                              ? Image.network(
                                                  Constant.Base_Imageurl +
                                                      sliderlist[index].img,
                                                  fit: BoxFit.fill,
                                                )
                                              : Image.asset(
                                                  "assests/images/logo.png",
                                                  fit: BoxFit.fill)

                                          // CachedNetworkImage(
                                          //   width: MediaQuery.of(context).size.width-30,
                                          //   fit: BoxFit.fill,
                                          //   imageUrl: Constant.Base_Imageurl +
                                          //       sliderlist[index].img,
                                          //   placeholder: (context, url) =>
                                          //       Center(
                                          //           child:
                                          //           CircularProgressIndicator()),
                                          //   errorWidget:
                                          //       (context, url, error) =>
                                          //   new Icon(Icons.error),
                                          //
                                          // )

                                          )),
                                ),
                              );
                            },
                          )))
                      : Row(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 15,
                    width: MediaQuery.of(context).size.width,
                    color: AppColors.bgColor,
                  ),
                  // isLoading
                  //     ? Container(
                  //         child: Center(
                  //           child: CircularProgressIndicator(
                  //             color: AppColors.white,
                  //           ),
                  //         ),
                  //       )
                     // : 
                      list != null
                          ? ListView.builder(
                              primary: false,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: list.length ?? 0,
                              itemBuilder: (context, index) {
                                print("Helloooo---> ");
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 35,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 10, bottom: 5),
                                        child: Text(
                                          list[index].pCats,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    list.isNotEmpty && list != null
                                        ? FutureBuilder(
                                            future: DatabaseHelper.getData1(
                                                list[index].pcatId,
                                                "API CALL 2"),
                                            builder: (ctx, snapshot) {
                                              return snapshot.hasData == true
                                                  ? Container(
                                                      height: 130,
                                                      child: ListView.builder(
                                                        itemCount: snapshot
                                                                .data.length ??
                                                            0,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        shrinkWrap: true,
                                                        primary: false,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return InkWell(
                                                            onTap: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) => VendorsByCat(
                                                                          snapshot
                                                                              .data[
                                                                                  index]
                                                                              .pcatId,
                                                                          snapshot
                                                                              .data[index]
                                                                              .pCats)));
                                                            },
                                                            child: Container(
                                                              height: 100,
                                                              width: 115,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      border:
                                                                          Border(
                                                                right: BorderSide(
                                                                    width: 3,
                                                                    color: AppColors
                                                                        .bgColor),
                                                              )),
                                                              child: Column(
                                                                children: [
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Container(
                                                                      height:
                                                                          60,
                                                                      width: 60,
                                                                      child: snapshot
                                                                              .data[
                                                                                  index]
                                                                              .img
                                                                              .isEmpty
                                                                          ? Image.asset(
                                                                              'assets/images/logo.png')
                                                                          : Image
                                                                              .network(
                                                                              Constant.base_url + "manage/uploads/mv_cats/" + snapshot.data[index].img,
                                                                              fit: BoxFit.contain,
                                                                            )
                                                                            ),
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child:
                                                                        Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      margin: EdgeInsets.only(
                                                                          left:
                                                                              10,
                                                                          right:
                                                                              10,
                                                                          top:
                                                                              10),
                                                                      height:
                                                                          30,
                                                                      width:
                                                                          110,
                                                                      child:
                                                                          Text(
                                                                        snapshot
                                                                            .data[index]
                                                                            .pCats,
                                                                        maxLines:
                                                                            2,
                                                                        style:
                                                                            TextStyle(
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                          fontSize:
                                                                              13,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    )
                                                  : Row();
                                            },
                                          )
                                        : Container(),
                                    Container(
                                      height: 15,
                                      width: MediaQuery.of(context).size.width,
                                      color: AppColors.bgColor,
                                    ),
                                  ],
                                );
                              })
                          : Container(),
                  // isLoading
                  //     ? Container(
                  //         child: Center(
                  //           child: CircularProgressIndicator(
                  //             color: AppColors.white,
                  //           ),
                  //         ),
                  //       )
                  //     :
                  sliderlist1.length > 0
                      ? Container(
                          height: 200,
                          child: ListView.builder(
                            itemCount: sliderlist1.length,
                            shrinkWrap: true,
                            primary: false,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              // Slider1 item = snapshot.data[index];
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                // height: 250,
                                child: InkWell(
                                    onTap: () {
                                      // print(item.title + "TITLE");
                                      // print(item.description + "DESCR");
                                      if (!sliderlist1[index].title.isEmpty) {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2(sliderlist1[index].title, "")),);
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => ProductList(list[index].pcatId,"Vender List")),);

                                      } else if (!sliderlist1[index]
                                          .description
                                          .isEmpty) {
//                                         Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails1(sliderlist1[index].description)),);
// //

                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: 0.0,
                                          left: 8.0,
                                          right: 8.0,
                                          bottom: 5),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.fill,
                                        imageUrl: Constant.Product_Imageurl2 +
                                            sliderlist1[index].img,
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            new Icon(Icons.error),
                                      ),
                                    )),
                              );
                            },
                          ),
                        )
                      : Container(),
                  Container(
                    height: 15,
                    width: MediaQuery.of(context).size.width,
                    color: AppColors.bgColor,
                  ),
////======================================================================////======================================================================
///////======================================================================////======================================================================
///////======================================================================////======================================================================
                  isLoading
                      ? Container(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.white,
                            ),
                          ),
                        )
                      : subCatList.length > 0
                          ? GridView.builder(
                              // scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 5,
                                      crossAxisCount: 3,
                                      mainAxisExtent: 150),
                              physics: ClampingScrollPhysics(),
                              controller:
                                  new ScrollController(keepScrollOffset: false),
                              shrinkWrap: true,
                              // crossAxisCount: 4,
                              // childAspectRatio: 0.75,
                              padding: EdgeInsets.only(
                                  top: 8, left: 8, right: 6, bottom: 0),
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    // var i = list[index].pcatId;
                                    index == 0
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    VendorsByCat(
                                                        subCatList.first.pcatId,
                                                        subCatList
                                                            .first.pCats)),
                                          )
                                        : index == 1
                                            ? Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        VendorsByCat(
                                                            subCatList1
                                                                .first.pcatId,
                                                            subCatList1
                                                                .first.pCats)),
                                              )
                                            : index == 2
                                                ? Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            VendorsByCat(
                                                                subCatList2
                                                                    .first
                                                                    .pcatId,
                                                                subCatList2
                                                                    .first
                                                                    .pCats)),
                                                  )
                                                : Text("no data");
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColors.black
                                                      .withOpacity(0.8),
                                                  width: 2),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(10)),
                                            ),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 100,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                                child: Image.asset(
                                                    imagess[index])),
                                          ),
                                        ],
                                      ),

                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.8),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10)),
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 35,
                                        child: Center(
                                          child: Text(
                                            gridcats[index],
                                            //list[index].pCats,
                                            //  subCatList[index].pCats,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      // Text(
                                      //   list[index].pCats,
                                      //   maxLines: 2,
                                      //   textAlign: TextAlign.center,
                                      //   overflow: TextOverflow.ellipsis,
                                      //   style: TextStyle(
                                      //     fontWeight: FontWeight.bold,
                                      //     fontSize: 14,
                                      //     color: Colors.black,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                );
                              })
                          : Row(),

////======================================================================

                  //       FutureBuilder(
                  //           builder: (ctx, snapshot) {
                  //             return snapshot.hasData
                  //                 ? GridView.builder(
                  //                     primary: false,
                  //                     shrinkWrap: true,
                  //                     itemCount: vendorList.list.isNotEmpty
                  //                         ? vendorList.list.length < 4
                  //                             ? vendorList.list.length
                  //                             : 4
                  //                         : 0,
                  //                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //                       crossAxisCount: 2,
                  //                       childAspectRatio: 1.35,
                  //                     ),
                  //                     itemBuilder: (context, index) {
                  //                       return InkWell(
                  //                         onTap: () {
                  //                           Navigator.of(context).push(MaterialPageRoute(
                  //                               builder: (cpntext) => MV_products(
                  //                                   vendorList.list[index].name,
                  //                                   vendorList.list[index].mvId,
                  //                                   vendorList.list[index].cat,
                  //                                   vendorList.list[index].openTime,
                  //                                   vendorList.list[index].closeTime)));
                  //                         },
                  //                         child: Container(
                  //                           margin: index.isEven
                  //                               ? EdgeInsets.only(left: 15, bottom: 15, right: 15)
                  //                               : EdgeInsets.only(right: 15, bottom: 15),
                  //                           child: Column(
                  //                             mainAxisAlignment: MainAxisAlignment.start,
                  //                             children: [
                  //                               Container(
                  //                                 height: 100,
                  //                                 width: 200,
                  //                                 child: ClipRRect(
                  //                                   borderRadius: BorderRadius.circular(5),
                  //                                   child: vendorList.list[index].pp.isEmpty
                  //                                       ? Image.asset(
                  //                                           "assets/images/logo.png",
                  //                                           fit: BoxFit.fill,
                  //                                         )
                  //                                       : Image.network(
                  //                                           Constant.logo_Image_mv + vendorList.list[index].pp,
                  //                                           fit: BoxFit.fill,
                  //                                         ),
                  //                                 ),
                  //                               ),
                  //                               SizedBox(height: 10),
                  //                               Text(
                  //                                 vendorList.list[index].company,
                  //                                 maxLines: 2,
                  //                                 style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         ),
                  //                       );
                  //                     })
                  //                 : Center(
                  //                     child: Container(
                  //                         child: Center(
                  //                       child: CircularProgressIndicator(
                  //                         color: AppColors.tela,
                  //                       ),
                  //                     )),
                  //                   );
                  //           },
                  //           future: getMV(subCatList.last.pcatId)),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.push(
                  //         context, MaterialPageRoute(builder: (context) => VendorsByCat(subCatList.last.pcatId, subCatList.last.pCats)));
                  //   },
                  //   child: Container(
                  //     margin: EdgeInsets.only(left: 15, right: 15),
                  //     height: 50,
                  //     width: MediaQuery.of(context).size.width,
                  //     child: Center(
                  //       child: Text(
                  //         'View All',
                  //         style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.black, fontSize: 12),
                  //       ),
                  //     ),
                  //     decoration: BoxDecoration(
                  //         color: AppColors.red,
                  //         borderRadius: BorderRadius.circular(4),
                  //         border: Border.all(color: AppColors.tela, width: 1)),
                  //   ),
                  // ),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.only(left: 15, top: 15),
                  //         child: Text(
                  //           subCatList1[3].pCats,
                  //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  //         ),
                  //       ),
                  //       FutureBuilder(
                  //           builder: (ctx, snapshot) {
                  //             return snapshot.hasData
                  //                 ? GridView.builder(
                  //                     primary: false,
                  //                     shrinkWrap: true,
                  //                     itemCount: vendorList1.list.isNotEmpty
                  //                         ? vendorList1.list.length < 4
                  //                             ? vendorList1.list.length
                  //                             : 4
                  //                         : 0,
                  //                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //                       crossAxisCount: 2,
                  //                       childAspectRatio: 1.35,
                  //                     ),
                  //                     itemBuilder: (context, index) {
                  //                       return InkWell(
                  //                         onTap: () {
                  //                           Navigator.of(context).push(
                  //                             MaterialPageRoute(
                  //                               builder: (cpntext) => MV_products(
                  //                                   vendorList1.list[index].name,
                  //                                   vendorList1.list[index].mvId,
                  //                                   vendorList1.list[index].cat,
                  //                                   vendorList1.list[index].openTime,
                  //                                   vendorList1.list[index].closeTime),
                  //                             ),
                  //                           );
                  //                         },
                  //                         child: Container(
                  //                           height: 100,
                  //                           width: 200,
                  //                           margin: index.isEven
                  //                               ? EdgeInsets.only(left: 15, bottom: 15, right: 15)
                  //                               : EdgeInsets.only(right: 15, bottom: 15),
                  //                           child: Column(
                  //                             children: [
                  //                               Container(
                  //                                 height: 100,
                  //                                 width: 200,
                  //                                 child: ClipRRect(
                  //                                   borderRadius: BorderRadius.circular(5),
                  //                                   child: vendorList.list[index].pp.isEmpty
                  //                                       ? Image.asset(
                  //                                           "assets/images/logo.png",
                  //                                           fit: BoxFit.fill,
                  //                                         )
                  //                                       : Image.network(
                  //                                           Constant.logo_Image_mv + vendorList1.list[index].pp,
                  //                                           fit: BoxFit.fill,
                  //                                         ),
                  //                                 ),
                  //                               ),
                  //                               SizedBox(height: 10),
                  //                               Text(
                  //                                 vendorList1.list[index].company,
                  //                                 style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         ),
                  //                       );
                  //                     })
                  //                 : Center(
                  //                     child: Container(
                  //                       child: CircularProgressIndicator(
                  //                         color: AppColors.tela,
                  //                       ),
                  //                     ),
                  //                   );
                  //           },
                  //           future: getMV1(subCatList1[3].pcatId)),
                  //       InkWell(
                  //         onTap: () {
                  //           Navigator.push(
                  //               context, MaterialPageRoute(builder: (context) => VendorsByCat(subCatList1[3].pcatId, subCatList1[3].pCats)));
                  //         },
                  //         child: Container(
                  //           margin: EdgeInsets.only(left: 15, right: 15),
                  //           height: 50,
                  //           width: MediaQuery.of(context).size.width,
                  //           child: Center(
                  //             child: Text(
                  //               'View All',
                  //               style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.black, fontSize: 12),
                  //             ),
                  //           ),
                  //           decoration: BoxDecoration(
                  //               color: AppColors.red,
                  //               borderRadius: BorderRadius.circular(4),
                  //               border: Border.all(color: AppColors.tela, width: 1)),
                  //         ),
                  //       ),

                  Container(
                    height: 15,
                    color: AppColors.bgColor,
                  ),
                  // isLoading
                  //       ? Container(
                  //           child: Center(
                  //             child: CircularProgressIndicator(
                  //               color: AppColors.white,
                  //             ),
                  //           ),
                  //         )
                  //       :
                  promotionBanner != null
                      ? promotionBanner.images != 0
                          ? Container(
                              height: 180.0,
                              child: promotionBanner != null
                                  ? promotionBanner != 0
                                      ? CarouselSlider.builder(
                                          itemCount: 1,
                                          options: CarouselOptions(
                                            aspectRatio: 2.4,
                                            viewportFraction: 1,
                                            // enlargeCenterPage: true,
                                            autoPlay: true,
                                          ),
                                          itemBuilder: (ctx, index, realIdx) {
                                            return Container(
                                              child: GestureDetector(
                                                child: Container(
                                                  height: 170,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  margin: EdgeInsets.all(8),
                                                  padding: EdgeInsets.all(10),
                                                  decoration: new BoxDecoration(
//                              color: AppColors.white,

                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: promotionBanner
                                                              .images.isEmpty
                                                          ? AssetImage(
                                                              "assets/images/logo.png")
                                                          : NetworkImage(
                                                              "${Constant.base_url + promotionBanner.path + promotionBanner.images}"),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),

                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                      : Center(
                                          child: CircularProgressIndicator(
                                            backgroundColor: AppColors.tela,
                                          ),
                                        )
                                  : Row())
                          : Container()
                      : Container(),
                  // promotionBanner.images != null
                  //     ? Container(
                  //         margin: EdgeInsets.only(left: 15, right: 15),
                  //         height: 150,
                  //         width: MediaQuery.of(context).size.width,
                  //         child: ClipRRect(
                  //           borderRadius: BorderRadius.circular(10),
                  //           child: Image.network(
                  //             Constant.base_url +
                  //                 promotionBanner.path +
                  //                 promotionBanner.images,
                  //             fit: BoxFit.cover,
                  //           ),
                  //         ),
                  //       )
                  //     : Container(),
                  Container(
                    height: 10,
                    color: AppColors.bgColor,
                  ),

                  /* Container(
//                            color: AppColors.black,
                            height: 280.0,

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius
                                    .circular(0),
                                gradient: LinearGradient(
                                    begin: Alignment
                                        .bottomRight,
                                    colors: [
                                      Colors.blue
                                          .withOpacity(.4),
                                      Colors.teal
                                          .withOpacity(.1),
                                    ]
                                )

                            ),
                            child: topProducts.length != null ? Container(
//                              color: AppColors.tela,
                              margin: EdgeInsets.only(left: 8.0,top:20,bottom: 20),
                              height: 230.0,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: topProducts.length == null
                                      ? 0
                                      : topProducts.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return
                                      Container(
                                        width: topProducts[index]!=0?130.0:230.0,
                                        color: Colors.white,
                                        margin: EdgeInsets.only(right: 10),

                                        child:
                                        Column(
                                          children: <Widget>[

//                                          shape: RoundedRectangleBorder(
//                                            borderRadius: BorderRadius.circular(
//                                                10.0),
//                                          ),

                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ProductDetails(
                                                              topProducts[index])),
                                                );
//
                                              },
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: 130,
//                                            width: 162,

                                                    child: CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      imageUrl: Constant
                                                          .Product_Imageurl +
                                                          topProducts[index].img,
//                                                  =="no-cover.png"? getImage(topProducts[index].productIs):topProducts[index].image,
                                                      placeholder: (context, url) =>
                                                          Center(
                                                              child:
                                                              CircularProgressIndicator()),
                                                      errorWidget:
                                                          (context, url, error) =>
                                                      new Icon(Icons.error),

                                                    ),
                                                  ),





                                                ],
                                              ),
                                            ),


                                            Expanded(
                                              child: Container(
                                                margin: EdgeInsets.only(left: 5,right: 5,top: 5),
                                                padding:EdgeInsets.only(left: 3,right: 5),

                                                color:AppColors.white,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,

                                                  children: <Widget>[
                                                    Text(
                                                      topProducts[index].productName,
                                                      overflow:TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                        fontSize: 12,color:AppColors.black,

                                                      ),
                                                    ),
                                                    SizedBox(height: 8,),

                                                    Text('(\u{20B9} ${topProducts[index].buyPrice})',
                                                      overflow:TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w700,
                                                          fontStyle: FontStyle.italic,fontSize: 12,
                                                          color: AppColors.black,
                                                          decoration: TextDecoration.lineThrough
                                                      ),
                                                    ),
                                                    SizedBox(height: 8,),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 2.0, bottom: 1),
                                                      child: Text('\u{20B9} ${calDiscount(topProducts[index].buyPrice,topProducts[index].discount)}', style: TextStyle(
                                                          color: AppColors.green,
                                                          fontWeight: FontWeight.w700,fontSize: 12
                                                      )),
                                                    ),


                                                  ],
                                                ),
                                              ),
                                            ),





                                          ],
                                        ),
                                      );
                                  }),


                            ) : Center(child: CircularProgressIndicator(
                              backgroundColor: AppColors.tela,
                            ),),
                          ),*/

                  /*Container(
                            color: Colors.white,
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 8.0, left: 8.0, right: 8.0),
                                  child: Text(Constant.AProduct_type_Name2,
                                    style: TextStyle(
                                        color: AppColors.product_title_name,
                                        fontSize: 15,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8.0, top: 8.0, left: 8.0),
                                  child: RaisedButton(
                                      color: Colors.white,
                                      child: Text('View All',
                                          style: TextStyle(
                                              color: Colors.blueGrey)),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>
                                              ProductList("day",
                                                  Constant.AProduct_type_Name2)),
                                        );
                                      }),
                                )
                              ],
                            ),
                          ),*/

                  /* Container(
                            color: Colors.black12,
                            child: GridView.count(
                                physics:ClampingScrollPhysics() ,
                                controller: new ScrollController(keepScrollOffset: false),
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                childAspectRatio: 0.7,
                                padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 0),
                                children: List.generate(dilofdayProducts.length, (index){

                                  return Container(
                                    height: 170,
                                    child: Card(
                                      elevation: 2.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductDetails(
                                                            dilofdayProducts[index])),
                                              );
//
                                            },
                                            child:  SizedBox(
                                              height: 180,
                                              width: double.infinity,
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: Constant
                                                    .Product_Imageurl +
                                                    dilofdayProducts[index].img,
//                                                  =="no-cover.png"? getImage(topProducts[index].productIs):topProducts[index].image,
                                                placeholder: (context, url) =>
                                                    Center(
                                                        child:
                                                        CircularProgressIndicator()),
                                                errorWidget:
                                                    (context, url, error) =>
                                                new Icon(Icons.error),

                                              ),
                                            ),
                                          ),

                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 5,right: 5,top: 5),
                                              padding:EdgeInsets.only(left: 3,right: 5),

                                              color:AppColors.white,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,

                                                children: <Widget>[
                                                  Text(
                                                    dilofdayProducts[index].productName,
                                                    overflow:TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                      fontSize: 12,color:AppColors.black,

                                                    ),
                                                  ),
                                                  SizedBox(height: 4,),

                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('(\u{20B9} ${dilofdayProducts[index].buyPrice})',
                                                        overflow:TextOverflow.ellipsis,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w700,
                                                            fontStyle: FontStyle.italic,fontSize: 12,
                                                            color: AppColors.black,
                                                            decoration: TextDecoration.lineThrough
                                                        ),
                                                      ),

                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 2.0, bottom: 1,right: 10),
                                                        child: Text('\u{20B9} ${calDiscount(dilofdayProducts[index].buyPrice,dilofdayProducts[index].discount)}', style: TextStyle(
                                                            color: AppColors.green,
                                                            fontWeight: FontWeight.w700,fontSize: 12
                                                        )),
                                                      ),

                                                    ],
                                                  ),



                                                ],
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  );

                                })),
                          ),*/

                  /*Container(
                            margin: EdgeInsets.symmetric(vertical: 8.0),
                            height: 138.0,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: dilofdayProducts.length == null
                                    ? 0
                                    : dilofdayProducts.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width: 130.0,

                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      child:
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductDetails(
                                                        dilofdayProducts[index])),
                                          );
//
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            SizedBox(
                                              height: 130,

                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: Constant
                                                    .Product_Imageurl +
                                                    dilofdayProducts[index].img,
//                                                  =="no-cover.png"? getImage(topProducts[index].productIs):topProducts[index].image,
                                                placeholder: (context, url) =>
                                                    Center(
                                                        child:
                                                        CircularProgressIndicator()),
                                                errorWidget:
                                                    (context, url, error) =>
                                                new Icon(Icons.error),

                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),


                          ),*/

                  /*  Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 6.0, left: 8.0, right: 8.0, bottom: 10),
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/banner-2.png'),
                            ),
                          ),
                        )*/
                ],
              ),
              // Builds 1000 ListTiles
              childCount: 1,
            ),
          )
        ]));
  }

  /*Showpop(){
    showDialog(
      barrierDismissible: false, // JUST MENTION THIS LINE
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return WillPopScope(
          onWillPop: () {},
          child: AlertDialog(
              content: Padding(
                padding: const EdgeInsets.all(5.0),
                child:  Container(
                  height: 110.0,
                  width: 320.0,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding:  EdgeInsets.all(5.0),
                          child: Text("New Version is avaliable on Playstore",style: TextStyle(fontSize: 18,color: Colors.black),)
                      ),
//          Padding(
//              padding:  EdgeInsets.all(10.0),
//              child: Text('${_updateInfo.availableVersionCode}',style: TextStyle(fontSize: 18,color: Colors.black),)
//          ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          (_updateInfo.availableVersionCode-valcgeck)<3? FlatButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel !', style: TextStyle(color: AppColors.black, fontSize: 18.0),)):Row(),

                          FlatButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                                // _launchURL();
                              },
                              child: Text('Update ', style: TextStyle(color: AppColors.green, fontSize: 18.0),)),

                        ],
                      )
                    ],
                  ),
                ),
              )
          ),
        );
      },
    );
  }*/

//  showDilogue(BuildContext context) {
//    Dialog errorDialog = Dialog(
//      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
//      //this right here
//      child: Container(
//        height: 160.0,
//        width: 300.0,
//
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Padding(
//                padding: EdgeInsets.all(10.0),
//                child: Text("New Version is avaliable on Playstore",
//                  style: TextStyle(fontSize: 18, color: Colors.black),)
//            ),
////          Padding(
////              padding:  EdgeInsets.all(10.0),
////              child: Text('${_updateInfo.availableVersionCode}',style: TextStyle(fontSize: 18,color: Colors.black),)
////          ),
//
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                FlatButton(
//                    onPressed: () {
//                      Navigator.of(context).pop();
//                    },
//                    child: Text('Cancel !', style: TextStyle(
//                        color: AppColors.black, fontSize: 18.0),)),
//
//                FlatButton(
//                    onPressed: () {
//                      Navigator.of(context).pop();
//                      _launchURL();
//                    },
//                    child: Text('Update Now ', style: TextStyle(
//                        color: AppColors.green, fontSize: 18.0),)),
//
//              ],
//            )
//          ],
//        ),
//      ),
//    );
//    showDialog(
//        context: context, builder: (BuildContext context) => errorDialog);
//  }

  String calGst(String byprice, String sgst) {
    String returnStr;
    double discount = 0.0;
    if (sgst.length > 1) {
      returnStr = discount.toString();
      double byprice1 = double.parse(byprice);
      print(sgst);

      double discount1 = double.parse(sgst);

      discount = ((byprice1 * discount1) / (100.0 + discount1));

      returnStr = discount.toStringAsFixed(2);
      print(returnStr);
      return returnStr;
    } else {
      return '0';
    }
  }

  double sgst1, cgst1, dicountValue, admindiscountprice;

  int total = 000;
  int actualprice = 200;
  double mrp, totalmrp = 000;
  int _count = 1;
  getAddrocatrvalue(Products pro) {
    String mrp_price = calDiscount(pro.buyPrice, pro.discount);
    totalmrp = double.parse(mrp_price);

    double dicountValue = double.parse(pro.buyPrice) - totalmrp;
    String gst_sgst = calGst(mrp_price, pro.sgst);
    String gst_cgst = calGst(mrp_price, pro.cgst);

    String adiscount =
        calDiscount(pro.buyPrice, pro.msrp != null ? pro.msrp : "0");

    admindiscountprice = (double.parse(pro.buyPrice) - double.parse(adiscount));

    String color = "";
    String size = "";
    _addToproducts(
        pro.productIs,
        pro.productName,
        pro.img,
        int.parse(mrp_price),
        int.parse(pro.count),
        color,
        size,
        pro.productDescription,
        gst_sgst,
        gst_cgst,
        pro.discount,
        dicountValue.toString(),
        pro.APMC,
        admindiscountprice.toString(),
        pro.buyPrice);

    setState(() {
//                                                                              cartvalue++;
      Constant.carditemCount++;
      MyApp1State.countval = Constant.carditemCount;
      cartItemcount(Constant.carditemCount);
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyApp1()),
    );
  }

  final DbProductManager dbmanager = new DbProductManager();

  ProductsCart products;
//cost_price=buyprice
  void _addToproducts(
      String pID,
      String p_name,
      String image,
      int price,
      int quantity,
      String c_val,
      String p_size,
      String p_disc,
      String sgst,
      String cgst,
      String discount,
      String dis_val,
      String adminper,
      String adminper_val,
      String cost_price) {
    if (products == null) {
//    print(pID+"......");
//    print(p_name);
//    print(image);
//    print(price);
//    print(quantity);
//    print(c_val);
//    print(p_size);
//    print(p_disc);
//    print(sgst);
//    print(cgst);
//    print(discount);
//    print(dis_val);
//    print(adminper);
//    print(adminper_val);
//    print(cost_price);
      ProductsCart st = new ProductsCart(
          pid: pID,
          pname: p_name,
          pimage: image,
          pprice: (price * quantity).toString(),
          pQuantity: quantity,
          pcolor: c_val,
          psize: p_size,
          pdiscription: p_disc,
          sgst: sgst,
          cgst: cgst,
          discount: discount,
          discountValue: dis_val,
          adminper: adminper,
          adminpricevalue: adminper_val,
          costPrice: cost_price);
      dbmanager.insertStudent(st).then((id) => {
            showLongToast(" Products  is added to cart "),
            print(' Added to Db ${id}')
          });
    }
  }

  String calDiscount(String byprice, String discount2) {
    String returnStr;
    double discount = 0.0;
    returnStr = discount.toString();
    double byprice1 = double.parse(byprice);
    double discount1 = double.parse(discount2);

    discount = (byprice1 - (byprice1 * discount1) / 100.0);

    returnStr = discount.toStringAsFixed(Constant.val);
    print(returnStr);
    return returnStr;
  }

  void _launchMapsUrl(double lat, double lng) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _shairApp() {
    Share.share("Hi, Looking for best deals online? Download " +
        Constant.appname +
        " app form click on this link  https://play.google.com/store/apps/details?id=com.myhomzsolutions");
  }

  void _launchphone(String teli) async {
    final url = 'tel:' + teli;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
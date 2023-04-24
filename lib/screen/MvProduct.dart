import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:maxeyfresh/Auth/forgetPassword.dart';
import 'package:maxeyfresh/Auth/signin.dart';
import 'package:maxeyfresh/BottomNavigation/wishlist.dart';
import 'package:maxeyfresh/General/AppConstant.dart';
import 'package:maxeyfresh/dbhelper/CarrtDbhelper.dart';
import 'package:maxeyfresh/dbhelper/database_helper.dart';
import 'package:maxeyfresh/model/CategaryModal.dart';
import 'package:maxeyfresh/model/ListModel.dart';
import 'package:maxeyfresh/model/productmodel.dart';
import 'package:maxeyfresh/model/slidermodal.dart';
import 'package:maxeyfresh/screen/SearchScreen.dart';
import 'package:maxeyfresh/screen/detailpage.dart';
import 'package:maxeyfresh/screen/vendor_page.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'checkout.dart';

class MV_products extends StatefulWidget {
  final String title;
  final String mvid;
  final String catid;
  final String openTime;
  final String closeTime;
  const MV_products(
      this.title, this.mvid, this.catid, this.openTime, this.closeTime)
      : super();
  @override
  _Sbcategory createState() => _Sbcategory();
}

class _Sbcategory extends State<MV_products> {
  double sgst1, cgst1, dicountValue, admindiscountprice;

  bool product = false;
  List<Products> products = List();
  bool flag = true;
  double mrp, totalmrp = 000;
  int _count = 1;
  List<Products> products1 = List();

  String textval = "Select varient";

  int _current = 0;
  List<Categary> list1 = List();
  void gatinfoCount() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    int Count = pref.getInt("itemCount");
    setState(() {
      if (Count == null) {
        Constant.carditemCount = 0;
      } else {
        Constant.carditemCount = Count;
      }
//      print(Constant.carditemCount.toString()+"itemCount");
    });
  }

  List<Slider1> sliderlist = List<Slider1>();

  @override
  void initState() {
    super.initState();
    gatinfoCount();
    getSliderforMedicalShop(widget.mvid).then((usersFromServe1) {
      if (this.mounted) {
        setState(() {
          sliderlist = usersFromServe1;
        });
      }
    });
    // getSliderforMedicalShop(widget.mvid).then((usersFromServe1) {
    //   if (this.mounted) {
    //     setState(() {
    //       sliderlist = usersFromServe1;
    //
    //     });
    //   }
    // });

    getlist(countval);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          countval = countval + 10;
          getlist(countval);
        });
      }
    });
  }

  int countval = 0;
  ScrollController _scrollController = new ScrollController();

  getlist(int lim) {
    getTServicebymv_id(widget.mvid, widget.catid, lim.toString())
        .then((usersFromServe) {
      setState(() {
        products1.addAll(usersFromServe);
        if (products1.length == 0) {
          product = true;
          print(product);
        }
      });
    });
  }

  double _height;
  double _width;
  @override
  void dispose() {
    _scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.red,
        appBar: AppBar(
          backgroundColor: AppColors.tela,
          leading: InkWell(
            onTap: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                SystemNavigator.pop();
              }
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    widget.title != null ? widget.title : "Product List",
                    maxLines: 2,

                    // overflow:TextOverflow.ellipsis ,
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ),
              // Row(
              //   children: [
              //     SizedBox(
              //       width: 12,
              //     ),
              // InkWell(
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => WishList()),
              //     );
              //   },
              //   child: Stack(
              //     children: <Widget>[
              //       Padding(
              //         padding: EdgeInsets.only(top: 13),
              //         child: Icon(
              //           Icons.add_shopping_cart,
              //           color: Colors.white,
              //         ),
              //       ),
              //       showCircle(),
              //     ],
              //   ),
              // )
              //   ],
              // ),
            ],
          ),
        ),
        body: CustomScrollView(slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
/*
                  sliderlist.length>0? Container(
                      height:MediaQuery.of(context).size.height/4,
                      width: _width,
                      child: Stack(
                        children: <Widget>[
                          PageIndicatorContainer (
                              align: IndicatorAlign.bottom,
                              length:sliderlist.length,
                              indicatorColor: Colors.grey,
                              indicatorSelectorColor: Colors.pink,
                              size: 10.0,
                              indicatorSpace: 10.0,
                              pageView:
                              PageView.builder(
                                  itemCount: sliderlist.length,

                                  itemBuilder: (BuildContext context,int i){

                                    return  Container(
                                      child:   CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl:Constant.Base_Imageurl + sliderlist[i].img,
                                        placeholder: (context, url) =>
                                            Center(
                                                child:
                                                CircularProgressIndicator()),
                                        errorWidget:
                                            (context, url, error) =>
                                        new Icon(Icons.error),

                                      ),
                                    );
                                  })),

                        ],
                      )



//                    Image.network( list.restaurantPhoto!=null?
//                      list.restaurantPhoto:"",
//                      fit: BoxFit.cover,
//                    )

                  ):Container(),


                  SizedBox(height: 20,),*/
                  sliderlist.length > 0
                      ? Container(
                          height: MediaQuery.of(context).size.height / 4,
                          width: _width,
                          child: Stack(
                            children: <Widget>[
                              PageIndicatorContainer(
                                  align: IndicatorAlign.bottom,
                                  length: sliderlist.length,
                                  indicatorColor: Colors.grey,
                                  indicatorSelectorColor: Colors.pink,
                                  size: 10.0,
                                  indicatorSpace: 10.0,
                                  pageView: PageView.builder(
                                      controller: new PageController(),
                                      itemCount: sliderlist.length,
                                      itemBuilder:
                                          (BuildContext context, int i) {
                                        return Container(
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: Constant.Base_Imageurl +
                                                sliderlist[i].img,
                                            placeholder: (context, url) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    new Icon(Icons.error),
                                          ),
                                        );
                                      })),
                            ],
                          )

//                    Image.network( list.restaurantPhoto!=null?
//                      list.restaurantPhoto:"",
//                      fit: BoxFit.cover,
//                    )

                          )
                      : Container(),
                  product
                      ? Container(
                          child: Center(
                            child: Text("No Product is avalible"),
                          ),
                        )
                      : products1.length > 0
                          ? Container(
                              child: ListView.builder(
                                controller: _scrollController,
                                shrinkWrap: true,
                                primary: false,
                                scrollDirection: Axis.vertical,
                                itemCount: products1.length,
                                itemBuilder: (
                                  BuildContext context,
                                  int index,
                                ) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                        left: 10, right: 10, top: 6, bottom: 6),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16))),
                                    child: InkWell(
                                      onTap: () {
                                        //  widget.type=="0"?
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           ProductDetails(
                                        //               products1[index])),
                                        // );
                                      },
                                      child: Container(
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(
                                                  right: 8,
                                                  left: 8,
                                                  top: 8,
                                                  bottom: 8),
                                              width: 110,
                                              height: 110,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(14)),
                                                  color: Colors.blue.shade200,
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,

                                                    image: products1[index]
                                                                .img
                                                                .length > 
                                                            1
                                                        ? NetworkImage(
                                                            Constant.Product_Imageurl +
                                                                products1[index]
                                                                    .img,
                                                          )
                                                        : AssetImage(
                                                            "assets/images/logo.png"),
                                                    // image: AssetImage("assets/images/logo.png"),
                                                  )),
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      child: Text(
                                                        //suggestionList[index].productName==null? 'name':suggestionList[index].productName,
                                                        products1[index]
                                                            .productName,
                                                        overflow:
                                                            TextOverflow.fade,
                                                        style: TextStyle(
                                                                fontSize: 19,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                                color: Colors
                                                                    .black)
                                                            .copyWith(
                                                                fontSize: 16),
                                                      ),
                                                    ),
                                                    SizedBox(height: 6),

                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 2.0,
                                                              bottom: 1),
                                                      child: Text(
                                                          '\u{20B9} ${calDiscount(products1[index].buyPrice, products1[index].discount)}',
                                                          style: TextStyle(
                                                            color:
                                                                AppColors.sellp,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          )),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      // crossAxisAlignment: CrossAxisAlignment.end,
                                                      children: <Widget>[
                                                        Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 30,
                                                                    top: 10),
                                                            height: 35,
                                                            width: 100,
                                                            child: Material(
                                                              color: AppColors
                                                                  .sellp,
                                                              elevation: 0.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                side:
                                                                    BorderSide(
                                                                  color:
                                                                      AppColors
                                                                          .sellp,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          5),
                                                                ),
                                                              ),
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              child: InkWell(
                                                                onTap: () {
                                                                  if (Constant
                                                                      .isLogin) {
                                                                    // Navigator
                                                                    //     .push(
                                                                    //   context,
                                                                    //   MaterialPageRoute(
                                                                    //       builder: (context) => VendorPage(
                                                                    //           products1[index],
                                                                    //           widget.openTime,
                                                                    //           widget.closeTime)),
                                                                    // );
                                                                    _addToproducts1(
                                                                        context,
                                                                        index);
                                                                  } else {
                                                                    Navigator
                                                                        .push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              SignInPage()),
                                                                    );
                                                                  }
                                                                },
                                                                child: Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left:
                                                                            18,
                                                                        top: 5,
                                                                        bottom:
                                                                            5,
                                                                        right:
                                                                            8),
                                                                    child: Center(
                                                                        child: Text(
                                                                      "Book Now",
                                                                      style: TextStyle(
                                                                          color: AppColors
                                                                              .red,
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ))),
                                                              ),
                                                            )),
                                                      ],
                                                    ),

                                                    //  widget.type=="0"?
                                                    /*Container(
                                      margin: EdgeInsets.only(left: 0.0,right: 10),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: <Widget>[
                                            SizedBox(width: 0.0,height: 10.0,),

                                            Column(
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: <Widget>[
                                                    Container(
                                                        height: 25,
                                                        width: 35,
                                                        child:
                                                        Material(

                                                          color: AppColors.teladep,
                                                          elevation: 0.0,
                                                          shape: RoundedRectangleBorder(
                                                            side: BorderSide(
                                                              color: Colors.white,
                                                            ),
                                                            borderRadius: BorderRadius.all(
                                                              Radius.circular(15),
                                                            ),
                                                          ),
                                                          clipBehavior: Clip.antiAlias,
                                                          child:Padding (
                                                            padding: EdgeInsets.only(bottom: 10),
                                                            child: InkWell(
                                                                onTap: () {
                                                                  print(suggestionList[index].count);
                                                                  if(suggestionList[index].count!="1"){
                                                                    setState(() {
//                                                                                _count++;

                                                                      String  quantity=suggestionList[index].count;
                                                                      int totalquantity=int.parse(quantity)-1;
                                                                      suggestionList[index].count=totalquantity.toString();

                                                                    });
                                                                  }



//



                                                                },
                                                                child:Padding(padding: EdgeInsets.only(top:10.0,),

                                                                  child:Icon(
                                                                    Icons.maximize,size: 20,
                                                                    color: Colors.white,
                                                                  ),


                                                                )
                                                            ),
                                                          ),
                                                        )),

                                                    Padding(
                                                      padding:
                                                      EdgeInsets.only(top: 0.0, left: 15.0, right: 8.0),
                                                      child:Center(
                                                        child:
                                                        Text(suggestionList[index].count!=null?'${suggestionList[index].count}':'$_count',

                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 19,
                                                                fontFamily: 'Roboto',
                                                                fontWeight: FontWeight.bold)),

                                                      ),),

                                                    Container(
                                                        margin: EdgeInsets.only(left: 3.0),
                                                        height: 25,
                                                        width: 35,
                                                        child:
                                                        Material(

                                                          color: AppColors.teladep,
                                                          elevation: 0.0,
                                                          shape: RoundedRectangleBorder(
                                                            side: BorderSide(
                                                              color: Colors.white,
                                                            ),
                                                            borderRadius: BorderRadius.all(
                                                              Radius.circular(15),
                                                            ),
                                                          ),
                                                          clipBehavior: Clip.antiAlias,
                                                          child: InkWell(
                                                            onTap: () {
                                                              if(int.parse(suggestionList[index].count) <= int.parse(suggestionList[index].quantityInStock)){
                                                                setState(() {
//                                                                                _count++;

                                                                  String  quantity=suggestionList[index].count;
                                                                  int totalquantity=int.parse(quantity)+1;
                                                                  suggestionList[index].count=totalquantity.toString();

                                                                });
                                                              }
                                                              else{
                                                                showLongToast('Only  ${suggestionList[index].count}  products in stock ');
                                                              }


                                                            },


                                                            child:Icon(
                                                              Icons.add,size: 20,
                                                              color: Colors.white,
                                                            ),


                                                          ),
                                                        )),
                                                  ],
                                                )
                                              ],
                                            ),
                                            // SizedBox(width: 25,),

                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: <Widget>[

                                                Container(
                                                    margin: EdgeInsets.only(left: 3.0),
                                                    height: 35,

                                                    child:
                                                    Material(

                                                      color: AppColors.sellp,
                                                      elevation: 0.0,
                                                      shape: RoundedRectangleBorder(
                                                        side: BorderSide(
                                                          color: Colors.white,
                                                        ),
                                                        borderRadius: BorderRadius.all(
                                                          Radius.circular(20),
                                                        ),
                                                      ),
                                                      clipBehavior: Clip.antiAlias,
                                                      child: InkWell(
                                                        onTap: () {
                                                          if(Constant.isLogin){


                                                            String  mrp_price=calDiscount(suggestionList[index].buyPrice,suggestionList[index].discount);
                                                            totalmrp= double.parse(mrp_price);


                                                            double dicountValue=double.parse(suggestionList[index].buyPrice)-totalmrp;
                                                            String gst_sgst=calGst(mrp_price,suggestionList[index].sgst);
                                                            String gst_cgst=calGst(mrp_price,suggestionList[index].cgst);

                                                            String  adiscount=calDiscount(suggestionList[index].buyPrice,suggestionList[index].msrp!=null?suggestionList[index].msrp:"0");

                                                            admindiscountprice=(double.parse(suggestionList[index].buyPrice)-double.parse(adiscount));



                                                            String color="";
                                                            String size="";
                                                            _addToproducts(suggestionList[index].productIs,suggestionList[index].productName,suggestionList[index].img,int.parse(mrp_price),int.parse(suggestionList[index].count),color,size,suggestionList[index].productDescription,gst_sgst,gst_cgst,
                                                                suggestionList[index].discount,dicountValue.toString(), suggestionList[index].APMC, admindiscountprice.toString(),suggestionList[index].buyPrice,suggestionList[index].shipping,suggestionList[index].quantityInStock);


                                                            setState(() {
//                                                                              cartvalue++;
                                                              Constant.carditemCount++;
                                                              cartItemcount(Constant.carditemCount);

                                                            });

//                                                                Navigator.push(context,
//                                                                  MaterialPageRoute(builder: (context) => MyApp1()),);

                                                          }
                                                          else{


                                                            Navigator.push(context,
                                                              MaterialPageRoute(builder: (context) => SignInPage()),);
                                                          }

//

                                                        },
                                                        child:Padding(padding: EdgeInsets.only(left: 8,top: 5,bottom: 5,right: 8),
                                                            child:Center(

                                                              child:Icon(Icons.add_shopping_cart,color: Colors.white,),

                                                            )),),
                                                    )),









                                              ],
                                            ),






                                          ]
                                      ) ,
                                    )*/ //Row():
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Center(child: CircularProgressIndicator())
                  //  : Container(
                  // child: Center(
                  //   child: Text("No product is avaliable"),)),

                  // )

//            showTab(),
                ],
              ),
              childCount: 1,
            ),
          )
        ]));
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

  int total;

  _displayDialog(BuildContext context, String id, int index1) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            title: Text('Select Varant'),
            content: Container(
              width: double.maxFinite,
              height: 200,
              child: FutureBuilder(
                  future: getPvarient(id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length == null
                              ? 0
                              : snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: snapshot.data[index] != 0 ? 130.0 : 230.0,
                              color: Colors.white,
                              margin: EdgeInsets.only(right: 10),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    products1[index1].buyPrice =
                                        snapshot.data[index].price;
                                    products1[index1].discount =
                                        snapshot.data[index].discount;

                                    // total= int.parse(snapshot.data[index].price);
                                    // String  mrp_price=calDiscount(snapshot.data[index].price,snapshot.data[index].discount);
                                    // totalmrp= double.parse(mrp_price);
                                    products1[index1].youtube =
                                        snapshot.data[index].variant;

                                    Navigator.pop(context);
                                  });
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Text(
                                        snapshot.data[index].variant,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: AppColors.black,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  final DbProductManager dbmanager = new DbProductManager();

  ProductsCart products2;
  //   final DbProductManager dbmanager = new DbProductManager();
  // ProductsCart products;

  void _addToproducts1(BuildContext context, index) {
    if (products2 == null) {
      print(products1[index].img);
      dbmanager.deleteallProducts();
      String amount =
          calDiscount(products1[index].buyPrice, products1[index].discount);
      Constant.totalAmount = double.parse(amount);
      ProductsCart st = new ProductsCart(
          pid: products1[index].productIs,
          pname: products1[index].productName,
          pimage: products1[index].img,
          pprice:
              calDiscount(products1[index].buyPrice, products1[index].discount),
          pQuantity: 1,
          pcolor: "",
          psize: "",
          pdiscription: products1[index].productDescription,
          sgst: "0",
          cgst: "0",
          discount: products1[index].discount,
          discountValue: "0",
          adminper: products1[index].msrp,
          adminpricevalue: "",
          costPrice: products1[index].buyPrice,
          shipping: products1[index].shipping,
          totalQuantity: products1[index].quantityInStock,
          varient: "",
          mv: int.parse(products1[index].mv));
      dbmanager.insertStudent(st).then((id) => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckOutPage("", "")),
            ),
            print('Student Added to Db ${id}')
          });
    }
  }

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
      String cost_price,
      String shippingcharge,
      String totalQun,
      String varient,
      String mv) {
    if (products2 == null) {
//      print(pID+"......");
//      print(p_name);
//      print(image);
//      print(price);
//      print(quantity);
//      print(c_val);
//      print(p_size);
//      print(p_disc);
//      print(sgst);
//      print(cgst);
//      print(discount);
//      print(dis_val);
//      print(adminper);
//      print(adminper_val);
//      print(cost_price);
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
          costPrice: cost_price,
          shipping: shippingcharge,
          totalQuantity: totalQun,
          varient: varient,
          mv: int.parse(mv));
      dbmanager.insertStudent(st).then((id) => {
            showLongToast(" Products  is added to cart "),
            print(' Added to Db ${id}')
          });
    }
  }

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
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maxeyfresh/BottomNavigation/screenpage.dart';
import 'package:maxeyfresh/General/AnimatedSplashScreen.dart';
import 'package:maxeyfresh/General/AppConstant.dart';
import 'package:maxeyfresh/dbhelper/database_helper.dart';
import 'package:maxeyfresh/fadeanimation/animation.dart';
import 'package:maxeyfresh/model/CategaryModal.dart';
import 'package:maxeyfresh/model/Gallerymodel.dart';
import 'package:maxeyfresh/model/ListModel.dart';
import 'package:maxeyfresh/model/productmodel.dart';
import 'package:maxeyfresh/model/promotion_banner.dart';
import 'package:maxeyfresh/model/slidermodal.dart';
import 'package:maxeyfresh/model/vendor_details.dart';
import 'package:maxeyfresh/screen/productlist.dart';
import 'package:maxeyfresh/screen/sub_cats.dart';
import 'package:maxeyfresh/screen/vendors_by_cat.dart';
import 'package:new_version/new_version.dart';

class Cgategorywisepro extends StatefulWidget {
  @override
  _CgategorywiseproState createState() => _CgategorywiseproState();
}

class _CgategorywiseproState extends State<Cgategorywisepro> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: list != null
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
    );
  }
}

/*


class ExpandableListView extends StatefulWidget {
  final String title;
  final String id;

  const ExpandableListView(this.title,this.id) : super();
  @override
  _ExpandableListViewState createState() => new _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {
  bool expandFlag = false;
  bool expandFlag1 = false;
  List<Categary> list = List();
  static int size;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    list.clear();
  }
  @override
  void initState() {

    DatabaseHelper.getData(widget.id).then((usersFromServe){
      if(this.mounted) {
        setState(() {
          list = usersFromServe;
          size = list.length;
//        for(var i=0;i<list.length;i++){
//          print(list[i].img);
//        }
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: new Column(
        children: <Widget>[
          new Container(
            color: AppColors.white,
            padding: new EdgeInsets.symmetric(horizontal: 5.0),
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen2(widget.id,widget.title)),
                );
              },
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new IconButton(
                        icon: new Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: new BoxDecoration(
                            color: AppColors.category_button_Icon_color,
                            shape: BoxShape.circle,
                          ),
                          child: new Center(
                            child: new Icon(
                              expandFlag ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            expandFlag = !expandFlag;
                          });
                        }),
                    Expanded(
                      child: Text(
                        widget.title,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ) ,


                  ],
                ),),
            ),
          ),
          new ExpandableContainer(
              expanded: expandFlag,

              expandedHeight:list.length>0?list.length*60.0:1.0,
              child:  ListView.builder(
                physics: ClampingScrollPhysics(),
                 itemBuilder: (BuildContext context, int index) {
                  return new Container(
                    decoration:
                    new BoxDecoration(border: new Border.all(width: 1.0, color: AppColors.tela), color: AppColors.tela),
                    child: InkWell(
                      onTap: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Screen2(list[index].pcatId,list[index].pCats)),
                        );
                      },
                      child:  Column(
                        children: <Widget>[
                          ListTile(
                            title:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    list[index].pCats,
                                    overflow: TextOverflow.ellipsis,
                                    style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.black ),
                                  ),
                                ),

                                IconButton(
                                    icon: new Container(
                                      height: 50.0,
                                      width: 50.0,
                                      decoration: new BoxDecoration(
                                        color: AppColors.category_button_Icon_color,
                                        shape: BoxShape.circle,
                                      ),
                                      child: new Center(
                                        child: new Icon(
                                          list[index].ff=="1" ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {

                                        if(list[index].ff=="1"){
                                          list[index].ff="0";

                                        }
                                        else{
                                          list[index].ff="1";

                                        }
                                        expandFlag1 = !expandFlag1;
                                      });
                                    }),

                              ],
                            ),
                            leading:ClipOval(
                              child:list[index].img!=""?  Image.network(
                                Constant.base_url+"manage/uploads/p_category/"+
                                    list[index].img,
                                fit: BoxFit.cover,
                                height: 40.0,
                                width: 40.0,
                              ):new Icon(Icons.image,color: Colors.black,),

                            ),


                          ),

                          list[index].ff=="1"?Row():Container(
//                            height: 100,
                            child: FutureBuilder(
                              future: getData(list[index].pcatId),
                              builder: (context,snapshot){
                                if(snapshot.hasData){
                                  return ListView.builder(
                                    physics: ClampingScrollPhysics(),

                                    itemBuilder: (BuildContext context, int index) {
                                      Categary cat =snapshot.data[index];
                                      return Container(
                                        color: AppColors.white,
                                        child: InkWell(
                                          onTap: (){

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => Screen2(cat.pcatId,cat.pCats)),
                                            );
                                          },
                                          child: ListTile(
                                            title:  Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Text(
                                                    cat.pCats,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.black ),
                                                  ),
                                                ),



                                              ],
                                            ),
                                            leading:ClipOval(
                                              child:cat!=""?  Image.network(
                                                Constant.base_url+"manage/uploads/p_category/"+
                                                    cat.img,
                                                fit: BoxFit.cover,
                                                height: 40.0,
                                                width: 40.0,
                                              ):new Icon(Icons.image,color: Colors.black,),

                                            ),


                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: snapshot.data.length,
                                    shrinkWrap: true,
                                  );
                                }
                                return Center(child: CircularProgressIndicator());
                              },
                            ),
                          )


                        ],
                      ),
                    ),
                  );
                },
                itemCount: list.length,
              )),




        ],
      ),
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded ;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  ExpandableContainer({
    @required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight,
    this.expanded,
  });


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return new AnimatedContainer(
      duration: new Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? expandedHeight : collapsedHeight,
      child: new Container(
        child: child,
        decoration: new BoxDecoration(border: new Border.all(width: 1.0, color: AppColors.telamoredeep)),
      ),
    );
  }
}*/

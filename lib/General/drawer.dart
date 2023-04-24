import 'package:flutter/material.dart';
import 'package:maxeyfresh/Auth/forgetPassword.dart';
import 'package:maxeyfresh/Auth/signin.dart';
import 'package:maxeyfresh/General/AppConstant.dart';
import 'package:maxeyfresh/General/Home.dart';
import 'package:maxeyfresh/dbhelper/database_helper.dart';
import 'package:maxeyfresh/screen/CustomeOrder.dart';
import 'package:maxeyfresh/screen/choosevendertype.dart';
import 'package:maxeyfresh/screen/newWishlist.dart';
import 'package:maxeyfresh/screen/productlist.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:share/share.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {


  bool islogin= false;
  String name,email,image,cityname;
  int wcount;
  SharedPreferences pref;
  void gatinfo() async {
    pref= await SharedPreferences.getInstance();
    islogin=pref.get("isLogin");
    int wcount1=pref.get("wcount");
    name=pref.get("name");
    email=pref.get("email");
    image=pref.get("pp");
    cityname=pref.get("city");
    if(islogin==null){
      islogin= false;
    }

    // print(islogin);
    setState(() {
      Constant.name=name;
      Constant.email=email;
      islogin==null?Constant.isLogin=false:Constant.isLogin=islogin;
      Constant.image=image;
      print( Constant.image);

      Constant.citname=cityname;

      // print( Constant.image.length);
      wcount=wcount1;
    });

  }

  bool check= false;
  _displayDialog(BuildContext context) async {

    return showDialog(
        context: context,
        barrierDismissible:false,
        builder: (context) {
          return AlertDialog(
            scrollable:true,
            title: Text('Select City'),
            content: Container(
              width: double.maxFinite,
              height:400,
              child: FutureBuilder(
                  future: getPcity(),
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      return  ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length == null
                              ? 0
                              : snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return
                              Container(
                                width: snapshot.data[index]!=0?130.0:230.0,
                                color: Colors.white,
                                margin: EdgeInsets.only(right: 10),

                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      check=true;
                                      pref.setString('city', snapshot.data[index].places);
                                      pref.setString('cityid', snapshot.data[index].loc_id);
                                      Constant.cityid= snapshot.data[index].loc_id;
                                      Constant.citname= snapshot.data[index].places;

                                      Navigator.pop(context);

                                      Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp1()),);


                                    });

                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Card(
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,

                                          padding: EdgeInsets.all(10),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 10,right: 10),
                                            child: Text(
                                              snapshot.data[index].places,
                                              overflow:TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 15,color:AppColors.black,

                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Divider(
                                      //
                                      //   color: AppColors.black,
                                      // ),





                                    ],
                                  ),
                                ),







                              )
                            ;
                          });

                    }
                    return Center(child: CircularProgressIndicator());


                  }
              )


              ,
            ),
            actions: <Widget>[
              new FlatButton(
                child: Text('CANCEL',style: TextStyle(color:check? Colors.green:Colors.grey),),
                onPressed: () {
                  check? Navigator.of(context).pop():showLongToast("Please Select city");
                },
              )
            ],
          );
        });
  }
  @override
  void initState() {

    gatinfo();


    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),

      child: Column(
        children: <Widget>[
          Container(
            color: AppColors.tela1,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 40,left: 20),
                  color: AppColors.tela1,
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  child:CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.white,
                    child: ClipOval(
                      child: new SizedBox(
                        width: 100.0,
                        height: 100.0,
                        child:Constant.image==null? Image.asset('assets/images/logo.png',):Constant.image.length==1?Image.asset('assets/images/logo.png',):Constant.image=="https://www.bigwelt.com/manage/uploads/customers/nopp.png"? Image.asset('assets/images/logo.png',):Image.network(
                          Constant.image,
                          fit: BoxFit.fill,),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20),
                  child:Text(islogin?Constant.name:" ",style: TextStyle(color: Colors.black),) ,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20,bottom: 20),
                  child:Text(islogin?Constant.email:" ",style: TextStyle(color: Colors.black),),
                ),
            /*    InkWell(
                  onTap: (){
                    _displayDialog(context);
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20,bottom: 20),
                    child:Text(Constant.citname!=null?Constant.citname:" ",
                      overflow:TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(color: Colors.black),),
                  ),
                ),*/
              ],
            ),
          ),


          /* UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/drawer-header.jpg'),
                )),
            currentAccountPicture:  CircleAvatar(
              radius:30,
              backgroundColor: Colors.black,
              backgroundImage:Constant.image==null? AssetImage('assets/images/logo.jpg',):Constant.image.length==1?AssetImage('assets/images/logo.jpg',):Constant.image=="https://www.bigwelt.com/manage/uploads/customers/nopp.png"? AssetImage('assets/images/logo.jpg',):NetworkImage(
                  Constant.image),
            ),
            accountName: Text(islogin?Constant.name:" ",style: TextStyle(color: Colors.black),),
            accountEmail: Text(islogin?Constant.email:" ",style: TextStyle(color: Colors.black),),
          ),*/
          Container(
            child: ListView(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.home, color:  AppColors.tela),
                  title: Text('Home'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp1()),
                    );
                  },
                ),
                // ListTile(
                //   leading: Icon(Icons.shopping_basket,
                //       color: Theme.of(context).accentColor),
                //   title: Text('Deals of the Day'),
                //   trailing: Text('New',
                //       style: TextStyle(color: Theme.of(context).primaryColor)),
                //   onTap: () {
                //     Navigator.of(context).pop();
                //
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => ProductList("day","DEALS OF THE DAY")),
                //     );
                //   },
                // ),


                // ListTile(
                //   leading: Icon(Icons.tonality,
                //       color: Theme.of(context).accentColor),
                //   title: Text('Top Products'),
                //   trailing: Text('',
                //       style: TextStyle(color: Theme.of(context).primaryColor)),
                //   onTap: () {
                //     Navigator.of(context).pop();
                //
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => ProductList("top","TOP PRODUCTS")),
                //     );
                //   },
                // ),






                /*ListTile(
                  leading: Icon(Icons.network_check,
                      color: Theme.of(context).accentColor),
                  title: Text('Trending'),
                  trailing: Text('',
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                  onTap: () {
                    Navigator.of(context).pop();

                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ProductList(
                            "Top", Constant
                            .AProduct_type_Name1)),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.traffic,
                      color: Theme.of(context).accentColor),
                  title: Text('New Arrival'),
                  trailing: Text('',
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                  onTap: () {
                    Navigator.of(context).pop();

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          ProductList("day",
                              Constant.AProduct_type_Name2)),);
                  },
                ),*/
                ListTile(
                  leading:
                  Icon(Icons.phone_android_sharp, color: AppColors.tela),
                  title: Text('Contact Us'),
                  onTap: () {
                    Navigator.of(context).pop();

                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CustomeOrder())
//                        NewWishList()),
//                      Cat_Product
                    );
                  },
                ),
/*
                ListTile(
                  leading:
                  Icon(Icons.location_on_outlined, color: Theme.of(context).accentColor),
                  title: Text('One Day Delivery'),
                  onTap: () {
                    Navigator.of(context).pop();

                    Navigator.push(context, MaterialPageRoute(builder: (context) => SelectButton())
//                        NewWishList()),
//                      Cat_Product
                    );
                  },
                ),
*/
                ListTile(
                  leading: Icon(Icons.share,
                      color: AppColors.tela),
                  title: Text('Share app'),
                  onTap: () {
                    _shairApp();
                  },
                ),

                Constant.isLogin?new Container():
                ListTile(
                  leading: Icon(Icons.lock, color:  AppColors.tela),
                  title: Text('Login'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPass()),);


                    // Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()),);
                  },
                ),
                Divider(),
//              ListTile(
//                leading:
//                    Icon(Icons.settings, color: Theme.of(context).accentColor),
//                title: Text('Settings'),
//                onTap: () {
//
//                },
//              ),
                Constant.isLogin? ListTile(
                  leading: Icon(Icons.exit_to_app,
                      color:  AppColors.tela),
                  title: Text('Logout'),
                  onTap: () async {
                    _callLogoutData();
                  },
                ):new Container()
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _callLogoutData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Constant.isLogin = false;
    Constant.email = " ";
    Constant.name = " ";
    Constant.image = " ";
    pref.setString("pp"," " );
    pref.setString("email", " ");
    pref.setString("name", " ");
    pref.setBool("isLogin", false);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignInPage()));
  }


  _shairApp(){

    Share.share("Hi, Looking for best deals online? Download "+Constant.appname+" app form click on this link  https://play.google.com/store/apps/details?id=com.myhomzsolutions");
  }
}

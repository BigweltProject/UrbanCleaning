import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:maxeyfresh/General/AppConstant.dart';
import 'package:maxeyfresh/General/Home.dart';
import 'package:maxeyfresh/model/UserUpdateModel.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
class Uploadimage extends StatefulWidget {
  final String userid;
  final String usename;
  const Uploadimage(this.userid,this.usename):super();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Uploadimage> {
  bool _status = false;
  final FocusNode myFocusNode = FocusNode();
  Future<File> file;
  String status = '';
  String base64Image,imagevalue;
  File _image,imageshow1;
  String errMessage = 'Error Uploading Image';
  String user_id ;
  String url = "http://chuteirafc.cartacapital.com.br/wp-content/uploads/2018/12/15347041965884.jpg";

  var _formKey=GlobalKey<FormState>();


  final profilescaffoldkey =new GlobalKey<ScaffoldState>();
  final resignofcause = TextEditingController();
  String _dropDownValue1=" ";
  Future<File> profileImg;



  @override
  void initState() {
    getUserInfo();
    super.initState();
//    getImaformation();
  }







String username1;

  Future<void> getUserInfo() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    String name= pre.getString("name");
    String email= pre.getString("email");
    String username= pre.getString("user_name");
    String pin= pre.getString("pin");
    String city= pre.getString("city");
    String address= pre.getString("address");
    String sex= pre.getString("sex");
    String image= pre.getString("pp");
    user_id=pre.getString("user_id");
    print(user_id);


    this.setState(() {
      username1=username;
      resignofcause.text=address;
      _dropDownValue1=sex;
      Constant.image=image;

      url=Constant.image;


    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

          elevation: 0.0,
          backgroundColor: AppColors.tela,

          title: Text("Upload Shop  Image",style: TextStyle(color: Colors.white),)
      ),
      key: profilescaffoldkey,
      body:Container(
        color: Colors.white,
        child: new ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                new Container(
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: new Stack(fit: StackFit.loose, children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Align(
//                              alignment: Alignment.center,
                                child:
                                InkWell(
                                  onTap: (){
                                    setState(() {




                                    });
                                  },
                                  child:Container(
                                    height: 250,
                                    width: MediaQuery.of(context).size.width-50,
                                    margin: EdgeInsets.only(left: 0,right: 0),
                                    child:Card(
                                      child: _image!=null?Image.file(
                                                _image,
                                                fit: BoxFit.fill,
                                              ):Image.asset("assets/images/logo.png"),
                                    )
                                  )
                                  
                                ),
                              ),

                            ],
                          ),

                        ]),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),

                flag?circularIndi():Container(),
                camera?showIcone(context):Container(),

                SizedBox(height: 30,),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      if(camera){
                        camera=false;
                      }else{
                        camera=true;

                      }
                    });

                  },
                  color: AppColors.tela,
                  padding: EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  child: Text(
                    "Upload the Image",style: TextStyle(color: AppColors.white),

                  ),
                ),




              ],
            ),
          ],
        ),
      ),);
  }


  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }


  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Save"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {


                      if(_formKey.currentState.validate() ){


                        if(resignofcause.text.length>5){
                          // _getEmployee();

                        }
                        else{
                          showLongToast("Please add the address");
                        }

                      }



//                        _status = true;
                      FocusScope.of(context).requestFocus(new FocusNode());

                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Cancel"),
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {

                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      } else {
                        SystemNavigator.pop();
                      }
                      setState(() {
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

//

  Future _ImageUpdate() async {
    var map = new Map<String, dynamic>();
    map['pp'] = "data:image/png;base64,"+base64Image;
    map['user_id'] = widget.userid;
    map['mobile'] = widget.usename;
    map['type'] = "base64";
   print(base64Image);
   print(widget.userid);
   print(widget.usename);
    try {
      final response = await http.post(
          Constant.base_url + 'api/ppupload.php', body: map);
      if (response.statusCode == 200) {
        print(response.toString());
        U_updateModal user = U_updateModal.fromJson(jsonDecode(response.body));

        _showLongToast(user.message);
        SharedPreferences pref= await SharedPreferences.getInstance();
        pref.setString("pp",user.img);
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp1()),);

        setState(() {
          flag=false;
          Constant.image=user.img;
          Constant.check=true;

        });
        print(user.img);
      }
      else
        throw Exception("Unable to get Employee list");
    }catch(Exception){

    }
  }




  void _showLongToast(String message){

    final snackbar= new SnackBar(
        content: Text("$message")
    );
    profilescaffoldkey.currentState.showSnackBar(snackbar);
  }


  Widget profile(BuildContext context){
    return  Container(
      margin: EdgeInsets.only(
          top: 140
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: (){
                setState(() {
                  if(camera){
                    camera=false;
                  }else{
                    camera=true;

                  }

                });
              },
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.orange,
                child: ClipOval(
                  child: new SizedBox(
                    width: 150.0,
                    height: 150.0,
                    child:_image!=null?Image.file(
                      _image,
                      fit: BoxFit.fill,
                    ):Image.network(
                      url,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10,),
            camera?showIcone(context):Container(),
          ],
        ),
      ),
    );
  }

  bool camera= false;

  // Widget submitImage(){
  //   return Container(
  //     child: InkWell(
  //         onTap: (){
  //           _ImageUpdate();
  //
  //         },
  //         child: Text("Submit")),
  //   );
  // }


  Widget showIcone(BuildContext context){
    return   Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // SizedBox(height: 40,),

        InkWell(
            onTap: (){
              getImageC(context);
//              getImage12();

              setState(() {
                camera=false;

              });
            },
            child: Icon(Icons.camera_alt,size: 35,)),
        SizedBox(width: 40,),
        InkWell(
            onTap: (){

              getImage(context);
              setState(() {
                camera=false;

              });
            },
            child: Icon(Icons.storage,size: 35,)),

      ],
    );
  }

  getImage(BuildContext context) async {
    imageshow1 = await ImagePicker.pickImage(source: ImageSource.gallery);

    String imagevalue1 = (imageshow1).toString();
    if(imagevalue1!=null) {
      imagevalue =imagevalue1!=null?
      imagevalue1.substring(7, (imagevalue1.lastIndexOf('') - 1)).trim():imagevalue1;

//    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        base64Image = base64Encode(imageshow1.readAsBytesSync());
        _image = new File('$imagevalue');
        print('Image Path $_image');
        _ImageUpdate();
        flag=true;
      });
    }
  }

  getImageC(BuildContext context) async {
    imageshow1 = await ImagePicker.pickImage(source:ImageSource.camera);
    String imagevalue1 = (imageshow1).toString();
    if(imagevalue1!=null) {
      imagevalue1.length > 7?imagevalue = imagevalue1.substring(7,(imagevalue1.lastIndexOf('') - 1)).trim():imagevalue1;

//    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        base64Image = base64Encode(imageshow1.readAsBytesSync());
        _image = new File('$imagevalue');
        print('Image Path $_image');
        _ImageUpdate();
        flag=true;
      });
    }
  }
  // final picker = ImagePicker();
  //
  // Future getImage12() async {
  //   final pickedFile = await picker.getImage(source: ImageSource.camera);
  //
  //   setState(() {
  //     _image = File(pickedFile.path);
  //     base64Image = base64Encode(_image.readAsBytesSync());
  //     _ImageUpdate();
  //
  //   });
  // }
  bool flag= false;
  Widget circularIndi(){
    return  Align(
      alignment: Alignment.center,
      child: Center(
        child:  CircularProgressIndicator(),
      ),
    );
  }
}

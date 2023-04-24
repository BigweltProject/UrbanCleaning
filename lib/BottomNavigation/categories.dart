import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maxeyfresh/BottomNavigation/Category2.dart';
import 'package:maxeyfresh/General/AppConstant.dart';
import 'package:maxeyfresh/dbhelper/database_helper.dart';
import 'package:maxeyfresh/fadeanimation/animation.dart';
import 'package:maxeyfresh/model/CategaryModal.dart';
import 'package:maxeyfresh/screen/productlist.dart';
import 'package:maxeyfresh/screen/sub_cats.dart';
import 'package:maxeyfresh/screen/vendors_by_cat.dart';

class Cgategorywise extends StatefulWidget {
  @override
  _CgategorywiseState createState() => _CgategorywiseState();
}

class _CgategorywiseState extends State<Cgategorywise> {
  List<Categary> list = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
          child: FutureBuilder(
        future: get_Category("0"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: ClampingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                Categary cat = snapshot.data[index];
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              Cgategorywisepro()),
                        );

                        // Navigator.push(context, MaterialPageRoute(builder: (context) => Sbcategory(cat.pCats, i)),);
                      },
                      child: Stack(
                        children: [
                          FadeAnimation(0.4,
                            Container(
                              // decoration: BoxDecoration(
                              //   borderRadius: BorderRadius.circular(16.0),),
                          
                              margin: EdgeInsets.only(
                                  top: 3, bottom: 10, left: 10, right: 10),
                              height: 220,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                color:  Color(0xFF6b7379),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              bottomLeft: Radius.circular(15),
                                            ),
                                          ),
                                          // width:
                                          //     (MediaQuery.of(context).size.width /
                                          //             2) -
                                          //         14,
                                        ),
                                        Center(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFF6b7379),
                                              borderRadius: BorderRadius.circular(15)
                                            ),
                                            // margin: EdgeInsets.only(left: ((MediaQuery.of(context).size.width) / 2) - 210, top: 40),
                                            height: 900,
                                            width: 195,
                                            
                                            child: Center(
                                              child: Column(
                                             
                                                children: [
                                                  Container(
                                                    margin:
                                                        EdgeInsets.only(top: 35),
                                                    child: Text(
                                                       
                                                      cat.pCats,
                                                      textAlign:TextAlign.left,
                                                      // overflow:
                                                      //     TextOverflow.ellipsis,
                                                      style: new TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColors.white,
                                                          fontSize: 22),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Container(
                                      // width: (MediaQuery.of(context).size.width /
                                      //         2) -
                                      //     14,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right:8,top: 50),
                                        child: Center(
                                          child: Container(
                                            height: 130,
                                            width: 130,
                                            child: Card(
                                              shadowColor: AppColors.tela,
                                              elevation: 10,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(60),
                                              ),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(60),
                                                  child: cat.img.isEmpty
                                                      ? Image.asset(
                                                          "assets/images/logo.png",
                                                          fit: BoxFit.cover,
                                                        )
                                                      : Image.network(
                                                          Constant.logo_Image_cat +
                                                              cat.img,
                                                          fit: BoxFit.cover,
                                                        )),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
                // ExpandableListView(cat.pCats,cat.pcatId);
              },
              itemCount: snapshot.data.length,
              shrinkWrap: true,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      )),
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

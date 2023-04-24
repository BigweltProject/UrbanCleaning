import 'package:flutter/material.dart';
import 'package:maxeyfresh/General/AppConstant.dart';
import 'package:maxeyfresh/dbhelper/database_helper.dart';
import 'package:maxeyfresh/model/CategaryModal.dart';
import 'package:maxeyfresh/screen/vendors_by_cat.dart';

class SubCats extends StatefulWidget {
  final String catID;
  const SubCats(this.catID) : super();

  @override
  State<SubCats> createState() => _SubCatsState();
}

class _SubCatsState extends State<SubCats> {
  List<Categary> subCatList = new List<Categary>();
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    print("init---->");
    await DatabaseHelper.getData1(widget.catID, "API CALL 1").then((usersFromServe) {
      print("Helllllo");
      if (this.mounted) {
        setState(() {
          subCatList = usersFromServe;
          print("sub----${subCatList.length}");
          isLoading = false;
          print("isLoading---->${isLoading}");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.red,
      body: SafeArea(
        child: isLoading
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.tela,
                  ),
                ),
              )
            : Container(
                child: ListView.builder(
                    itemCount: subCatList.isNotEmpty ? subCatList.length : 0,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => VendorsByCat(subCatList[index].pcatId, subCatList[index].pCats)));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  margin: EdgeInsets.only(
                                    left: 10,
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: ClipRRect(
                                    child: subCatList[index].img.isNotEmpty
                                        ? Image.network(
                                            Constant.logo_Image_cat + subCatList[index].img,
                                            fit: BoxFit.contain,
                                          )
                                        : Image.asset("assets/images/logo.png"),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  subCatList[index].pCats,
                                  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.tela),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maxeyfresh/General/AppConstant.dart';
import 'package:http/http.dart' as http;
import 'package:maxeyfresh/model/vendor_details.dart';
import 'package:maxeyfresh/screen/MvProduct.dart';

class VendorsByCat extends StatefulWidget {
  final catId;
  final catName;
  const VendorsByCat(this.catId, this.catName) : super();

  @override
  State<VendorsByCat> createState() => _VendorsByCatState();
}

class _VendorsByCatState extends State<VendorsByCat> {
  List<VendorList> list = List();
  VendorList vendorList = VendorList();
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    await getVendorsByCatId(widget.catId);
  }

  getVendorsByCatId(String catId) async {
    String link =
        "${Constant.base_url}/api/mv_list?shop_id=${Constant.Shop_id}&lat=${Constant.latitude}&lng=${Constant.longitude}&rad=&q=&mv_cat=${catId}";
    var response = await http.get(link);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      setState(() {
        vendorList = VendorList.fromJson(responseData);
        isLoading = false;
      });
      print("list---->${vendorList.list.length}");
      VendorList.fromJson(responseData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.tela,
        title: Text(widget.catName),
      ),
      backgroundColor: AppColors.red,
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: ListView.builder(
                  itemCount: vendorList.list.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        print("id----->${vendorList.list[index].mvId}");
                        print("id----->${vendorList.list[index].openTime}");
                        print("id----->${vendorList.list[index].closeTime}");
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return MV_products(vendorList.list[index].name, vendorList.list[index].mvId, vendorList.list[index].cat,
                              vendorList.list[index].openTime, vendorList.list[index].closeTime);
                        }));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 5),
                        height: 120,
                        child: Stack(
                          children: [
                            Card(
                              shadowColor: AppColors.tela,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: AppColors.white,
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    height: 100,
                                    width: 150,
                                    child: Card(
                                      elevation: 3,
                                      shadowColor: AppColors.tela,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: vendorList.list[index].pp.isEmpty
                                              ? Image.asset("assets/images/logo.png")
                                              : Image.network(
                                                  Constant.logo_Image_mv + vendorList.list[index].pp,
                                                  fit: BoxFit.cover,
                                                )),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width - 200,
                                        child: Text(
                                          vendorList.list[index].company,
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width - 200,
                                        child: Text(
                                          vendorList.list[index].address,
                                          maxLines: 2,
                                          style: TextStyle(fontWeight: FontWeight.w400),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            double.parse(vendorList.list[index].reviews) > 0
                                ? Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 0, right: 20),
                                      height: 25,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: AppColors.sellp,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          )),
                                      child: Center(
                                          child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            (double.parse(vendorList.list[index].reviews) / double.parse(vendorList.list[index].reviewsTotal))
                                                .toString(),
                                            style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.white),
                                          ),
                                          Icon(
                                            Icons.star,
                                            size: 17,
                                            color: AppColors.white,
                                          )
                                        ],
                                      )),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                    );
                  })),
    );
  }
}

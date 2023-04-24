import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';
import 'package:maxeyfresh/General/AppConstant.dart';
import 'package:maxeyfresh/model/AddressModel.dart';
import 'package:maxeyfresh/model/CategaryModal.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:maxeyfresh/model/CityName.dart';
import 'package:maxeyfresh/model/CoupanModel.dart';
import 'package:maxeyfresh/model/Gallerymodel.dart';
import 'package:maxeyfresh/model/GroupProducts.dart';
import 'package:maxeyfresh/model/InvoiceTrackmodel.dart';
import 'package:maxeyfresh/model/ListModel.dart';
import 'package:maxeyfresh/model/MyReviewModel.dart';
import 'package:maxeyfresh/model/ShopDModel.dart';
import 'package:maxeyfresh/model/TrackInvoiceModel.dart';
import 'package:maxeyfresh/model/Varient.dart';
import 'package:maxeyfresh/model/banktransaction.dart';
import 'package:maxeyfresh/model/customermodel.dart';
import 'package:maxeyfresh/model/productmodel.dart';
import 'package:maxeyfresh/model/promotion_banner.dart';
import 'package:maxeyfresh/model/slidermodal.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ArticleRepository {
  Future<List<Categary>> getArticles();
}

class ArticleRepositoryImpl implements ArticleRepository {
  String link = Constant.base_url +
      "manage/api/p_category/all/?X-Api-Key=" +
      Constant.API_KEY +
      "&start=0&limit=20&field=shop_id&ield=shop_id&filter=" +
      Constant.Shop_id +
      "&parent=0&loc_id=" +
      Constant.cityid;
  @override
  Future<List<Categary>> getArticles() async {
    var response = await http.get(link);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      List<dynamic> galleryArray = responseData["data"]["p_category"];
      List<Categary> glist = Categary.getListFromJson(galleryArray);
      return glist;
    } else {
      throw Exception();
    }
  }
}

Future<List<CustmerModel>> mywallet(String userid) async {
  print(userid);
//  String link = "http://www.sanjarcreation.com/manage/api/reviews/all?X-Api-Key=9C03CAEC0A143D345578448E263AF8A6&user_id=2345&field=shop_id&filter=49" ;
  String link = Constant.base_url +
      "manage/api/customers/all?X-Api-Key=" +
      Constant.API_KEY +
      "&user_id=" +
      userid +
      "&shop_id=" +
      Constant.Shop_id;
  log("wallet link---->$link");
  final response = await http.get(link);
  print("response----->${response.body}");
  if (response.statusCode == 200) {
    log(response.body.toString());
    var responseData = json.decode(response.body);
    print(responseData.toString());
    List<dynamic> galleryArray = responseData["data"]["customers"];

    return CustmerModel.getListFromJson(galleryArray);
    ;
  }
}

Future<List<WalletUser>> get_walletrecord(String val, int lim) async {
  String link = Constant.base_url +
      "manage/api/wallet_user/all?X-Api-Key=" +
      Constant.API_KEY +
      "&start=" +
      lim.toString() +
      "&limit=10&w_user=" +
      val;
  print("This is  sub link" + link);
  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    print(response);
    List<dynamic> galleryArray = responseData["data"]["wallet_user"];
    List<WalletUser> list = WalletUser.getListFromJson(galleryArray);

    return list;
  }
}
class DatabaseHelper {
  static Future<List<Categary>> getData(String id) async {
    String link = Constant.base_url +
        "manage/api/mv_cats/all/?X-Api-Key=" +
        Constant.API_KEY +
        "&start=0&limit=100&field=shop_id&filter=" +
        Constant.Shop_id +
        "&parent=" +
        id +
        "&loc_id=" +
        Constant.cityid +
        "&type=1";
    print("this is services--->${link}");

    final response = await http.get(link);
    if (response.statusCode == 200) {
      print("hellllllo");
      var responseData = json.decode(response.body);
      print("hellllllo");
      List<dynamic> galleryArray = responseData["data"]["mv_cats"];
      print("hellllllo");
      List<Categary> list = Categary.getListFromJson(galleryArray);
      return list;
    }
//    print("List Size: ${list.length}");
  }

  static Future<PromotionBanner> getPromotionBanner() async {
    var body = {"shop_id": Constant.Shop_id};

    final url = 'https://www.bigwelt.com/api/app-promo-banner.php';
    try {
      final response = await http.post(Uri.parse(url), body: body);

      if (response.statusCode == 200) {
        return PromotionBanner.fromJson(jsonDecode(response.body));
      } else {
// If the server did not return a 201 CREATED response,
// then throw an exception.
        throw Exception('Failed to create album.');
      }
    } catch (e, s) {
      print('getSlider error --> e:-$e s:-$s');
    }
  }

  static Future<List<Categary>> getData1(String id, String checkApi) async {
    print("checkApi----> ${checkApi}");
    print(Constant.cityid);
    String link = Constant.base_url +
        "manage/api/mv_cats/all/?X-Api-Key=" +
        Constant.API_KEY +
        "&start=0&limit=100&field=shop_id&filter=" +
        Constant.Shop_id +
        "&parent=" +
        id +
        "&loc_id=" +
        Constant.cityid +
        "&type=1";
    print("servicesss--->${link}");

    final response = await http.get(link);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      List<dynamic> galleryArray = responseData["data"]["mv_cats"];
      print(galleryArray.length.toString()+"mv cats length" );
      List<Categary> list = Categary.getListFromJson(galleryArray);

      return list;
    }
//    print("List Size: ${list.length}");
  }

  static Future<List<Slider1>> getSlider() async {
    String link = Constant.base_url +
        "manage/api/gallery/all/?X-Api-Key=" +
        Constant.API_KEY +
        "&start=0&limit=&field=shop_id&filter=" +
        Constant.Shop_id +
        "&place=appslide";
    print(" Slider link" + link);

    final response = await http.get(link);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      List<dynamic> galleryArray = responseData["data"]["gallery"];
      List<Slider1> list = Slider1.getListFromJson(galleryArray);

      return list;
    }
//    print("List Size: ${list.length}");
  }

  static Future<List<Products>> getTopProduct(String dil, String lim) async {
    String link = Constant.base_url +
        "manage/api/products/all/?X-Api-Key=" +
        Constant.API_KEY +
        "&start=" +
        lim +
        "&limit=10&deals=" +
        dil +
        "&field=shop_id&filter=" +
        Constant.Shop_id +
        "&loc_id=" +
        Constant.cityid;
    print("${dil} ...." + link);

//    Const.Base_Url + "manage/api/products/all/?X-Api-Key=" + Const.API_KEY + "&start=0&limit=4&field=shop_id&filter=" + Const.Shop_id + "&sort=DESC&loc_id=" + HomePage.loc_id,
    final response = await http.get(link);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      List<dynamic> galleryArray = responseData["data"]["products"];
      List<Products> list = Products.getListFromJson(galleryArray);

      return list;
    }
//    print("List Size: ${list.length}");
  }

  static Future<List<Products>> getfeature(String dil, String lim) async {
    String link = Constant.base_url +
        "manage/api/products/all/?X-Api-Key=" +
        Constant.API_KEY +
        "&start=0&limit=" +
        lim +
        dil +
        "&field=shop_id&filter=" +
        Constant.Shop_id +
        "&loc_id=" +
        Constant.cityid;
    print("${dil} ...." + link);

//    Const.Base_Url + "manage/api/products/all/?X-Api-Key=" + Const.API_KEY + "&start=0&limit=4&field=shop_id&filter=" + Const.Shop_id + "&sort=DESC&loc_id=" + HomePage.loc_id,
    final response = await http.get(link);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      List<dynamic> galleryArray = responseData["data"]["products"];
      List<Products> list = Products.getListFromJson(galleryArray);

      return list;
    }
//    print("List Size: ${list.length}");
  }

  static Future<List<Products>> getTopProduct1(String dil, String lim) async {
    String link = Constant.base_url +
        "manage/api/products/all/?X-Api-Key=" +
        Constant.API_KEY +
        "&start=" +
        lim +
        "&limit=10&field=shop_id&filter=" +
        Constant.Shop_id +
        "&sort=DESC&loc_id=" +
        Constant.cityid;
    print("new.........." + link);

//    Const.Base_Url + "manage/api/products/all/?X-Api-Key=" + Const.API_KEY + "&start=0&limit=4&field=shop_id&filter=" + Const.Shop_id + "&sort=DESC&loc_id=" + HomePage.loc_id,
    final response = await http.get(link);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      List<dynamic> galleryArray = responseData["data"]["products"];
      List<Products> list = Products.getListFromJson(galleryArray);

      return list;
    }
//    print("List Size: ${list.length}");
  }

  static Future<List<Gallery>> getImage(String id) async {
    print("Future id" + id);
    String link = Constant.base_url + "manage/api/gallery/all/?X-Api-Key=" + Constant.API_KEY + "&start=0&limit=10&place=" + id;
//print("Slider"+link);
    final response = await http.get(link);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      List<dynamic> galleryArray = responseData["data"]["gallery"];
      List<Gallery> glist = Gallery.getListFromJson(galleryArray);

      return glist;
    }
//    print("List Size: ${list.length}");
  }

//  Const.Base_Url + "manage/api/products/all/?X-Api-Key=" + Const.API_KEY + "&start=0&limit=5000&cats=" + pcategoryid + "&field=shop_id&filter=" + Const.Shop_id+"&loc_id="
}

Future<List<Categary>> getData(String id) async {
  String link = Constant.base_url +
      "manage/api/p_category/all/?X-Api-Key=" +
      Constant.API_KEY +
      "&start=0&limit=100&field=shop_id&ield=shop_id&filter=" +
      Constant.Shop_id +
      "&parent=" +
      id +
      "&loc_id=" +
      Constant.cityid;
  print(link);
  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    List<dynamic> galleryArray = responseData["data"]["p_category"];

    return Categary.getListFromJson(galleryArray);
    ;
  }
}

Future<List<Products>> catby_productData(String id, String lim, String mvid) async {
  String link = Constant.base_url +
      "manage/api/products/all/?X-Api-Key=" +
      Constant.API_KEY +
      "&start=" +
      lim +
      "&limit=50&cats=" +
      id +
      "&field=shop_id&filter=" +
      Constant.Shop_id +
      "&loc_id=" +
      Constant.cityid +
      "&mv=";

  print('linkcatpro   ${link}');
  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    List<dynamic> galleryArray = responseData["data"]["products"];

    return Products.getListFromJson(galleryArray);
    ;
  }
}

Future<List<TrackInvoice>> trackInvoice(String mobile) async {
  String link = Constant.base_url + "manage/api/invoices/all/?X-Api-Key=" + Constant.API_KEY + "&field=client_id&filter=" + mobile;
  print(link);

  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    List<dynamic> galleryArray = responseData["data"]["invoices"];

    return TrackInvoice.getListFromJson(galleryArray);
    ;
  }
}

Future<List<InvoiceInvoice>> trackInvoiceOrder(String invoice) async {
  String link = Constant.base_url + "manage/api/invoice_details/all/?X-Api-Key=" + Constant.API_KEY + "&field=invoice_id&filter=" + invoice;

  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    List<dynamic> galleryArray = responseData["data"]["invoice_details"];

    return InvoiceInvoice.getListFromJson(galleryArray);
    ;
  }
}

Future<List<Products>> productdetail(String id) async {
  String link = Constant.base_url +
      "manage/api/products/all/?X-Api-Key=" +
      Constant.API_KEY +
      "&start=0&limit=10&field=shop_id&filter=" +
      Constant.Shop_id +
      "&id=" +
      id;
  print(link);
  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
//    print(responseData.toString());
    List<dynamic> galleryArray = responseData["data"]["products"];

    return Products.getListFromJson(galleryArray);
    ;
  }
}

Future<List<Products>> search(String query, String mvid) async {
  String link = Constant.base_url +
      "manage/api/products/all/?X-Api-Key=" +
      Constant.API_KEY +
      "&start=0&limit=10&field=shop_id&filter=" +
      Constant.Shop_id +
      "&id=&mv=";
  print("Serch123  ${link}");

  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    List<dynamic> galleryArray = responseData["data"]["products"];

    return Products.getListFromJson(galleryArray);
    ;
  }
}

Future<List<Review>> myReview(String userid) async {
  print(userid);
//  String link = "http://www.sanjarcreation.com/manage/api/reviews/all?X-Api-Key=9C03CAEC0A143D345578448E263AF8A6&user_id=2345&field=shop_id&filter=49" ;
  String link = Constant.base_url +
      "manage/api/reviews/all?X-Api-Key=9C03CAEC0A143D345578448E263AF8A6&user_id=" +
      userid +
      "&field=shop_id&filter=" +
      Constant.Shop_id;
  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
//    print(responseData.toString());
    List<dynamic> galleryArray = responseData["data"]["reviews"];

    return Review.getListFromJson(galleryArray);
    ;
  }
}

Future<List<GroupProducts>> GroupPro(String userid) async {
  String link = "https://www.bigwelt.com/api/pg.php?id=" + userid + "&shop_id=" + Constant.Shop_id;
  print(link);
  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    List<dynamic> galleryArray = responseData;
//    GroupProducts  groupProducts= GroupProducts.fromMap(json.decode(response.body));
////    List<dynamic> galleryArray = responseData["data"]["reviews"];
//    print(galleryArray.toString()+"Gallery");
    if (galleryArray == null) {
      return galleryArray;
    } else {
      return GroupProducts.getListFromJson(galleryArray);
    }
  }
}

Future<List<Products>> searchval(String query, String mvid) async {
  String link = Constant.base_url +
      "manage/api/products/all/?X-Api-Key=" +
      Constant.API_KEY +
      "&start=0&limit=50&field=shop_id&filter=" +
      Constant.Shop_id +
      "&q=" +
      query +
      "&user_id=" +
      Constant.User_ID +
      "&id=&mv=";
  print(link);
  List<dynamic> galleryArray;
  final date2 = DateTime.now();
//  String md5=Constant.Shop_id+date2.day.toString()+date2.month.toString()+date2.year.toString();
  String md5 = Constant.Shop_id + DateFormat("dd-MM-yyyy").format(date2);

  print(md5);
//  searchdatasave(query);
  generateMd5(md5, query);
  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    galleryArray = responseData["data"]["products"];

    return Products.getListFromJson(galleryArray);
  }
}

Future<List<Categary>> searchval1(String q, String id) async {
  print(Constant.cityid);
  String link = Constant.base_url +
      "manage/api/p_category/all/?X-Api-Key=" +
      Constant.API_KEY +
      "&start=0&limit=10&field=shop_id&filter=" +
      Constant.Shop_id +
      "&parent=" +
      id +
      "&loc_id=" +
      Constant.cityid +
      "&q=" +
      "&type=1";
      q;
  print(link);

  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    List<dynamic> galleryArray = responseData["data"]["p_category"];
    List<Categary> list = Categary.getListFromJson(galleryArray);

    return list;
  }
//    print("List Size: ${list.length}");
}

searchdatasave(String query, String md5) async {
  String link = Constant.base_url + "api/search.php?shop_id=" + Constant.Shop_id + "&user_id=" + Constant.User_ID + "&q=" + query + "&key=" + md5;
  print(link);
  final response = await http.get(link);
  if (response.statusCode == 200) {
//      var responseData = json.decode(response.body);

  }
}

void generateMd5(String input, String q) {
  String key = md5.convert(utf8.encode(input)).toString();
  searchdatasave(q, key);
  print(key);
}

Future<List<Slider1>> getBanner() async {
  String link = Constant.base_url +
      "manage/api/gallery/all/?X-Api-Key=" +
      Constant.API_KEY +
      "&start=0&limit=&field=shop_id&filter=" +
      Constant.Shop_id +
      "&place=appbanner";
  print(link);
  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    List<dynamic> galleryArray = responseData["data"]["gallery"];
    List<Slider1> list = Slider1.getListFromJson(galleryArray);

    return list;
  }
//    print("List Size: ${list.length}");
}

Future<List<UserAddress>> getAddress() async {
  String link = Constant.base_url +
      "manage/api/user_address/all/?X-Api-Key=" +
      Constant.API_KEY +
      "&start=0&limit=&shop_id=" +
      Constant.Shop_id +
      "&user_id=" +
      Constant.user_id;
  print(link);
  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    List<dynamic> galleryArray = responseData["data"]["user_address"];
//    List<UserAddress> list =

    return UserAddress.getListFromJson(galleryArray);
  }
//    print("List Size: ${list.length}");
}

Future<Coupan> getCoupan(String code) async {
  String link = Constant.base_url + "manage/api/coupon_codes/all/?X-Api-Key=" + Constant.API_KEY + "&shop_id=" + Constant.Shop_id + "&code=" + code;
//      Constant.base_url + "manage/api/coupon_codes/all/?X-Api-Key=" +
//      Constant.API_KEY + "shop_id=" + Constant.Shop_id +"code="+code;
  print(link);
  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    print(responseData);
    Coupan coupan = Coupan.fromMap(json.decode(response.body));
    return coupan;
  }
//    print("List Size: ${list.length}");
}

Future<List<PVariant>> getPvarient(String id) async {
  String link = Constant.base_url + "manage/api/p_variant/all/?X-Api-Key=" + Constant.API_KEY + "&start=0&limit=100&pid=" + id;
  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    List<dynamic> galleryArray = responseData["data"]["p_variant"];
    List<PVariant> list = PVariant.getListFromJson(galleryArray);

    return list;
  }
}

Future<List<CityName>> getPcity() async {
  String link =
      Constant.base_url + 'manage/api/mv_delivery_locations/all/?X-Api-Key=' + Constant.API_KEY + '&field=shop_id&filter=' + Constant.Shop_id;
  print(link);
  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    List<dynamic> galleryArray = responseData["data"]["mv_delivery_locations"];
    List<CityName> list = CityName.getListFromJson(galleryArray);

    return list;
  }
}

// Behlf of lat long
Future<List<ListModel>> getShopList(String rad) async {
  // String link =Constant.base_url+'manage/api/mv_delivery_locations/all/?X-Api-Key='+Constant.API_KEY+'&field=shop_id&filter='+Constant.Shop_id;
  String link = Constant.base_url +
      "api/mv_list?shop_id=" +
      Constant.Shop_id +
      "&lat=" +
      Constant.latitude.toString() +
      "&lng=" +
      Constant.longitude.toString() +
      "&rad=" +
      rad +
      "&q=";
  print("Shoplist");
  print(link);
  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    List<dynamic> galleryArray = responseData["List"];
    List<ListModel> list = ListModel.getListFromJson(galleryArray);

    return list;
  }
}

Future<List<ListModel>> getShopListByCat(String rad, String catid) async {
  // String link =Constant.base_url+'manage/api/mv_delivery_locations/all/?X-Api-Key='+Constant.API_KEY+'&field=shop_id&filter='+Constant.Shop_id;
  String link = Constant.base_url +
      "api/mv_list?shop_id=" +
      Constant.Shop_id +
      "&lat=" +
      Constant.latitude.toString() +
      "&lng=" +
      Constant.longitude.toString() +
      "&rad=" +
      rad +
      "&q=&mv_cat=" +
      catid;
  print("Shoplist");
  print(link);
  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    List<dynamic> galleryArray = responseData["List"];
    List<ListModel> list = ListModel.getListFromJson(galleryArray);

    return list;
  }
}

Future<List<Products>> getAllProducts(String lim) async {
  String link = Constant.base_url +
      "manage/api/products/all/?X-Api-Key=" +
      Constant.API_KEY +
      "&start=" +
      lim +
      "&limit=10&field=shop_id&filter=" +
      Constant.Shop_id +
      "&loc_id=";
  print("Serch  ${link}");

  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    List<dynamic> galleryArray = responseData["data"]["products"];

    return Products.getListFromJson(galleryArray);
    ;
  }
}

Future<ShopDModel> getShopD() async {
  String link = Constant.base_url + "api/cp.php?shop_id=" + Constant.Shop_id;
  print(" Slider link" + link);

  final response = await http.get(link);
  if (response.statusCode == 200) {
    ShopDModel user = ShopDModel.fromJson(jsonDecode(response.body));

    return user;
  }
//    print("List Size: ${list.length}");
}

Future<List<Categary>> get_Category(String val) async {
  // String link =Constant.base_url+'manage/api/mv_delivery_locations/all/?X-Api-Key='+Constant.API_KEY+'&field=shop_id&filter='+Constant.Shop_id;
  String link = Constant.base_url +
      "manage/api/mv_cats/all/?X-Api-Key=" +
      Constant.API_KEY +
      "&start=0&limit=100&field=shop_id&filter=" +
      Constant.Shop_id +
      "&parent=" +
      val +
      "&loc_id=";
  print("cat linl  " + link);
  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    print(response);
    List<dynamic> galleryArray = responseData["data"]["mv_cats"];
    List<Categary> list = Categary.getListFromJson(galleryArray);

    return list;
  }
}

Future<List<Slider1>> getSliderforMedicalShop(String mvid) async {
  String link = Constant.base_url +
      "manage/api/gallery/all/?X-Api-Key=" +
      Constant.API_KEY +
      "&start=0&limit=&field=shop_id&filter=" +
      Constant.Shop_id +
      "&place=mv&title=" +
      mvid;
  print(" Slider link" + link);

  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    List<dynamic> galleryArray = responseData["data"]["gallery"];
    List<Slider1> list = Slider1.getListFromJson(galleryArray);

    return list;
  }
}

Future<List<Categary>> get_CategoryBYMv(String val) async {
  // String link =Constant.base_url+'manage/api/mv_delivery_locations/all/?X-Api-Key='+Constant.API_KEY+'&field=shop_id&filter='+Constant.Shop_id;
  String link = Constant.base_url + "api/mv_pro_cats?shop_id=" + Constant.Shop_id + "&mv=" + val;
  print("This is  sub link" + link);
  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    print(response);
    List<dynamic> galleryArray = responseData["Cats"];
    List<Categary> list = Categary.getListFromJson(galleryArray);

    return list;
  }
}

Future<List<Products>> getTServicebymv_id(String mv_id, String catid, String slim) async {
  String link = Constant.base_url +
      "manage/api/products/all/?X-Api-Key=" +
      Constant.API_KEY +
      "&start=" +
      slim +
      "&limit=100&field=shop_id&filter=" +
      Constant.Shop_id +
      "&sort=DESC&loc_id=&mv=" +
      mv_id; // +Constant.cityid;
  print("new1.........." + link);

//    Const.Base_Url + "manage/api/products/all/?X-Api-Key=" + Const.API_KEY + "&start=0&limit=4&field=shop_id&filter=" + Const.Shop_id + "&sort=DESC&loc_id=" + HomePage.loc_id,
  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    List<dynamic> galleryArray = responseData["data"]["products"];
    List<Products> list = Products.getListFromJson(galleryArray);

    return list;
  }
//    print("List Size: ${list.length}");
}

Future<List<ListModel>> searchvender(String query, String rad) async {
  String link = Constant.base_url +
      "api/mv_list?shop_id=" +
      Constant.Shop_id +
      "&lat=" +
      Constant.latitude.toString() +
      "&lng=" +
      Constant.longitude.toString() +
      "&rad=" +
      rad +
      "&q=&type=1";
  print("Serch  ${link}");

  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    List<dynamic> galleryArray = responseData["List"];

    return ListModel.getListFromJson(galleryArray);
    ;
  }
}
  Future<List<ListModel>> searchvendernew(String query, String rad) async {
  String link = Constant.base_url +
      "api/mv_list?shop_id=" +
      Constant.Shop_id +
      "&lat=" +
      Constant.latitude.toString() +
      "&lng=" +
      Constant.longitude.toString() +
      "&rad=" +
      rad +
      "&q="+
      query+
      "&type=1";
  log("Serch  ${link}");

  final response = await http.get(link);
  if (response.statusCode == 200) {
    var responseData = json.decode(response.body);
    List<dynamic> galleryArray = responseData["List"];

    return ListModel.getListFromJson(galleryArray);
    ;
  }
}

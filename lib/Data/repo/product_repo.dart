import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_task/Data/model/product_model.dart';
import 'package:test_task/Data/utils/api_service.dart';

class ProductRepo {
  static Future<ProductModel> getProducts({required int page}) async {
    try {
      var response = await http.get(Uri.parse("${ApiServices.product}?limit=$page"));

      if (response.statusCode == 200) {
        return productModelFromJson(response.body);
      } else {
        var message = json.decode(response.body);
        throw Exception(message['message']);
      }
    } on Exception catch (e) {
      // TODO
      rethrow;
    }
  }



  /// Product by id / Single Product api

static Future<Product> getProductById({required int id})async{
  try {
    var response = await http.get(Uri.parse(ApiServices.product+"/"+id.toString()));

    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      var message = json.decode(response.body);
      throw Exception(message['message']);
    }
  } on Exception catch (e) {
    // TODO
    rethrow;
  }
}

}

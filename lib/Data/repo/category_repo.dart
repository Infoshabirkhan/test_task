import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_task/Data/model/categories_model.dart';
import 'package:test_task/Data/model/product_model.dart';
import 'package:test_task/Data/utils/api_service.dart';
class CategoryRepo{


  static Future<List<CategoriesModel>> getAllCategories() async {

    try {
      var request = http.MultipartRequest('GET', Uri.parse(ApiServices.categories));


      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
       return categoriesModelFromJson(await response.stream.bytesToString());
      }
      else {
        var error = json.decode (await response.stream.bytesToString());
      print(response.reasonPhrase);
      throw Exception(error['message']);
      }
    } on Exception catch (e) {
      // TODO
      rethrow;
    }

  }

  static Future<ProductModel> getProductByCategory({required String url}) async {

    try {
      var request = http.MultipartRequest('GET', Uri.parse(url));


      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return productModelFromJson(await response.stream.bytesToString());
      }
      else {
        var error = json.decode (await response.stream.bytesToString());
        print(response.reasonPhrase);
        throw Exception(error['message']);
      }
    } on Exception catch (e) {
      // TODO
      rethrow;
    }

  }

}
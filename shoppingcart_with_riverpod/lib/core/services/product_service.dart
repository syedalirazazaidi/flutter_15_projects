import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:shoppingcart_with_riverpod/constants/configs.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingcart_with_riverpod/constants/error_strings.dart';
import 'package:shoppingcart_with_riverpod/core/modal/product.dart';

class ProductServices {
  static final ProductServices instance = ProductServices._internal();

  factory ProductServices() {
    return instance;
  }
  ProductServices._internal();
  Future<List<Product>> getProducts(String category) async {
    try {
      String url = Configs.apiBaseURL;
      if (category.isNotEmpty) {
        url += '${Configs.categoryProductsEndpoint}$category';
      } else {
        url += Configs.allProductEndpoint;
      }

      List<dynamic> parsedData = [];
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;

        parsedData = jsonDecode(data);
        if (parsedData == null) {
          throw Exception(ErrorStrings.invalidData);
        }
      }

      List<Product> productList =
      parsedData.map((e) => Product.fromJson(e)).toList();

      return productList;
    } catch (e) {
      debugPrint('${ErrorStrings.somethingWentWrong}: $e');


      rethrow;
    }
  }



}

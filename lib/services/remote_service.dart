import 'dart:convert';
import 'package:shop_it_grocery_app/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
Future<Product> fetchProduct(String brand) async {
    final response = await http.get(
      Uri.parse(" https://makeup-api.herokuapp.com/api/v1/products.json?(brand)")
      );

    if(response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch product data');
    }
    
  }
}
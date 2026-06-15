import 'dart:convert';
import 'package:calisma/models/products_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<ProductsModel> fetchProducts() async {
    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
    );

    if (response.statusCode == 200) {
      final List list = jsonDecode(response.body);
      return ProductsModel(
        data: list.map((e) => Data.fromJson(e)).toList(),
      );
    } else {
      throw Exception("Failed to load products");
    }
  }
}

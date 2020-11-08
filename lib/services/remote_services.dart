import 'package:http/http.dart' as http;

import '../models/product.dart';

class RemoteServices {
  static http.Client client = http.Client();

  static Future<List<Product>> getProducts() async {
    var response = await client.get(
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      // show error message
      return null;
    }
  }
}

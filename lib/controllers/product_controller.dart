import 'package:get/state_manager.dart';

import '../models/product.dart';
import '../services/remote_services.dart';

class ProductController extends GetxController {
  var numOfCols = 2.obs;
  var isLoading = true.obs;
  var productList = List<Product>().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.getProducts();
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}

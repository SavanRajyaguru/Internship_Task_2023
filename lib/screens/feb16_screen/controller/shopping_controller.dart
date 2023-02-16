import 'package:get/get.dart';
import 'package:project1/screens/feb16_screen/model/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          productName: "First Product",
          productImage: "aaa",
          productDescription: "this is the first product",
          price: 30,
          itemCount: 1,
      ),
      Product(
          id: 2,
          productName: "Second Product",
          productImage: "bbb",
          productDescription: "this is the second product",
          price: 40,
          itemCount: 1,
      ),
      Product(
          id: 3,
          productName: "Third Product",
          productImage: "ccc",
          productDescription: "this is the third product",
          price: 50.0,
          itemCount: 1,
      ),
    ];

    products.value = productResult;
  }
}

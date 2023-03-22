import 'package:get/get.dart';
import 'package:project1/screens/feb17_screen/models/product_model.dart';
import 'package:project1/screens/feb17_screen/services/remote_services.dart';

class ProductController extends GetxController{
  var productList = <ProductInfo>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchProducts();
    // TODO: implement onInit
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProductInfo();
      if(products != null){
        productList.value = products;
      }
      isLoading(false);
    } on Exception catch (e) {
      print(e);
    }
  }
}
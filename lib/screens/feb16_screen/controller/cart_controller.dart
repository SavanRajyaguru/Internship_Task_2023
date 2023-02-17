import 'package:get/get.dart';
import 'package:project1/screens/feb16_screen/controller/shopping_controller.dart';
import 'package:project1/screens/feb16_screen/model/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  final shoppingController = Get.put(ShoppingController());

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  int cartCount(Product product) {

    for(int i = 0; i < cartItems.length; i++){
      if(cartItems[i].id == product.id){
        print("Id: ${product.id}, cartId: ${cartItems[i].id}");
        print("cartItems: ${cartItems[i].itemCount}");
        return cartItems[i].itemCount;
      }
    }

    return 0;
  }

  addToCart(Product product) {

    bool isItemFound = false;


    if(cartItems.isEmpty){
      cartItems.add(product);
    } else {

      for(int i = 0; i < cartItems.length; i++){
        if(cartItems[i].id == product.id){
          print("====== found");
          isItemFound = true;
          double currentProductTotalPrice = cartItems[i].price + product.price;
          int totalItemCount = cartItems[i].itemCount + 1;
          print(totalItemCount);
          var newItem = Product(
              id: product.id,
              productName: product.productName,
              productImage: product.productImage,
              productDescription: product.productDescription,
              price: currentProductTotalPrice,
              itemCount: totalItemCount,
          );

          cartItems[i] = newItem;
          break;
        }
      }
      if(!isItemFound){
        cartItems.add(product);
      }
    }
    // if(cardItems.isNotEmpty && !isItemFound){
    //   print("====== not found");
    //   cardItems.add(product);
    // }
  }
}

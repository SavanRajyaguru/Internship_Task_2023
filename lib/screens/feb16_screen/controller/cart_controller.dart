import 'package:get/get.dart';
import 'package:project1/screens/feb16_screen/model/product.dart';

class CartController extends GetxController {
  var cardItems = <Product>[].obs;

  double get totalPrice => cardItems!.fold(0, (sum, item) => sum + item.price);

  addToCart(Product product) {

    bool isItemFound = false;


    if(cardItems!.isEmpty){
      cardItems!.add(product);
    } else {

      for(int i = 0; i < cardItems!.length; i++){
        if(cardItems![i].id == product.id){
          print("====== found");
          isItemFound = true;
          double currentProductTotalPrice = cardItems![i].price + product.price;
          int totalItemCount = cardItems![i].itemCount + 1;
          print(totalItemCount);
          var newItem = Product(
              id: product.id,
              productName: product.productName,
              productImage: product.productImage,
              productDescription: product.productDescription,
              price: currentProductTotalPrice,
              itemCount: totalItemCount,
          );

          cardItems![i] = newItem;
          break;
        }
      }
      if(!isItemFound){
        cardItems!.add(product);
      }
    }
    // if(cardItems.isNotEmpty && !isItemFound){
    //   print("====== not found");
    //   cardItems.add(product);
    // }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/screens/feb16_screen/controller/cart_controller.dart';
import 'package:project1/screens/feb16_screen/controller/shopping_controller.dart';
import 'package:project1/screens/feb16_screen/screen/cart_screen.dart';
import 'package:badges/badges.dart' as badges;

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoppingController = Get.put(ShoppingController());
    final cartController = Get.put(CartController());

    return Scaffold(
      backgroundColor: Colors.cyan,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.products[index].productName,
                                      style: const TextStyle(fontSize: 22.0),
                                    ),
                                    Text(controller
                                        .products[index].productDescription),
                                  ],
                                ),
                                Text(
                                  "\$${controller.products[index].price}",
                                  style: const TextStyle(fontSize: 24.0),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GetX<CartController>(builder: (controller) {
                                  return Text(
                                      "Item Count: ${controller.cartItems.isEmpty ? '0' : controller.cartCount(shoppingController.products[index]).toString()}");
                                }),
                                ElevatedButton(
                                    onPressed: () {
                                      cartController.addToCart(
                                          controller.products[index]);
                                    },
                                    child: const Text("Add to cart")),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            GetX<CartController>(builder: (controller) {
              return Text(
                "Total amount: \$${controller.totalPrice}",
                style: const TextStyle(fontSize: 28.0, color: Colors.white),
              );
            }),
            const SizedBox(
              height: 150.0,
            ),
          ],
        ),
      ),
      floatingActionButton: badges.Badge(
        badgeContent: GetX<CartController>(builder: (controller) {
          return Text(
            controller.cartItems.length.toString(),
            style: const TextStyle(fontSize: 16.0, color: Colors.black),
          );
        }),
        badgeStyle: const badges.BadgeStyle(
          badgeColor: Colors.orangeAccent
        ),
        badgeAnimation: const badges.BadgeAnimation.slide(
          animationDuration: Duration(seconds: 1),
          colorChangeAnimationDuration: Duration(seconds: 1),
          loopAnimation: false,
          curve: Curves.fastOutSlowIn,
          colorChangeAnimationCurve: Curves.easeInCubic,
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Get.to(const CartScreen());
          },
          child: const Icon(
            Icons.add_shopping_cart_rounded,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

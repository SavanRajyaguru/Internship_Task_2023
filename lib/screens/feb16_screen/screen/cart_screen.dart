import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/screens/feb16_screen/controller/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart", style: TextStyle(fontSize: 22.0),),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Expanded(
            child: GetX<CartController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.all(10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.cartItems[index].productName,
                                      style: const TextStyle(fontSize: 22.0),
                                    ),
                                    Text(controller.cartItems[index].productDescription),
                                  ],
                                ),
                                Text(
                                  controller.cartItems[index].itemCount.toString(),
                                  style: const TextStyle(fontSize: 22.0),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0,),
                            Text(
                              "Total: \$${controller.cartItems[index].price}",
                              style: const TextStyle(fontSize: 24.0),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            ),
          ),
          GetX<CartController>(builder: (controller) {
            return Text(
              "Total amount: \$${controller.totalPrice}",
              style: const TextStyle(fontSize: 28.0, color: Colors.black),
            );
          }),
          const SizedBox(
            height: 150.0,
          ),
        ],
      ),
    );
  }
}

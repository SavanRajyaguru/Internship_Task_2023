import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:project1/screens/feb27_screen/controller/game_detail_controller.dart';

class GameDetailScreen extends StatelessWidget {
  const GameDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameController = Get.put(GameDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Info'),
        backgroundColor: Colors.red,
      ),
      body: Obx(() {
        if(gameController.isLoading.value){
          return const Center(child: CircularProgressIndicator(color: Colors.red,));
        } else {
          print(gameController.isScroll.value);
          print("Controller: ${gameController.controller.positions} Length: ${gameController.length}");
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: gameController.controller,
                  itemCount: gameController.length.toInt(),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.all(12.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height/4,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(gameController.gameList[index].thumbnail.toString()),
                                  fit: BoxFit.fill
                                )
                              ),
                            ),
                            const SizedBox(height: 10.0,),
                            Text('Name: ${gameController.gameList[index].title} Count: $index', style: const TextStyle(fontSize: 18.0),),

                          ],
                        ),
                      )
                    );
                  },
                ),
              ),
              // const SizedBox(height: 10.0,),
              Container(
                padding: const EdgeInsets.only(top: 10.0),
                color: Colors.transparent,
                child: gameController.isScroll.value ? const CircularProgressIndicator() : null,
              ),
            ],
          );
        }
      }),
    );
  }
}

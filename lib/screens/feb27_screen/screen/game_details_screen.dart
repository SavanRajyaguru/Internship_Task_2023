import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/screens/feb27_screen/controller/game_detail_controller.dart';

class GameDetailScreen extends StatelessWidget {
  const GameDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameController = Get.put(GameDetailsController());
    print("Context======================");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Info'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: TextField(
                controller: gameController.searchController,
                cursorColor: Colors.black,
                onChanged: (text) => gameController.searchName(text, context),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12.0),
                  hintText: "Search for Companies",
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.clear_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (gameController.searchController.text.isNotEmpty) {
                        gameController.searchController.clear();
                        gameController.foundData = gameController.gameList;
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GetBuilder<GameDetailsController>(
              builder: (controller) {
                if (controller.isLoading.value) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.red,
                  ));
                } else {
                  print(controller.length);
                  return ListView.builder(
                    controller: gameController.controller,
                    itemCount: gameController.foundData.length,
                    itemBuilder: (context, index) {
                      return Card(
                          elevation: 5,
                          margin: const EdgeInsets.all(12.0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(gameController
                                              .foundData[index].thumbnail
                                              .toString()),
                                          fit: BoxFit.fill)),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'Name: ${gameController.foundData[index].title}',
                                  style: const TextStyle(fontSize: 18.0),
                                ),
                              ],
                            ),
                          ));
                    },
                  );
                }
              },
            ),
          ),
          // const SizedBox(height: 10.0,),
          Container(
            padding: const EdgeInsets.only(top: 10.0),
            color: Colors.transparent,
            child: gameController.isScroll.value
                ? const CircularProgressIndicator()
                : null,
          ),
        ],
      ),
    );
  }
}

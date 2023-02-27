import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/screens/feb27_screen/models/game_detail_model.dart';
import 'package:project1/screens/feb27_screen/services/game_services.dart';

class GameDetailsController extends GetxController{
  var gameList = <GameDetail>[].obs;
  var demoList;
  var isLoading = false.obs;
  ScrollController controller = ScrollController();
  RxInt length = 30.obs;


  @override
  void onInit() {
    addItem();
    fetchGameDetails();
    // demoList = gameList.sublist(0,10);
    // print(demoList);
    // TODO: implement onInit
    super.onInit();
  }

  void addItem() async{
    controller.addListener(() {
      // if(controller.position.maxScrollExtent == controller.position.pixels){
      //   int n = demoList.length;
      //   for(int i = 0; i <= 10; i++){
      //     length++;
      //   }
      //   if(length <= n){
      //     Future.delayed(const Duration(seconds: 5), () => length + 2,);
      //   } else {
      //
      //   }
      //
      // }
    });
  }

  void fetchGameDetails() async{
    try {
      isLoading(true);
      var gameDetails = await GameServices.fetchGameInfo();
      if(gameDetails != null){
        gameList.value = gameDetails;
      }
      isLoading(false);
    } on Exception catch (e) {
      print(e);
    }
  }
}
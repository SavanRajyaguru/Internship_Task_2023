import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/screens/feb27_screen/models/game_detail_model.dart';
import 'package:project1/screens/feb27_screen/services/game_services.dart';

class GameDetailsController extends GetxController{
  var gameList = <GameDetail>[].obs;
  var demoList = <GameDetail>[].obs;
  var isLoading = false.obs;
  var isScroll = false.obs;
  ScrollController controller = ScrollController();
  RxInt length = 3.obs;


  @override
  void onInit() {
    addItem();
    fetchGameDetails();
    // TODO: implement onInit
    super.onInit();
  }

  void addItem() async{
    controller.addListener(() async {
      if(controller.position.maxScrollExtent == controller.position.pixels){
        isScroll(true);
        await Future.delayed(const Duration(seconds: 5));
        int n = gameList.length;
        for(int i = 0; i <= 3; i++){
          if(length < n) {
            length++;
            isScroll(false);
          } else {
            length;
          }
        }
      }
    });
  }

  void fetchGameDetails() async{
    try {
      isLoading(true);
      var gameDetails = await GameServices.fetchGameInfo();
      if(gameDetails != null){
        gameList.value = gameDetails;
        demoList.value = gameDetails.sublist(0,10);
      }
      isLoading(false);
    } on Exception catch (e) {
      print(e);
    }
  }
}
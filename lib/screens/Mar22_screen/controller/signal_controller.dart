import 'package:get/get.dart';

class SignalController extends GetxController{
  var isaRed = true.obs;
  var isbRed = false.obs;
  var iscRed = false.obs;
  var isdRed = false.obs;
  int timeOut = 2;

  @override
  void onInit() {
    // TODO: implement onInit
    signalALights();
    super.onInit();
  }

  void signalALights() async {
      while(true){
        await Future.delayed(Duration(seconds: timeOut), () {
          print("step>>> A");
          isaRed(false);
          isbRed(true);
          iscRed(false);
          isdRed(false);
          update();
        },);
        await Future.delayed(Duration(seconds: timeOut), () {
          print("step>>> B");
          isaRed(false);
          isbRed(false);
          iscRed(false);
          isdRed(true);
          update();
        },);
        await Future.delayed(Duration(seconds: timeOut), () {
          print("step>>> C");
          isaRed(false);
          isbRed(false);
          iscRed(true);
          isdRed(false);
          update();
        },);
        await Future.delayed(Duration(seconds: timeOut), () {
          print("step>>> D");
          isaRed(true);
          isbRed(false);
          iscRed(false);
          isdRed(false);
          update();
        },);
      }
  }
}
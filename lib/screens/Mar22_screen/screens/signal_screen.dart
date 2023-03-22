import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/screens/Mar22_screen/controller/signal_controller.dart';

class SignalScreen extends StatelessWidget {
  const SignalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signalController = Get.put(SignalController());
    TextEditingController textEditingController = TextEditingController();
    FocusNode focusNode = FocusNode();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Signal Demo'),
        ),
        body: GetBuilder<SignalController>(builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            controller.isaRed.value ? Colors.green : Colors.red,
                        radius: 40.0,
                      ),
                      const Text("A")
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            controller.isbRed.value ? Colors.green : Colors.red,
                        radius: 40.0,
                      ),
                      const Text("B")
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 70.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            controller.iscRed.value ? Colors.green : Colors.red,
                        radius: 40.0,
                      ),
                      const Text("C")
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            controller.isdRed.value ? Colors.green : Colors.red,
                        radius: 40.0,
                      ),
                      const Text("D")
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: TextFormField(
                  focusNode: focusNode,
                  keyboardType: TextInputType.number,
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    hintText: "TimeOut",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        borderSide: BorderSide(color: Colors.black, width: 2)),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    signalController.timeOut =
                        int.parse(textEditingController.text);
                    textEditingController.clear();
                    focusNode.unfocus();
                  },
                  child: const Text("Submit"))
            ],
          );
        }));
  }
}

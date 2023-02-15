import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/screens/feb15_screen/counter_controller.dart';

class CounterHome extends StatelessWidget {
  const CounterHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("======== widget1 ========");
    final Controller c = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Counter with GetX",
          style: TextStyle(fontSize: 26.0),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                'Counter: ${c.count}',
                style: const TextStyle(fontSize: 28.0),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: 'btn1',
                  onPressed: () => c.decrement(),
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: 'btn2',
                  onPressed: () => c.increment(),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(
              height: 100.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20.0),
              ),
              onPressed: () {
                Get.off(() => Other(
                      color: Colors.red,
                    ));
              },
              child: const Text("Go to Other"),
            ),
          ],
        ),
      ),
    );
  }
}

class Other extends StatelessWidget {
  Other({Key? key, required this.color}) : super(key: key);
  Color color;

  final Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    print("======== widget2 ========");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Other Screen"),
        backgroundColor: color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "Counter: ${c.count}",
                style: const TextStyle(fontSize: 26.0),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: 'btn1',
                  onPressed: () => c.decrement(),
                  backgroundColor: color,
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: 'btn2',
                  onPressed: () => c.increment(),
                  backgroundColor: color,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(
              height: 100.0,
            ),
            ElevatedButton(
              onPressed: () {
                Get.off(() => const CounterHome());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                padding: const EdgeInsets.all(20.0),
              ),
              child: const Text("Go to Home"),
            ),
          ],
        ),
      ),
    );
  }
}

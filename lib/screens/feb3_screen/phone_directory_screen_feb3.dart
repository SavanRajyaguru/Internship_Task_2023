import 'package:flutter/material.dart';
import 'package:project1/screens/feb3_screen/widgets/custom_Appbar.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 15.0, right: 15.0),
          child: TabBarView(
            children: [
              Column(
                children: [
                  CustomAppBar(appbarName: 'Phone', iconData: Icons.settings_outlined,),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      children: List.generate(20, (index) {
                        return Card(
                          elevation: 0,
                          color: Colors.indigo.shade50,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              title: const Text("Anna"),
                              textColor: Colors.black,
                              leading: Container(
                                padding: const EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.indigo, width: 2),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: const Text(
                                  "AN",
                                  style: TextStyle(fontSize: 16.0, color: Colors.indigo, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  CustomAppBar(appbarName: 'Missed Called', iconData: Icons.settings_outlined,),
                  buildListTile(),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: buildTabBar(),
      ),
    );
  }

  Expanded buildListTile() {
    return Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: List.generate(20, (index) {
                  return Card(
                    child: ListTile(
                      title: const Text("Anna (3)"),
                      textColor: Colors.black,
                      subtitle: const Text("Few minutes ago"),
                      trailing: const CircleAvatar(
                        backgroundColor: Colors.white54,
                        maxRadius: 25.0,
                        minRadius: 20.0,
                        child: Icon(Icons.phone, color: Colors.greenAccent),
                      ),
                      leading: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.indigo, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Text(
                          "AN",
                           style: TextStyle(fontSize: 16.0, color: Colors.indigo, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            );
  }

  TabBar buildTabBar() {
    return TabBar(
        padding: const EdgeInsets.only(bottom: 40.0, top: 10.0, left: 10.0, right: 10.0),
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelColor: Colors.indigo.shade600,
        labelColor: Colors.white,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
            color: Colors.indigo,
          border: Border.all(color: Colors.indigo.shade600, width: 2)
        ),
        tabs: [
          Tab(
            height: 60.0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.indigo, width: 1)),
              child: const Align(
                alignment: Alignment.center,
                child: Text("Phone"),
              ),
            ),
          ),
          Tab(
            height: 60.0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.indigo, width: 1)),
              child: const Align(
                alignment: Alignment.center,
                child: Text("Missed Calls"),
              ),
            ),
          ),
        ],
      );
  }
}


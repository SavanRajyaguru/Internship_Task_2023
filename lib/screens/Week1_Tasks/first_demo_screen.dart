import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project1/screens/Week1_Tasks/widget/menu.dart';

class FirstDemoScreen extends StatelessWidget {
  const FirstDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Test',
          style: TextStyle(color: Colors.blue.shade900, fontSize: 26),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.blue.shade900,
            size: 26,
          ),
        ),
        elevation: 0.0,
        actions: [
          Icon(
            Icons.edit,
            color: Colors.blue.shade900,
            size: 26,
          ),
          const SizedBox(
            width: 10.0,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.delete), label: 'Delete'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        ],
        selectedItemColor: Colors.blue.shade900,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              height: size.height / 3.5,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      fit: BoxFit.cover)),
            ),
          ),
          Container(
            height: size.height / 4,
            // color: Colors.black,
            child: Column(
              children: [
                Row(
                  children: const [
                    IconMenu(Icons.menu, "Menu"),
                    IconMenu(Icons.delete, "Delete"),
                    IconMenu(Icons.edit, "Edit"),
                    IconMenu(Icons.home, "Home"),
                  ],
                ),
                Row(
                  children: const [
                    IconMenu(Icons.edit, "Edit"),
                    IconMenu(Icons.menu, "Menu"),
                    IconMenu(Icons.home, "Home"),
                    IconMenu(Icons.delete, "Delete"),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: size.height / 4.1,
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    // shape: Border(),
                    color: Colors.grey.shade50,
                    elevation: 5,
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          margin: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                                fit: BoxFit.fill),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Excellent",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            const Text(
                              "Demo Name",
                              style: TextStyle(color: Colors.grey),
                            ),
                            RatingBar.builder(
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              // itemPadding: EdgeInsets.symmetric(horizontal: .0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 10.0,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          width: size.width-370,
                        ),
                        const Icon(Icons.arrow_forward_ios_outlined),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

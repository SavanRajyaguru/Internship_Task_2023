import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: _bottomBar(),
      body: Column(
        children: [
          _basicProfileInfo(),
          _searchBar(),
          Expanded(flex: 2, child: _cardListView()),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Event for you",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                Text(
                  "View More",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(
            child: _listTiles(),
          ),
        ],
      ),
    );
  }

  /// bottom ListView
  Widget _listTiles() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: List.generate(10, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            child: const ListTile(
              isThreeLine: true,
              title: Text("Volunteer Solosup"),
              subtitle: Text("09:00 AM to 03:00 PM \nSurakarta, INA"),
              trailing: ElevatedButton(onPressed: null, child: Text("Join", style: TextStyle(color: Colors.black),)),
              leading: CircleAvatar(
                backgroundImage: NetworkImage("https://picsum.photos/100/300"),
                maxRadius: 30.0,
              ),
            ),
          ),
        );
      }),
    );
  }

  /// list view of card
  Widget _cardListView() {
    return ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(10, (index) {
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    width: MediaQuery.of(context).size.width-150,
                    decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20.0),
                           image: const DecorationImage(
                             image: NetworkImage("https://picsum.photos/400/500"),
                             fit: BoxFit.cover
                           ),
                         ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "08",
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const Text(
                                "June",
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const Text(
                                "Surakarta \nClean City\nTogether",
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Row(
                                children: const [
                                  Icon(
                                    Icons.location_pin,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Surakarta, INA",
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "43 Joined",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage("https://picsum.photos/100/300"),
                        radius: 20.0,
                      ),
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage("https://picsum.photos/100/300"),
                        radius: 20.0,
                      ),
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage("https://picsum.photos/100/300"),
                        radius: 20.0,
                      ),
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage("https://picsum.photos/100/300"),
                        radius: 15.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }

  /// search bar
  Widget _searchBar() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.amber,
                size: 30.0,
              ),
              hintText: "Search for event",
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  /// profile basic information
  Widget _basicProfileInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 55.0, left: 30.0, right: 30.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  " Current Location",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.location_pin,
                      color: Colors.amber,
                    ),
                    Text(
                      "Surakarta, INA",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
          const CircleAvatar(
            backgroundImage: NetworkImage("https://picsum.photos/100/300"),
            radius: 28.0,
          ),
        ],
      ),
    );
  }

  /// custom bottom navigation bar
  Widget _bottomBar() {
    return Container(
      height: 80.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: Icon(
              Icons.home_outlined,
              color: pageIndex == 0 ? Colors.amber : Colors.black87,
              size: 30.0,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: Icon(
              Icons.auto_awesome_mosaic_outlined,
              color: pageIndex == 1 ? Colors.amber : Colors.black87,
              size: 30.0,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: Icon(
              Icons.car_crash_outlined,
              color: pageIndex == 2 ? Colors.amber : Colors.black87,
              size: 30.0,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: Icon(
              Icons.settings,
              color: pageIndex == 3 ? Colors.amber : Colors.black87,
              size: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}

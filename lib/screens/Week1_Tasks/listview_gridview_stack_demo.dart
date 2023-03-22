import 'package:flutter/material.dart';

class ListGridStackDemo extends StatelessWidget {
  const ListGridStackDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Screen"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8.0),
          Expanded(
            // flex: 1,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: List.generate(20, (index) {
                return Center(
                  child: Stack(
                    children: [
                      Image.network(
                        "https://picsum.photos/800/800",
                        fit: BoxFit.cover,
                      ),
                      Container(
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      const Positioned.fill(
                          child: Icon(Icons.camera_alt_outlined, color: Colors.blueGrey, size: 100.0,),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 10.0,),
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, _) {
                  return const Card(
                    elevation: 2,
                    shape: OutlineInputBorder(),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage("https://picsum.photos/100/300"),
                        radius: 30.0,
                      ),
                      title: Text("ListView"),
                      subtitle: Text("Demo Project"),
                      trailing: Icon(Icons.more_vert),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

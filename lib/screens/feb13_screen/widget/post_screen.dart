import 'package:flutter/material.dart';
import 'package:project1/screens/feb13_screen/Bloc/bloc_post.dart';
import 'package:project1/screens/feb13_screen/Bloc/post_info.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  final postBloc = BlocPost();

  @override
  void initState() {
    // TODO: implement initState
    postBloc.eventSink.add(PostAction.Fetch);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('======== widget tree =======');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post List"),
      ),
      body: StreamBuilder<List<PostInfo>>(
        stream: postBloc.postStream,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, index){
                return Card(
                  child: ListTile(
                    title: Text('${snapshot.data![index].title}'),
                    subtitle: Text('${snapshot.data![index].body}'),
                  ),
                );
              },
            );
          }
          if(snapshot.hasError){
            print("=========== not work =========");
            return const Center(
              child: Text('Error'),
            );

          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          postBloc.eventSink.add(PostAction.Increment);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:project1/screens/feb20_screen/services/remote_post_services.dart';

class PostReqDemo extends StatelessWidget {
  const PostReqDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RemotePostService remotePostService = RemotePostService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('PostRequest'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  remotePostService.postProductInfo("this is title section","this is body section",'2');
                },
                child: const Text('Send POST Request')),
            ElevatedButton(
                onPressed: (){
                  remotePostService.putProductInfo("sdfsdfsdfsdf","tsdfsdfsdfsf",'3');
                },
                child: const Text('Send PUT Request')),
            ElevatedButton(
                onPressed: (){
                  remotePostService.patchProductInfo("sdfsdfssdfsfsdfdfsdf",null,null);
                },
                child: const Text('Send PATCH Request')),
          ],
        ),
      ),
    );
  }
}

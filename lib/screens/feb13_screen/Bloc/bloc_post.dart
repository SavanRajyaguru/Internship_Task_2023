import 'dart:async';
import 'dart:convert';

import 'package:project1/screens/feb13_screen/Bloc/post_info.dart';
import 'package:http/http.dart' as http;

enum PostAction {  Fetch, Increment }

class BlocPost{

  int _limit = 1;

  final _stateStreamController = StreamController<List<PostInfo>>();

  StreamSink<List<PostInfo>> get _postSink => _stateStreamController.sink;
  Stream<List<PostInfo>> get postStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<PostAction>();

  StreamSink<PostAction> get eventSink => _eventStreamController.sink;
  Stream<PostAction> get _eventStream => _eventStreamController.stream;

  BlocPost() {
    _eventStream.listen((event) async {
      if(event == PostAction.Fetch){
        try {
          var post = await getPost(_limit);
          if(post != null)
            _postSink.add(post);
          else
            _postSink.addError('========= Not work ======');
        } on Exception catch (e) {
          _postSink.addError(e);
        }
      }

      if(event == PostAction.Increment) {
        try {
          _limit++;
          var post = await getPost(_limit);
          if(post != null)
            _postSink.add(post);
          else
            _postSink.addError('========= Not work Increment ======');
        } on Exception catch (e) {
          _postSink.addError(e);
        }
      }
    });
  }

  Future<List<PostInfo>> getPost(int limit) async {
    List<PostInfo> postInfo = [];
    try{
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts?_start=0&_limit=$limit'));
      if(response.statusCode == 200){
        final posts = jsonDecode(response.body);
        postInfo = posts.map<PostInfo>((post) => PostInfo.fromJson(post)).toList();
        // print(postInfo);
      }
    } catch (e) {
      print('======== error ======== $e');
      // return print(e);
    }
    return postInfo;
  }
}
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:project1/screens/feb10_screen/Model/post_event.dart';
import 'package:project1/screens/feb10_screen/Model/post_model.dart';
import 'package:project1/screens/feb10_screen/Model/post_state.dart';
import 'package:project1/screens/feb10_screen/Repository/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  late final PostRepository postRepository;
  int start = 0, limit = 10;
  bool isFetch = false;

  PostBloc({required this.postRepository}) : super(const PostInitialState());

  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is PostFetchEvent) {
      yield PostLoadingState(message: 'Post is Loading');

      final response = await postRepository.getPost(start: start, limit: limit);

      if (response is http.Response) {
        final posts = jsonDecode(response.body) as List;
        yield PostSuccessState(
            post: posts.map((post) => PostModel.fromJson(post)).toList());
        limit++;
      } else {
        yield PostErrorState(error: response.body);
      }
    }
  }
}

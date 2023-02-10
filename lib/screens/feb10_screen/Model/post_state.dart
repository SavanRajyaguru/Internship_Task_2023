import 'package:project1/screens/feb10_screen/Model/post_model.dart';

abstract class PostState{
  const PostState();
}

class PostInitialState extends PostState{
  const PostInitialState();
}

class PostLoadingState extends PostState{
  String message;
  PostLoadingState({required this.message});
}

class PostSuccessState extends PostState{
  List<PostModel> post;
  PostSuccessState({required this.post});
}

class PostErrorState extends PostState{
  String error;
  PostErrorState({required this.error});
}
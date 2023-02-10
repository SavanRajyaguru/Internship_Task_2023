import 'package:http/http.dart' as http;

class PostRepository{
  static final PostRepository _postRepository = PostRepository();
  PostRepository._();
  
  factory PostRepository() {
    return _postRepository;
  }
  
  Future<dynamic> getPost({required int start, required int limit}) async{
    try{
      return http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts?_start=$start&_limit=$limit'));
    } catch (e){
      return e;
    }
  }
}
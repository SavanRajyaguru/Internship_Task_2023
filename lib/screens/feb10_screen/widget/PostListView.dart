import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/screens/feb10_screen/Bloc/post_bloc.dart';
import 'package:project1/screens/feb10_screen/Model/post_event.dart';
import 'package:project1/screens/feb10_screen/Model/post_model.dart';
import 'package:project1/screens/feb10_screen/Model/post_state.dart';
import 'package:project1/screens/feb10_screen/Repository/post_repository.dart';

class PostListView extends StatelessWidget {
  const PostListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<PostModel> post = [];
    final ScrollController scrollController = ScrollController();

    return BlocProvider(
      create: (context) =>
      PostBloc(postRepository: PostRepository())
        ..add(const PostFetchEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Post'),),
        body: Center(
          child: BlocConsumer<PostBloc, PostState>(
            listener: (BuildContext context, postState) {
              if (postState is PostLoadingState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(postState.message)));
              }
              else if (postState is PostSuccessState && postState.post.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No more Posts')));
              }
              else if (postState is PostErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(postState.error)));
                BlocProvider
                    .of<PostBloc>(context)
                    .isFetch = false;
              }
              return;
            },
            builder: (context, postState) {
              if (postState is PostInitialState ||
                  (postState is PostLoadingState && post.isEmpty)) {
                return const Center(child: CircularProgressIndicator());
              }
              else if (postState is PostSuccessState) {
                post.addAll(postState.post);
                BlocProvider
                    .of<PostBloc>(context)
                    .isFetch = false;
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              }
              else if (postState is PostErrorState && post.isEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: () {
                      BlocProvider.of<PostBloc>(context)
                        ..isFetch = true
                        ..add(const PostFetchEvent());
                    }, icon: const Icon(Icons.refresh)),
                    Text(postState.error, textAlign: TextAlign.center,)
                  ],
                );
              }
              return ListView.builder(
                controller: scrollController
                  ..addListener(() {
                    if (scrollController.offset ==
                        scrollController.position.maxScrollExtent &&
                        !BlocProvider
                            .of<PostBloc>(context)
                            .isFetch ) {
                      BlocProvider.of<PostBloc>(context)..isFetch = true..add(const PostFetchEvent());
                    }
                  }),
                itemCount: post.length,
                itemBuilder: (BuildContext context, index){
                  return Card(
                    child: ListTile(
                      title: Text('${post[index].title}'),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

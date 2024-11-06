import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:infinite_list/post/bloc/post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/post/bloc/post_event.dart';
import 'package:infinite_list/post/view/post.list.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => PostBloc(httpClient: http.Client())..add(PostFetch()),
        child: const PostList(),
      ),
    );
  }
}
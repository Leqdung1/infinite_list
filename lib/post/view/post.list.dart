import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/post/bloc/post_bloc.dart';
import 'package:infinite_list/post/bloc/post_event.dart';
import 'package:infinite_list/post/bloc/post_state.dart';
import 'package:infinite_list/post/widgets/bottom_loader.dart';
import 'package:infinite_list/post/widgets/post_list_item.dart';

class PostList extends StatefulWidget {
  const PostList({super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final _scrollerController = ScrollController();
  @override
  Widget build(BuildContext context) {
    

    @override
    void initState() {
      super.initState();
      _scrollerController.addListener(_onScroll);
    }

    @override
    void dispose() {
      super.dispose();
      _scrollerController.dispose();
    }

    return BlocBuilder<PostBloc, PostState>(builder: (context, state) {
      switch (state.status) {
        case PostStatus.failure:
          return const Center(child: Text('Failed to load posts'));
        case PostStatus.success:
          if (state.posts.isEmpty) {
            return const Center(
              child: Text('no post'),
            );
          }
          return ListView.builder(
              itemCount: state.hasReachedMax
                  ? state.posts.length
                  : state.posts.length + 1,
              itemBuilder: (BuildContext context, int index) {
                return index >= state.posts.length
                    ? const BottomLoader()
                    : PostListItem(post: state.posts[index]);
              });
        case PostStatus.initial:
          return const Center(
            child: CircularProgressIndicator(),
          );
      }
    });
  }

  void _onScroll() {
    if (_isBottom) context.read<PostBloc>().add(PostFetch());
  }

    bool get _isBottom {
    if (!_scrollerController.hasClients) return false;
    final maxScroll = _scrollerController.position.maxScrollExtent;
    final currentScroll = _scrollerController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

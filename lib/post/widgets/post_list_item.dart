import 'package:flutter/material.dart';
import 'package:infinite_list/post/models/post.dart';

class PostListItem extends StatelessWidget {
  final Post post;
  const PostListItem({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text(
          '${post.id}',
          style: textTheme.bodyMedium,
        ),
        title: Text(post.title, style: textTheme.bodySmall),
        isThreeLine: true,
        subtitle: Text(post.body, style: textTheme.bodySmall),
        dense: true,
      ),
    );
  }
}

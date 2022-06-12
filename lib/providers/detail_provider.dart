import 'package:assessment/models/post.dart';
import 'package:assessment/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailProvider extends ChangeNotifier {
  late Post _post;

  static get proxy => ChangeNotifierProxyProvider<PostProvider, DetailProvider>(
      create: (_) => DetailProvider(),
      update: (_, PostProvider post, DetailProvider? detail) {
        final Post? _post = post.selectedPost;

        if (detail == null) return DetailProvider();

        return detail..update(_post);
      });

  Post get post => _post;

  void update(Post? post) {
    _post = post ?? _unknown;
  }

  static Post get _unknown => Post(
        id: 0,
        title: "Unknown",
        body: "Unknown",
        userId: 0,
      );
}

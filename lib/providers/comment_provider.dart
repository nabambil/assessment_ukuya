import 'package:assessment/providers/post_provider.dart';
import 'package:assessment/utils/constant.dart';
import 'package:assessment/utils/network.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/comment.dart';
import '../models/post.dart';

class CommentProvider extends ChangeNotifier {
  final List<Comment> _comments = [];

  static get proxy =>
      ChangeNotifierProxyProvider<PostProvider, CommentProvider>(
          create: (_) => CommentProvider(),
          update: (_, PostProvider post, CommentProvider? comment) {
            final Post? _post = post.selectedPost;
            if (comment == null || _post == null) return CommentProvider();

            return comment..update(_post.id);
          });

  CommentProvider();

  update(int? postId) {
    if (postId != null) {
      final NetworkImp<List<Map<String, dynamic>>> network =
          NetworkImp<List<Map<String, dynamic>>>();
      network.endpoint = kComments + postId.toString();

      network
          .get()
          .then((value) => value.map((e) => Comment.fromJson(e)))
          .then((value) => _comments.addAll(value))
          .whenComplete(notifyListeners);
    }
  }

  List<Comment> get comments => _comments;
}

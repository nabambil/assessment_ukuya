import 'package:assessment/models/post.dart';
import 'package:assessment/utils/constant.dart';
import 'package:assessment/utils/network.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  final List<Post> posts = [];
  List<Post> filterPosts = [];
  late Post? selectedPost;

  PostProvider() {
    final NetworkImp<List<Map<String, dynamic>>> network =
        NetworkImp<List<Map<String, dynamic>>>();
    network.endpoint = kPosts;

    network
        .get()
        .then((value) => value.map((e) => Post.fromJson(e)))
        .then((value) {
      posts.addAll(value);
      filterPosts.addAll(value);
    }).whenComplete(notifyListeners);
  }

  set post(Post value) {
    selectedPost = value;
    notifyListeners();
  }

  void update(String query) {
    filterPosts = [];
    filterPosts = posts
        .where((element) => element.isContain(query, itemType.isTitle))
        .toList();

    notifyListeners();
  }
}

import 'package:assessment/models/comment.dart';
import 'package:assessment/models/post.dart';
import 'package:assessment/models/user.dart';
import 'package:assessment/utils/constant.dart';
import 'package:assessment/utils/network.dart';

abstract class Repository {
  Future<List<Comment>> comments({required int postId});
  Future<List<Post>> posts();
  Future<Post> post({required int postId});
  Future<List<User>> users();
  Future<User> user({required int userId});
}

class RepositoryImp implements Repository {
  final NetworkImp<Map<String, dynamic>> networkItem =
      NetworkImp<Map<String, dynamic>>();
  final NetworkImp<List<Map<String, dynamic>>> networkList =
      NetworkImp<List<Map<String, dynamic>>>();

  @override
  Future<List<Comment>> comments({required int postId}) async {
    networkList.endpoint = kComments + postId.toString();
    try {
      final response = await networkList.get();

      final List<Comment> items =
          response.map((e) => Comment.fromJson(e)).toList();

      return items;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Post>> posts() async {
    networkList.endpoint = kPosts;
    try {
      final response = await networkList.get();

      final List<Post> items = response.map((e) => Post.fromJson(e)).toList();

      return items;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<User>> users() async {
    networkList.endpoint = kUsers;
    try {
      final response = await networkList.get();

      final List<User> items = response.map((e) => User.fromJson(e)).toList();

      return items;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Post> post({required int postId}) async {
    networkItem.endpoint = kPosts + postId.toString();
    try {
      final response = await networkItem.get();

      final Post item = Post.fromJson(response);

      return item;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<User> user({required int userId}) async {
    networkItem.endpoint = kUsers + userId.toString();

    try {
      final response = await networkItem.get();

      final User item = User.fromJson(response);

      return item;
    } catch (e) {
      rethrow;
    }
  }
}

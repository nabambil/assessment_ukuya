import 'package:assessment/models/post.dart';
import 'package:assessment/models/user.dart';
import 'package:assessment/providers/post_provider.dart';
import 'package:assessment/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileProvider extends ChangeNotifier {
  late final User _user;

  static get proxy =>
      ChangeNotifierProxyProvider2<PostProvider, UserProvider, ProfileProvider>(
          create: (_) => ProfileProvider(),
          update: (_, PostProvider post, UserProvider user,
              ProfileProvider? profile) {
            final Post? _post = post.selectedPost;
            if (profile == null || _post == null) return ProfileProvider();

            return ProfileProvider()..update(user: user.user(_post.userId));
          });

  ProfileProvider();

  User get user => _user;
  String get username => _user.username;
  String get name => _user.name;
  String get email => _user.email;
  String get phone => _user.phone;
  String get website => _user.website;

  void update({User? user}) {
    _user = user ?? _unknown;
  }

  static User get _unknown => User(
        id: 0,
        name: "Unknown",
      );
}

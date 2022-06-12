import 'package:assessment/models/user.dart';
import 'package:assessment/utils/constant.dart';
import 'package:assessment/utils/network.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  List<User> users = [];
  User? selectedUser;

  UserProvider() {
    final NetworkImp<List<Map<String, dynamic>>> network =
        NetworkImp<List<Map<String, dynamic>>>();
    network.endpoint = kUsers;

    network
        .get()
        .then((value) => value.map((e) => User.fromJson(e)))
        .then((value) => users.addAll(value))
        .whenComplete(notifyListeners);
  }

  User user(int id) => users.firstWhere(
      (element) => element.isContain(
            id.toString(),
            itemType.isUser,
          ),
      orElse: () => _unknownUser);

  String username(int id) => users
      .firstWhere(
          (element) => element.isContain(
                id.toString(),
                itemType.isUser,
              ),
          orElse: () => _unknownUser)
      .username;

  User get _unknownUser => User(id: 0, username: "Unknown", name: "Unknown");
}

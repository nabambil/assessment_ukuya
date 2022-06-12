import 'package:assessment/models/user.dart';
import 'package:assessment/providers/user_provider.dart';
import 'package:assessment/utils/constant.dart';
import 'package:assessment/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/post.dart';
import 'text_widget.dart';

class DetailItem extends StatelessWidget {
  final Post post;
  const DetailItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserProvider _userProvider =
        Provider.of<UserProvider>(context, listen: true);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BodyText(value: post.body),
          UsernameText(value: _userProvider.username(post.userId)),
          _NavigateAuthor(user: _userProvider.user(post.userId)),
          const Divider(
            color: black,
            height: 0,
          )
        ],
      ),
    );
  }
}

class _NavigateAuthor extends StatelessWidget {
  final User user;
  const _NavigateAuthor({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, kProfileRoute),
      child: const HintText(value: "> More about author "),
    );
  }
}

import 'package:assessment/providers/post_provider.dart';
import 'package:assessment/providers/user_provider.dart';
import 'package:assessment/utils/constant.dart';
import 'package:assessment/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:assessment/models/post.dart';
import 'package:provider/provider.dart';
import 'text_widget.dart';

class PostItem extends StatelessWidget {
  final Post post;
  const PostItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserProvider _userProvider =
        Provider.of<UserProvider>(context, listen: true);
    final PostProvider _postProvider =
        Provider.of<PostProvider>(context, listen: true);

    return GestureDetector(
      onTap: () {
        _postProvider.post = post;
        Navigator.pushNamed(context, kDetailRoute);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(value: post.title),
            BodyText(value: post.body),
            UsernameText(value: _userProvider.username(post.userId)),
            const Divider(
              color: black,
              height: 0,
            )
          ],
        ),
      ),
    );
  }
}

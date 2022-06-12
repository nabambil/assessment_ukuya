import 'package:assessment/models/comment.dart';
import 'package:assessment/utils/theme/colors.dart';
import 'package:flutter/material.dart';

import 'text_widget.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;
  const CommentItem({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BodyText(value: comment.name),
          UsernameText(value: comment.email),
          const Divider(
            color: black,
            height: 0,
          )
        ],
      ),
    );
  }
}

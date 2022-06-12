import 'package:assessment/providers/comment_provider.dart';
import 'package:assessment/providers/detail_provider.dart';
import 'package:assessment/providers/post_provider.dart';
import 'package:assessment/utils/theme/colors.dart';
import 'package:assessment/view/widgets/comment_widget.dart';
import 'package:assessment/view/widgets/detail_widget.dart';
import 'package:assessment/view/widgets/post_widget.dart';
import 'package:assessment/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DetailProvider _detailProvider =
        Provider.of<DetailProvider>(context, listen: true);
    final CommentProvider _commentProvider =
        Provider.of<CommentProvider>(context, listen: true);
    final PostProvider _postProvider =
        Provider.of<PostProvider>(context, listen: true);
    final _post = _detailProvider.post;

    return WillPopScope(
      onWillPop: () async {
        _postProvider.selectedPost = null;
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          titleTextStyle: const TextStyle(color: black, fontSize: 24),
          iconTheme: const IconThemeData(color: black),
          elevation: 0,
          backgroundColor: white,
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: HeaderText(value: _post.title),
          ),
          DetailItem(post: _post),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: SubheaderText(value: "Comments"),
          ),
          ..._commentProvider.comments
              .map((e) => CommentItem(comment: e))
              .toList()
        ]),
      ),
    );
  }
}

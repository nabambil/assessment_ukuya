import 'package:assessment/providers/post_provider.dart';
import 'package:assessment/utils/theme/colors.dart';
import 'package:assessment/view/widgets/post_widget.dart';
import 'package:assessment/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context, listen: true);

    return Scaffold(
      appBar: _Appbar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            ...postProvider.filterPosts.map<PostItem>((e) => PostItem(post: e)),
          ],
        ),
      ),
    );
  }
}

class _Appbar extends StatefulWidget implements PreferredSizeWidget {
  _Appbar({Key? key})
      : preferredSize = const Size.fromHeight(120),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  State<_Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<_Appbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const _SearchBar(),
      backgroundColor: transparent,
      shadowColor: transparent,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: const HeaderText(value: "Posts"),
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context, listen: true);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6),
      child: TextField(
        decoration: const InputDecoration(
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (value) {
          postProvider.update(value);
        },
      ),
    );
  }
}

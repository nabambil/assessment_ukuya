import 'package:assessment/providers/comment_provider.dart';
import 'package:assessment/providers/detail_provider.dart';
import 'package:assessment/providers/post_provider.dart';
import 'package:assessment/providers/profile_provider.dart';
import 'package:assessment/providers/user_provider.dart';
import 'package:assessment/utils/constant.dart';
import 'package:assessment/view/detail_screen.dart';
import 'package:assessment/view/post_screen.dart';
import 'package:assessment/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'models/post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PostProvider>(create: (_) => PostProvider()),
        ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
        DetailProvider.proxy,
        CommentProvider.proxy,
        ProfileProvider.proxy,
      ],
      child: MaterialApp(
        title: 'Ukuya Assessment',
        initialRoute: kMainRoute,
        debugShowCheckedModeBanner: false,
        theme: _buildTheme(Brightness.light),
        routes: {
          kMainRoute: (context) => const PostScreen(),
          kDetailRoute: (context) => const DetailScreen(),
          kProfileRoute: (context) => const ProfileScreen(),
        },
      ),
    );
  }

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.montserratTextTheme(baseTheme.textTheme),
    );
  }
}

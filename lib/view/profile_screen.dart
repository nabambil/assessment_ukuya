import 'package:assessment/providers/profile_provider.dart';
import 'package:assessment/utils/theme/colors.dart';
import 'package:assessment/view/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        iconTheme: const IconThemeData(color: black),
      ),
      body: ListView(children: const [
        _UserProfile(),
      ]),
    );
  }
}

class _UserProfile extends StatelessWidget {
  const _UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileProvider _profileProvider =
        Provider.of<ProfileProvider>(context, listen: true);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderText(value: _profileProvider.username),
          SubheaderText(value: _profileProvider.name),
          const Divider(
            color: black,
            height: 26,
          ),
          const BodyText(value: "email"),
          TitleText(value: _profileProvider.email),
          const BodyText(value: "phone"),
          TitleText(value: _profileProvider.phone),
          const BodyText(value: "website"),
          TitleText(value: _profileProvider.website),
          const BodyText(value: "company"),
          TitleText(value: _profileProvider.user.company?.name ?? ""),
        ],
      ),
    );
  }
}

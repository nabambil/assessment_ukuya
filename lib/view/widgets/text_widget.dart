import 'package:assessment/utils/theme/colors.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String value;
  const TitleText({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(value, style: _style),
    );
  }

  TextStyle get _style =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
}

class BodyText extends StatelessWidget {
  final String value;
  const BodyText({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(value, style: _style),
    );
  }

  TextStyle get _style => const TextStyle(fontSize: 14);
}

class UsernameText extends StatelessWidget {
  final String value;
  const UsernameText({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(value, style: _style),
    );
  }

  TextStyle get _style =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
}

class HintText extends StatelessWidget {
  final String value;
  const HintText({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(value, style: _style),
    );
  }

  TextStyle get _style =>
      TextStyle(fontSize: 14, color: black.withOpacity(0.6));
}

class HeaderText extends StatelessWidget {
  final String value;
  const HeaderText({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(value, style: _style),
    );
  }

  TextStyle get _style =>
      const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: black);
}

class SubheaderText extends StatelessWidget {
  final String value;
  const SubheaderText({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(value, style: _style),
    );
  }

  TextStyle get _style =>
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: black);
}

import 'package:flutter/material.dart';

class ArticleTextfield extends StatelessWidget {
  const ArticleTextfield({
    super.key,
    required this.maxLines,
    required this.hintText,
  });

  final int maxLines;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}

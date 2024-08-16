import 'package:flutter/material.dart';
import 'package:kayple/ui/design_systems/app_colors.dart';
import 'package:kayple/ui/design_systems/app_text_styles.dart';

class ArticleView extends StatelessWidget {
  final String title;
  final String content;

  const ArticleView({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: AppTextStyles.body3Medium.copyWith(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          content,
          style: AppTextStyles.body3Medium.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}

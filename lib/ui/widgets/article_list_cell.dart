import 'package:flutter/material.dart';
import 'package:kayple/core/constants/app_values.dart';
import 'package:kayple/ui/design_systems/app_colors.dart';
import 'package:kayple/ui/design_systems/app_text_styles.dart';

class ArticleListCell extends StatelessWidget {
  const ArticleListCell({
    super.key,
    required this.title,
    required this.content,
    required this.id,
    required this.onTap,
  });

  final String title;
  final String content;
  final String id;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkGray,
          borderRadius: BorderRadius.circular(AppValues.borderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    AppTextStyles.subhead4Bold.copyWith(color: AppColors.white),
              ),
              const SizedBox(height: 5),
              Text(content,
                  style: AppTextStyles.body1Regular
                      .copyWith(color: AppColors.white)),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kayple/ui/design_systems/app_colors.dart';
import 'package:kayple/ui/design_systems/app_text_styles.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.darkGray,
        ),
        child: Center(
          child: Text(
            '등록',
            style: AppTextStyles.display1Bold.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}

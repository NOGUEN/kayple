import 'package:flutter/material.dart';
import 'package:kayple/core/viewmodels/write_article_viewmodel.dart';
import 'package:kayple/ui/design_systems/app_colors.dart';
import 'package:kayple/ui/design_systems/app_text_styles.dart';
import 'package:kayple/ui/views/base_view.dart';
import 'package:kayple/ui/widgets/submit_button.dart';

class WriteArticleView extends StatelessWidget {
  const WriteArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<WriteArticleViewmodel>(
      model: WriteArticleViewmodel(),
      onModelReady: (WriteArticleViewmodel model) => model.initModel(),
      builder: (BuildContext context, WriteArticleViewmodel model, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'kayple',
              style: TextStyle(color: AppColors.white),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                TextField(
                  controller: model.titleEditingController,
                  style: AppTextStyles.body2Medium
                      .copyWith(color: AppColors.white),
                  cursorColor: AppColors.primary,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: model.contentEditingController,
                  style: AppTextStyles.body2Medium
                      .copyWith(color: AppColors.white),
                  cursorColor: AppColors.primary,
                  maxLines: 20,
                ),
                const SizedBox(height: 20),
                SubmitButton(
                  onTap: () {
                    model.uploadArticle();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

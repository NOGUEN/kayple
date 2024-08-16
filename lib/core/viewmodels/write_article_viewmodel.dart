import 'package:flutter/material.dart';
import 'package:kayple/core/models/article_model.dart';
import 'package:kayple/core/repository/write_article_repository.dart';
import 'package:kayple/core/viewmodels/base_viewmodel.dart';

class WriteArticleViewmodel extends BaseViewmodel {
  WriteArticleRepository articleRepository = WriteArticleRepository();
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController contentEditingController = TextEditingController();

  @override
  Future<void> initModel() async {
    setBusy(true);

    setBusy(false);
  }

  Future<void> uploadArticle() async {
    try {
      articleRepository.createArticle(
        ArticleModel(
          title: titleEditingController.text,
          content: contentEditingController.text,
          id: '',
          uploadTime: DateTime.now(),
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

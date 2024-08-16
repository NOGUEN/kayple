import 'package:flutter/material.dart';
import 'package:kayple/core/models/article_model.dart';
import 'package:kayple/core/repository/home_article_repository.dart';
import 'package:kayple/core/viewmodels/base_viewmodel.dart';

class HomeViewModel extends BaseViewmodel {
  HomeArticleRepository articleRepository = HomeArticleRepository();
  List<ArticleModel> articles = [];
  bool hasMore = true;
  bool isBusy = false;

  @override
  Future<void> initModel() async {
    setBusy(true);
    await loadArticleList(15);
    setBusy(false);
  }

  Future<void> loadArticleList(int limit) async {
    if (isBusy || !hasMore) return;

    isBusy = true;
    try {
      List<ArticleModel> newArticles =
          await articleRepository.loadArticleList(limit);
      if (newArticles.length < limit) {
        hasMore = false;
      }
      articles.addAll(newArticles);
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
    isBusy = false;
  }

  void resetPagination() {
    articles.clear();
    hasMore = true;
    articleRepository.resetPagination();
  }
}

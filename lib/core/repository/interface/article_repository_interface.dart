import 'package:kayple/core/models/article_model.dart';

// 모든 페이지에서 세가지 인터페이스를 다 사용하는 것이 아니라서 인터페이스를 나눴습니다.

abstract class ArticleCreateInterface {
  Future<void> createArticle(ArticleModel article);
}

abstract class ArticleLoadInterface {
  Future<List<ArticleModel>> loadArticleList(int limit);
}

//삭제 인터페이스는 구현하지 않았습니다.
abstract class ArticleDeleteInterface {
  Future<void> deleteArticle(String uuid);
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kayple/core/models/article_model.dart';
import 'package:kayple/core/repository/interface/article_repository_interface.dart';

class WriteArticleRepository implements ArticleCreateInterface {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> createArticle(ArticleModel article) async {
    final articlesRef =
        _firestore.collection('articles').withConverter<ArticleModel>(
              fromFirestore: (snapshot, _) =>
                  ArticleModel.fromJson(snapshot.data()!),
              toFirestore: (article, _) => article.toJson(),
            );

    articlesRef.add(article);
  }
}

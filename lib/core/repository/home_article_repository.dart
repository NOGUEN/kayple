import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kayple/core/models/article_model.dart';

class HomeArticleRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DocumentSnapshot? _lastDocument;
  bool _hasMore = true;

  Future<List<ArticleModel>> loadArticleList(int limit) async {
    if (!_hasMore) {
      return [];
    }

    Query query = _firestore
        .collection('articles')
        .orderBy('uploadTime', descending: true)
        .limit(limit);

    if (_lastDocument != null) {
      query = query.startAfterDocument(_lastDocument!);
    }

    QuerySnapshot querySnapshot = await query.get();

    if (querySnapshot.docs.isNotEmpty) {
      _lastDocument = querySnapshot.docs.last;
      if (querySnapshot.docs.length < limit) {
        _hasMore = false;
      }
    } else {
      _hasMore = false;
    }

    debugPrint(
      querySnapshot.docs
          .map((doc) =>
              ArticleModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList()
          .toString(),
    );

    return querySnapshot.docs
        .map((doc) => ArticleModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  void resetPagination() {
    _lastDocument = null;
    _hasMore = true;
  }
}

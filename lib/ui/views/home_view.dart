import 'package:flutter/material.dart';
import 'package:kayple/core/constants/route_paths.dart';
import 'package:kayple/core/viewmodels/home_viewmodel.dart';
import 'package:kayple/ui/views/base_view.dart';
import 'package:kayple/ui/widgets/article_list_cell.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      model: HomeViewModel(),
      onModelReady: (HomeViewModel model) => model.initModel(),
      builder: (BuildContext context, HomeViewModel model, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('kayple'),
            centerTitle: false,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            // 최신 데이터 동기화를 위해 가장 상단으로 스크롤 시 데이터를 새롭게 받아옵니다.
            child: RefreshIndicator(
              onRefresh: () async {
                model.resetPagination();
                await model.loadArticleList(15);
              },
              child: NotificationListener<ScrollNotification>(
                // 가장 하단으로 스크롤 할 시, 새로운 데이터를 받아옵니다.
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent &&
                      !model.isBusy &&
                      model.hasMore) {
                    model.loadArticleList(15);
                  }
                  return false;
                },
                child: ListView.builder(
                  itemCount: model.articles.length + 1,
                  itemBuilder: (context, index) {
                    if (index == model.articles.length) {
                      return model.hasMore
                          ? const Center(child: CircularProgressIndicator())
                          : Container();
                    }

                    var article = model.articles[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: ArticleListCell(
                        title: article.title,
                        content: article.content,
                        id: article.id,
                        onTap: () async {
                          Navigator.of(context).pushNamed(
                            RoutePaths.Article,
                            arguments: {
                              'title': article.title,
                              'content': article.content,
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RoutePaths.WriteArticle);
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

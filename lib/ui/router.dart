import 'package:flutter/material.dart';
import 'package:kayple/core/constants/route_paths.dart';
import 'package:kayple/ui/views/article_view.dart';
import 'package:kayple/ui/views/home_view.dart';
import 'package:kayple/ui/views/write_article_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
          settings: const RouteSettings(name: RoutePaths.Home),
        );

      case RoutePaths.WriteArticle:
        return MaterialPageRoute(
          builder: (_) => const WriteArticleView(),
          settings: const RouteSettings(name: RoutePaths.WriteArticle),
        );

      case RoutePaths.Article:
        final arguments = settings.arguments as Map<String, String>?;

        return MaterialPageRoute(
          builder: (_) => ArticleView(
            title: arguments?['title'] ?? 'No Title',
            content: arguments?['content'] ?? 'No Content',
          ),
          settings: const RouteSettings(name: RoutePaths.Article),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

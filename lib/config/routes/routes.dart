import 'package:flutter/material.dart';
import 'package:clean_architecture/presentation/user/presentation/views/user_screen.dart';

import '../../presentation/daily_news/domain/entities/article.dart';
import '../../presentation/daily_news/presentation/pages/article_detail/article_detail.dart';
import '../../presentation/daily_news/presentation/pages/home/daily_news.dart';
import '../../presentation/daily_news/presentation/pages/saved_article/saved_article.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const DailyNews());

      case '/ArticleDetails':
        return _materialRoute(
            ArticleDetailsView(article: settings.arguments as ArticleEntity));

      case '/SavedArticles':
        return _materialRoute(const SavedArticles());

      case '/getAllUser':
        return _materialRoute(UserListPage());

      default:
        return _materialRoute(const DailyNews());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}

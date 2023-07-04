import 'package:article_app/modules/dashboard/domain/models/article.dart';

abstract class ArticleRepo {
  Future<List<Article>> getArticles();
}
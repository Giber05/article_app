import 'package:article_app/infrastructure/client/api_client.dart';
import 'package:article_app/modules/dashboard/data/mapper/remote/response/article_remote_mapper.dart';
import 'package:article_app/modules/dashboard/domain/models/article.dart';
import 'package:injectable/injectable.dart';

abstract class ArticleRemoteDts {
  Future<APIResult<List<Article>>> getArticles();
}

@Injectable(as: ArticleRemoteDts)
class ArticleRemoteDtsImpl implements ArticleRemoteDts {
  final APIClient _client;

  ArticleRemoteDtsImpl(this._client);

  @override
  Future<APIResult<List<Article>>> getArticles() async {
    return _client.get(
      path: '/articles',
      shouldPrint: false,
      mapper: (json) {
        final articles = json['articles'] as List<dynamic>;
        return articles
            .map((article) => ArticleRemoteResMapper().toModel(article))
            .toList();
      },
    );
  }
}

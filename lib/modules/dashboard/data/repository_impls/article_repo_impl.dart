import 'package:article_app/infrastructure/client/api_client.dart';
import 'package:article_app/modules/dashboard/data/datasource/remote/article_remote_dts.dart';
import 'package:article_app/modules/dashboard/domain/models/article.dart';
import 'package:article_app/modules/dashboard/domain/repositories/article_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ArticleRepo)
class ArticleRepoImpl implements ArticleRepo {
  final ArticleRemoteDts _articleRemoteDts;

  ArticleRepoImpl(this._articleRemoteDts);
  @override
  Future<List<Article>> getArticles() async {
    return await _articleRemoteDts.getArticles().futureData;
  }
}

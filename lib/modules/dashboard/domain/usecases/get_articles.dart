import 'package:article_app/infrastructure/architecutre/use_case.dart';
import 'package:article_app/infrastructure/types/resource.dart';
import 'package:article_app/modules/dashboard/domain/models/article.dart';
import 'package:article_app/modules/dashboard/domain/repositories/article_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetArticles extends UsecaseNoParams<List<Article>> {
  final ArticleRepo _articleRepo;

  GetArticles(this._articleRepo);

  @override
  Future<Resource<List<Article>>> execute() async {
    return await _articleRepo.getArticles().asResource;
  }
}

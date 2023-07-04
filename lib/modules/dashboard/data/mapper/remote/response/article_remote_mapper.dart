import 'package:article_app/infrastructure/types/mapper/json_mapper.dart';
import 'package:article_app/modules/authentication/data/mapper/remote/response/created_remote_mapper.dart';
import 'package:article_app/modules/authentication/data/mapper/remote/response/user_session_remote_mapper.dart';
import 'package:article_app/modules/dashboard/domain/models/article.dart';

class ArticleRemoteResMapper implements FromJSONMapper<Article> {
  @override
  Article toModel(json) {
    return Article(
        uuid: json['uuid'],
        title: json['title'],
        content: json['content'],
        image: json['image'],
        views: json['views'],
        created: CreatedRemoteMapper().toModel(json),
        user: UserSessionRemoteResMapper().toModel(json));
  }
}

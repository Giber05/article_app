import 'package:article_app/modules/authentication/domain/model/created.dart';
import 'package:article_app/modules/authentication/domain/model/user_session.dart';
import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String uuid;
  final String title;
  final String content;
  final String? image;
  final int views;
  final Created created;
  final UserSession user;

  const Article({
    required this.uuid,
    required this.title,
    required this.content,
    required this.image,
    required this.views,
    required this.created,
    required this.user,
  });

  @override
  List<Object?> get props => [
        uuid,
        title,
        content,
        image,
        views,
        created,
        user,
      ];
}

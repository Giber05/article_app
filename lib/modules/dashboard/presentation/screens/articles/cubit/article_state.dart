// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'article_cubit.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

class ArticleInitial extends ArticleState {}

class ArticleLoading extends ArticleState {}

class ArticleLoaded extends ArticleState {
  final List<Article> articles;
  const ArticleLoaded({
    required this.articles,
  });
}

class ArticleFailed extends ArticleState {
  final String message;
  const ArticleFailed({
    required this.message,
  });
}

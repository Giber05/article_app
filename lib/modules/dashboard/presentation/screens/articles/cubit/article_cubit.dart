import 'package:article_app/infrastructure/architecutre/cubits/messenger/messenger_cubit.dart';
import 'package:article_app/infrastructure/types/resource.dart';
import 'package:article_app/modules/dashboard/domain/models/article.dart';
import 'package:article_app/modules/dashboard/domain/usecases/get_articles.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'article_state.dart';

@injectable
class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit(this._getArticles, this._messengerCubit) : super(ArticleInitial());

  final GetArticles _getArticles;
  final MessengerCubit _messengerCubit;

  void getArticles() async {
    emit(ArticleLoading());
    final result = await _getArticles();
    switch (result) {
      case Success():
        emit(ArticleLoaded(articles: result.data));
      case Error():
        final exception = result.exception;

        emit(ArticleFailed(message: exception.message));
        _messengerCubit.showErrorSnackbar(exception.message);
    }
  }
}

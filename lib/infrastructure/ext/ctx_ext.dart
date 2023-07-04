import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:article_app/infrastructure/architecutre/cubits/session/session_cubit.dart';
import 'package:article_app/modules/authentication/domain/model/user_session.dart';

extension CtxExt on BuildContext {
  ColorScheme get color => Theme.of(this).colorScheme;
  TextTheme get text => Theme.of(this).textTheme;
  UserSession get userSession => read<SessionCubit>().state.session!;
  void logout() => read<SessionCubit>().logOut();
}

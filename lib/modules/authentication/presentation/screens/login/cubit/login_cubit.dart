// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:article_app/infrastructure/architecutre/cubits/messenger/messenger_cubit.dart';
import 'package:article_app/infrastructure/types/exceptions/form_exception.dart';
import 'package:article_app/infrastructure/types/resource.dart';
import 'package:article_app/modules/authentication/domain/model/user_session.dart';
import 'package:article_app/modules/authentication/domain/usecases/login.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final Login _login;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  Map<String, String> errors = {};
  final MessengerCubit _messengerCubit;
  LoginCubit(
    this._login,
    this._messengerCubit,
  ) : super(LoginInIdle());

  void login() async {
    emit(LoginLoading());
    final result =
        await _login(LoginParams(email: email.text, password: password.text));
    switch (result) {
      case Success(data: UserSession data):
        emit(LoginSuccess(data));
      case Error():
        final exception = result.exception;
        if (exception is FormException) {
          final errors = exception.joinnedError;
          showErrors(errors);
        }
        _messengerCubit.showErrorSnackbar(exception.message);
        emit(LoginInIdle());
    }
  }

  showErrors(Map<String, String> errors) {
    this.errors = errors;
    formKey.currentState?.validate();
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();

    return super.close();
  }
}

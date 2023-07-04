import 'package:injectable/injectable.dart';
import 'package:article_app/infrastructure/architecutre/use_case.dart';
import 'package:article_app/infrastructure/client/api_client.dart';
import 'package:article_app/modules/authentication/data/datasource/local/authentication_local_dts.dart';
import 'package:article_app/modules/authentication/data/datasource/remote/authenticatation_remote_dts.dart';
import 'package:article_app/modules/authentication/domain/repositories/authentication_repo.dart';
import 'package:article_app/modules/authentication/domain/model/user_session.dart';

@Injectable(as: AuthenticationRepo)
class AuthenticationRepoImpl implements AuthenticationRepo {
  final AuthenticationRemoteDTS _authenticationRemoteDTS;
  final AuthenticationLocalDTS _authLocalDTS;

  AuthenticationRepoImpl(this._authenticationRemoteDTS, this._authLocalDTS);

  @override
  Future<UserSession> login(
      {required String email, required String password}) async {
    final loginResult =
        await _authenticationRemoteDTS.login(email: email, password: password);
    await _authLocalDTS.putSession(loginResult.data);
    return loginResult.data;
  }

  @override
  Future<UserSession?> getLastLoggedInUser() => _authLocalDTS.getLastSession();

  @override
  Future<void> logout() => _authLocalDTS.clearSession();
}

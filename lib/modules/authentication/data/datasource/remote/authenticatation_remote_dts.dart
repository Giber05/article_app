import 'package:article_app/modules/dashboard/domain/models/article.dart';
import 'package:injectable/injectable.dart';
import 'package:article_app/infrastructure/client/api_client.dart';
import 'package:article_app/modules/authentication/data/mapper/remote/request/login_request_mapper.dart';
import 'package:article_app/modules/authentication/data/mapper/remote/response/user_session_remote_mapper.dart';
import 'package:article_app/modules/authentication/domain/model/user_session.dart';

abstract class AuthenticationRemoteDTS {
  Future<APIResult<UserSession>> login(
      {required String email, required String password});

  Future<APIResult<int>> logout(
      {required String username, required String token});

}

@Injectable(as: AuthenticationRemoteDTS)
class AuthenticationRemoteDTSImpl implements AuthenticationRemoteDTS {
  final APIClient _client;

  AuthenticationRemoteDTSImpl(this._client);

  @override
  Future<APIResult<UserSession>> login(
      {required String email, required String password}) {
    return _client.post(
        path: '/auth/login',
        token: 'lsGPLl4k6Vc4J0VhnFaMBqetNtn1ofsB',
        shouldPrint: true,
        body: LoginRemoteReqMapper((password: password, email: email)).toJSON(),
        mapper: (json) => UserSessionRemoteResMapper().toModel(json));
  }

  @override
  Future<APIResult<int>> logout(
          {required String username, required String token}) =>
      _client.post(
        path: '/logout',
        token: token,
        body: {"username": username},
        mapper: (json) => json["data"]["logoutStatus"],
      );
}

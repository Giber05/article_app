import 'package:article_app/modules/authentication/domain/model/user_session.dart';

abstract class AuthenticationRepo {
  Future<UserSession> login({required String email, required String password});
  Future<UserSession?> getLastLoggedInUser();
  Future<void> logout();
}

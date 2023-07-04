import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:article_app/infrastructure/architecutre/use_case.dart';
import 'package:article_app/infrastructure/types/nothing.dart';
import 'package:article_app/infrastructure/types/resource.dart';
import 'package:article_app/modules/authentication/domain/repositories/authentication_repo.dart';

@injectable
class Logout extends UsecaseNoParams<Nothing> {
  final AuthenticationRepo _authRepo;

  Logout(this._authRepo);

  @override
  Future<Resource<Nothing>> execute() async {
    await _authRepo.logout();
    return Resource.success(const Nothing());
  }
}

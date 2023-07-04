// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../modules/authentication/data/datasource/local/authentication_local_dts.dart'
    as _i13;
import '../../modules/authentication/data/datasource/remote/authenticatation_remote_dts.dart'
    as _i7;
import '../../modules/authentication/data/repositories/authentication_repo_impl.dart'
    as _i15;
import '../../modules/authentication/domain/repositories/authentication_repo.dart'
    as _i14;
import '../../modules/authentication/domain/usecases/get_current_session.dart'
    as _i16;
import '../../modules/authentication/domain/usecases/login.dart' as _i17;
import '../../modules/authentication/domain/usecases/logout.dart' as _i19;
import '../../modules/authentication/presentation/screens/login/cubit/login_cubit.dart'
    as _i18;
import '../../modules/authentication/presentation/screens/splash/cubit/splash_cubit.dart'
    as _i21;
import '../../modules/dashboard/data/datasource/remote/article_remote_dts.dart'
    as _i4;
import '../../modules/dashboard/data/repository_impls/article_repo_impl.dart'
    as _i6;
import '../../modules/dashboard/domain/repositories/article_repo.dart' as _i5;
import '../../modules/dashboard/domain/usecases/get_articles.dart' as _i9;
import '../../modules/dashboard/presentation/screens/articles/cubit/article_cubit.dart'
    as _i12;
import '../architecutre/cubits/messenger/messenger_cubit.dart' as _i10;
import '../architecutre/cubits/session/session_cubit.dart' as _i20;
import '../client/api_client.dart' as _i3;
import '../local_storage/secure_storage/secure_storage.dart' as _i11;
import 'modules/core_module.dart' as _i22;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final coreModules = _$CoreModules();
    gh.lazySingleton<_i3.APIClient>(() => _i3.AppClient());
    gh.factory<_i4.ArticleRemoteDts>(
        () => _i4.ArticleRemoteDtsImpl(gh<_i3.APIClient>()));
    gh.factory<_i5.ArticleRepo>(
        () => _i6.ArticleRepoImpl(gh<_i4.ArticleRemoteDts>()));
    gh.factory<_i7.AuthenticationRemoteDTS>(
        () => _i7.AuthenticationRemoteDTSImpl(gh<_i3.APIClient>()));
    gh.factory<_i8.FlutterSecureStorage>(
        () => coreModules.getFlutterSecureStorage());
    gh.factory<_i9.GetArticles>(() => _i9.GetArticles(gh<_i5.ArticleRepo>()));
    gh.lazySingleton<_i10.MessengerCubit>(() => _i10.MessengerCubit());
    gh.factory<_i11.SecureStorage>(
        () => _i11.SecureStorageImpl(gh<_i8.FlutterSecureStorage>()));
    gh.factory<_i12.ArticleCubit>(() => _i12.ArticleCubit(
          gh<_i9.GetArticles>(),
          gh<_i10.MessengerCubit>(),
        ));
    gh.factory<_i13.AuthenticationLocalDTS>(
        () => _i13.AuthLocalDTSImpl(gh<_i11.SecureStorage>()));
    gh.factory<_i14.AuthenticationRepo>(() => _i15.AuthenticationRepoImpl(
          gh<_i7.AuthenticationRemoteDTS>(),
          gh<_i13.AuthenticationLocalDTS>(),
        ));
    gh.factory<_i16.GetCurrentSession>(
        () => _i16.GetCurrentSession(gh<_i14.AuthenticationRepo>()));
    gh.factory<_i17.Login>(() => _i17.Login(gh<_i14.AuthenticationRepo>()));
    gh.factory<_i18.LoginCubit>(() => _i18.LoginCubit(
          gh<_i17.Login>(),
          gh<_i10.MessengerCubit>(),
        ));
    gh.factory<_i19.Logout>(() => _i19.Logout(gh<_i14.AuthenticationRepo>()));
    gh.lazySingleton<_i20.SessionCubit>(
        () => _i20.SessionCubit(gh<_i19.Logout>()));
    gh.factory<_i21.SplashCubit>(
        () => _i21.SplashCubit(gh<_i16.GetCurrentSession>()));
    return this;
  }
}

class _$CoreModules extends _i22.CoreModules {}

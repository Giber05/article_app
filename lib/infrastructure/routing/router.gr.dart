// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:article_app/modules/authentication/presentation/screens/login/login_screen.dart'
    as _i1;
import 'package:article_app/modules/authentication/presentation/screens/splash/splash_screen.dart'
    as _i2;
import 'package:article_app/modules/dashboard/presentation/screens/articles/articles_dashboard_screen.dart'
    as _i3;
import 'package:auto_route/auto_route.dart' as _i4;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreen(),
      );
    },
    ArticlesDashboardRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ArticlesDashboardScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.LoginScreen]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute({List<_i4.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SplashScreen]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ArticlesDashboardScreen]
class ArticlesDashboardRoute extends _i4.PageRouteInfo<void> {
  const ArticlesDashboardRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ArticlesDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'ArticlesDashboardRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

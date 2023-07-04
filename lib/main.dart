import 'package:flutter/material.dart';
import 'package:article_app/app.dart';
import 'package:article_app/infrastructure/architecutre/error_handler/global_error_handler.dart';
import 'package:article_app/infrastructure/env/env.dart';
import 'package:article_app/infrastructure/routing/router.dart';
import 'package:article_app/infrastructure/service_locator/service_locator.dart';

void main() async {
  await configureDependencies();
  AppGlobalErrorHandler.setUpErrorHandler();
  ENV.setEnv(ENV.dev);
  runApp(App(
    appRouter: AppRouter(),
  ));
}

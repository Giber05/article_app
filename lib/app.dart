import 'package:article_app/infrastructure/ext/double_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:article_app/infrastructure/architecutre/cubits/messenger/messenger_cubit.dart';
import 'package:article_app/infrastructure/architecutre/cubits/session/session_cubit.dart';
import 'package:article_app/infrastructure/architecutre/error_handler/global_errror_catcher.dart';
import 'package:article_app/infrastructure/ext/ctx_ext.dart';
import 'package:article_app/infrastructure/routing/router.dart';
import 'package:article_app/infrastructure/service_locator/service_locator.dart';
import 'package:article_app/infrastructure/styles/color.dart';

class App extends StatelessWidget {
  final AppRouter appRouter;
  const App({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<MessengerCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<SessionCubit>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: appRouter.delegate(),
        builder: (context, child) {
          return GlobalErrorCatcher(
            child: AppMessengerListener(
              child: child,
            ),
            onSessionExpire: () {
              context.messenger.showErrorSnackbar("Session Expired");
              context.logout();
            },
          );
        },
        routeInformationParser: appRouter.defaultRouteParser(),
        theme: ThemeData(
          colorScheme: AppTheme.lightScheme,
        ),
      ),
    );
  }
}

class AppMessengerListener extends StatelessWidget {
  final Widget? child;
  const AppMessengerListener({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<MessengerCubit, MessengerState>(
      listener: (context, state) {
        if (state is MessengerIdle) return;
        if (state is MessengerSnackbar) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
              children: [
                if (state.icon != null)
                  Icon(
                    state.icon,
                    color: state.textColor(context),
                  ),
                if (state.icon != null) 8.horizontalSpace,
                Expanded(child: Text(state.message)),
              ],
            ),
            backgroundColor: state.backgroundColor(context),
          ));
        }
        context.read<MessengerCubit>().idle();
      },
      child: child,
    );
  }
}

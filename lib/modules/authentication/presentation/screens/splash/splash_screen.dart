import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:article_app/gen/assets.gen.dart';
import 'package:article_app/infrastructure/architecutre/cubits/session/session_cubit.dart';
import 'package:article_app/infrastructure/ext/ctx_ext.dart';
import 'package:article_app/infrastructure/routing/router.gr.dart';
import 'package:article_app/infrastructure/service_locator/service_locator.dart';
import 'package:article_app/modules/authentication/presentation/screens/splash/cubit/splash_cubit.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('Spash');
    return BlocProvider(
      create: (context) => getIt<SplashCubit>()..getLastSession(),
      child: Scaffold(
        body: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is SplashSuccess) {
              context.read<SessionCubit>().setCurrentUser(state.userSession);
              final route = state.userSession != null
                  ? const ArticlesDashboardRoute()
                  : const LoginRoute();
              context.router.replace(route);
            }
          },
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            height: double.infinity,
            child: const _AppIcon(),
          ),
        ),
      ),
    );
  }
}

class _AppIcon extends StatelessWidget {
  const _AppIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: Column(
        children: [
          Text(
            'My APPS',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: context.color.primary),
          ),
          Expanded(child: Image.asset(Assets.images.imageLogin.path)),
        ],
      ),
    );
  }
}

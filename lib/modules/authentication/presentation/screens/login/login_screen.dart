import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:article_app/gen/assets.gen.dart';
import 'package:article_app/infrastructure/architecutre/cubits/messenger/messenger_cubit.dart';
import 'package:article_app/infrastructure/architecutre/cubits/session/session_cubit.dart';
import 'package:article_app/infrastructure/ext/ctx_ext.dart';
import 'package:article_app/infrastructure/ext/double_ext.dart';
import 'package:article_app/infrastructure/routing/router.gr.dart';
import 'package:article_app/infrastructure/service_locator/service_locator.dart';
import 'package:article_app/infrastructure/widgets/buttons/elevated_button.dart';
import 'package:article_app/infrastructure/widgets/form/text_field.dart';
import 'package:article_app/infrastructure/widgets/loading/overlay.dart';
import 'package:article_app/modules/authentication/presentation/screens/login/cubit/login_cubit.dart';

part 'widgets/form.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: Scaffold(
        backgroundColor: context.color.background,
        body: Center(
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) async {
              if (state is LoginSuccess) {
                context.read<SessionCubit>().setCurrentUser(state.session);
                context.router.replace(const ArticlesDashboardRoute());
              }
            },
            child: Stack(
              children: [
                Positioned(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          'My APPS',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: context.color.primary),
                        ),
                      ],
                    ),
                ),
                ),
                ListView(
                  children: [
                    Image.asset(Assets.images.imageLogin.path),
                    const _LoginForm(),
                  ],
                ),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginError) {
                      context.messenger.showErrorSnackbar(state.message);
                    }
                  },
                  builder: (context, state) {
                    if (state is! LoginLoading) {
                      return const SizedBox();
                    }
                    return const AppLoadingOverlay();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

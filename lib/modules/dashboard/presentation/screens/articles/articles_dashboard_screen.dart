// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:article_app/infrastructure/ext/date_ext.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:article_app/infrastructure/ext/ctx_ext.dart';
import 'package:article_app/infrastructure/ext/double_ext.dart';
import 'package:article_app/infrastructure/service_locator/service_locator.dart';
import 'package:article_app/modules/authentication/presentation/widgets/logged_in_wrapper.dart';
import 'package:article_app/modules/dashboard/domain/models/article.dart';
import 'package:article_app/modules/dashboard/presentation/screens/articles/cubit/article_cubit.dart';
import 'package:shimmer/shimmer.dart';

part 'widgets/article_dashboard_shimmer.dart';

@RoutePage()
class ArticlesDashboardScreen extends StatelessWidget {
  const ArticlesDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthenticatedWrapper(
        child: BlocProvider(
      create: (context) => getIt<ArticleCubit>()..getArticles(),
      child: const _ArticleDashboardContent(),
    ));
  }
}

class _ArticleDashboardContent extends StatelessWidget {
  const _ArticleDashboardContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<ArticleCubit>().getArticles();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<ArticleCubit, ArticleState>(
              builder: (context, state) {
                if (state is ArticleLoading) {
                  return const _ArticleDashboardShimmer();
                }
                if (state is ArticleLoaded) {
                  return Stack(
                    children: [
                      Positioned(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              context.logout();
                            },
                            child: Icon(
                              Icons.logout,
                              color: context.color.primary,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Welcome, ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                              children: [
                                TextSpan(
                                  text: context.userSession.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          HorizontalListArticles(
                            articles: state.articles,
                          ),
                          20.verticalSpace,
                          Expanded(
                            child: _VerticalListArticles(
                              articles: state.articles,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _VerticalListArticles extends StatelessWidget {
  const _VerticalListArticles({
    Key? key,
    required this.articles,
  }) : super(key: key);
  final List<Article> articles;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final article = articles[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: context.color.primary.withOpacity(.15),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      article.image ??
                          'https://theperfectroundgolf.com/wp-content/uploads/2022/04/placeholder.png',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, _, __) {
                        return const Icon(Icons.error);
                      },
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: Text(
                      article.title,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              Text(
                article.content,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.w400,
                ),
              ),
              14.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    article.created.date == null
                        ? '-'
                        : '${article.created.date!.dateStringForm()}, ${article.created.date!.hourStringForm()}',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

class HorizontalListArticles extends StatelessWidget {
  const HorizontalListArticles({
    Key? key,
    required this.articles,
  }) : super(key: key);
  final List<Article> articles;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
          final article = articles[index];
          return Container(
            width: 210,
            margin: const EdgeInsets.only(right: 21),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Theme.of(context).colorScheme.primary),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Text(
                    maxLines: 8,
                    article.content,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

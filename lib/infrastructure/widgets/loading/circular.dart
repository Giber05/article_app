import 'package:flutter/cupertino.dart';
import 'package:article_app/infrastructure/ext/ctx_ext.dart';

class AppCircularLoading extends StatelessWidget {
  final Color? color;
  final double? radius;
  const AppCircularLoading({super.key, this.color, this.radius});

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      radius: radius ?? 20,
      color: color ?? context.color.primary,
    );
  }
}

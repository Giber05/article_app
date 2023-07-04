import 'package:flutter/material.dart';

class HideWidget extends StatelessWidget {
  final Widget child;
  const HideWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Visibility(
        maintainAnimation: true,
        maintainSize: true,
        visible: false,
        maintainState: true,
        child: child);
  }
}

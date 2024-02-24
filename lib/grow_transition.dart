import 'package:flutter/material.dart';

class GrowTransition extends StatelessWidget {
  const GrowTransition({required this.child, required this.animation, super.key});
  final Widget child;
  final Animation<double> animation;

  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Opacity(
            opacity: _opacityTween.evaluate(animation),
            child: SizedBox(
              height: _sizeTween.evaluate(animation),
              width: _sizeTween.evaluate(animation),
              child: child,
            ),
          );
        },
        child: child,
      ),
    );
  }
}
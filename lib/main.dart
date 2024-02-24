import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:hw_animation/grow_transition.dart';
import 'package:hw_animation/logo_widget.dart';
import 'package:hw_animation/space_shooter_game.dart';

void main() => runApp(
    GameWidget(
        game: SpaceShooterGame()
    )
);
class LogoApp extends StatefulWidget {
  const LogoApp({super.key});
  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(seconds: 2),
        vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(
      animation: animation,
      child: const LogoWidget(),
    );
  }
}
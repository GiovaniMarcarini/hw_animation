import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:hw_animation/splash/grow_transition.dart';
import 'package:hw_animation/splash/logo_widget.dart';
import 'package:hw_animation/game/space_shooter_game.dart';

void main() => runApp(
    const Home()
);

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/animations',
      routes: {
        '/animations' : (context) => LogoApp(),
        '/game': (context) => GameWidget(
            game: SpaceShooterGame()
        )
      }
    );
  }
}

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
        duration: const Duration(seconds: 3),
        vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.pushNamed(context, '/game');
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
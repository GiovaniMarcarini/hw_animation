import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:hw_animation/game/player.dart';

class SpaceShooterGame extends FlameGame with PanDetector{
  late Player player;

  final _imageNames = [
    ParallaxImageData("bg.png"),
    ParallaxImageData("mountain-far.png"),
    ParallaxImageData("mountains.png"),
    ParallaxImageData("trees.png"),
    ParallaxImageData("foreground-trees.png"),
  ];

  @override
  Future<void> onLoad() async{
    await super.onLoad();

    final paralaz = await loadParallaxComponent(
      _imageNames,
      baseVelocity: Vector2(20, 0),
      velocityMultiplierDelta: Vector2(1.8, 1.0),
      filterQuality: FilterQuality.none,
    );

    player = Player();
    player.angle = 1.55;
    add(paralaz);
    add(player);

  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.move(info.delta.global);
  }
}
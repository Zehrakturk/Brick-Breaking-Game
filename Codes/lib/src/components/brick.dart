import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';

import '../brick_breaker.dart';
import '../config.dart';
import 'ball.dart';
import 'bat.dart';


class Brick extends RectangleComponent
    with CollisionCallbacks, HasGameReference<BrickBreaker> {

    late final Color brickColor;

    Brick(Vector2 position, Color color)
      : super(
          position: position,
          size: Vector2(brickWidth, brickHeight),
          anchor: Anchor.center,
          paint: Paint()
            ..color = color
            ..style = PaintingStyle.fill,
          children: [RectangleHitbox()],
        );
        
    
  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if(other is Ball){
      if(other.paint.color == super.paint.color){
          removeFromParent();
          game.score.value++; 
      }
          
    }

    if (game.world.children.query<Brick>().length == 1) {
      game.playState = PlayState.won;
      game.world.removeAll(game.world.children.query<Ball>());
      game.world.removeAll(game.world.children.query<Bat>());
    }
  }
}
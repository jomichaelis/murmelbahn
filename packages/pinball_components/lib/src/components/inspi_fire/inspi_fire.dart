// ignore_for_file: avoid_renaming_method_parameters

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:pinball_components/pinball_components.dart';
import 'package:pinball_components/src/components/inspi_fire/behaviors/behaviors.dart';
import 'package:pinball_flame/pinball_flame.dart';

export 'cubit/inspi_fire_cubit.dart';

/// {@template inspi_fire}
/// A fire owned by Inspi.
/// {@endtemplate}
class InspiFire extends BodyComponent {
  /// {@macro inspi_fire}
  InspiFire({Iterable<Component>? children})
      : bloc = InspiFireCubit(),
        super(
          renderBody: false,
          children: [
            InspiFireSensorBallContactBehavior()
              ..applyTo(['turbo_charge_sensor']),
            _ComputerBaseSpriteComponent(),
            _ComputerTopSpriteComponent(),
            _ComputerGlowSpriteComponent(),
            ...?children,
          ],
        );

  /// Creates a [InspiFire] without any children.
  ///
  /// This can be used for testing [InspiFire]'s behaviors in isolation.
  @visibleForTesting
  InspiFire.test({
    required this.bloc,
    Iterable<Component>? children,
  }) : super(children: children);

  final InspiFireCubit bloc;

  @override
  void onRemove() {
    bloc.close();
    super.onRemove();
  }

  List<FixtureDef> _createFixtureDefs() {
    final leftEdge = EdgeShape()
      ..set(
        Vector2(-15.3, -45.9),
        Vector2(-15.7, -49.5),
      );
    final topEdge = EdgeShape()
      ..set(
        leftEdge.vertex2,
        Vector2(-11.1, -50.5),
      );
    final rightEdge = EdgeShape()
      ..set(
        topEdge.vertex2,
        Vector2(-9.4, -47.1),
      );
    final turboChargeSensor = PolygonShape()
      ..setAsBox(
        1,
        0.1,
        Vector2(-13.1, -49.7),
        -0.18,
      );

    return [
      FixtureDef(leftEdge),
      FixtureDef(topEdge),
      FixtureDef(rightEdge),
      FixtureDef(
        turboChargeSensor,
        isSensor: true,
        userData: 'turbo_charge_sensor',
      ),
    ];
  }

  @override
  Body createBody() {
    final body = world.createBody(BodyDef());
    _createFixtureDefs().forEach(body.createFixture);

    return body;
  }
}

class _ComputerBaseSpriteComponent extends SpriteComponent
    with HasGameRef, ZIndex {
  _ComputerBaseSpriteComponent()
      : super(
          anchor: Anchor.center,
          position: Vector2(-12.44, -48.15),
        ) {
    zIndex = ZIndexes.computerBase;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final sprite = Sprite(
      gameRef.images.fromCache(
        Assets.images.inspi.fire.base.keyName,
      ),
    );
    this.sprite = sprite;
    size = sprite.originalSize / 10;
  }
}

class _ComputerTopSpriteComponent extends SpriteComponent
    with HasGameRef, ZIndex {
  _ComputerTopSpriteComponent()
      : super(
          anchor: Anchor.center,
          position: Vector2(-12.86, -49.37),
        ) {
    zIndex = ZIndexes.computerTop;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final sprite = Sprite(
      gameRef.images.fromCache(
        Assets.images.inspi.fire.top.keyName,
      ),
    );
    this.sprite = sprite;
    size = sprite.originalSize / 10;
  }
}

class _ComputerGlowSpriteComponent extends SpriteComponent
    with HasGameRef, ZIndex {
  _ComputerGlowSpriteComponent()
      : super(
          anchor: Anchor.center,
          position: Vector2(4, 11),
        ) {
    zIndex = ZIndexes.computerGlow;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final sprite = Sprite(
      gameRef.images.fromCache(
        Assets.images.inspi.fire.glow.keyName,
      ),
    );
    this.sprite = sprite;
    size = sprite.originalSize / 10;
  }
}

import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:pinball_components/pinball_components.dart';
import 'package:pinball_components/src/components/jurte/behaviors/behaviors.dart';
import 'package:pinball_components/src/components/bumping_behavior.dart';
import 'package:pinball_flame/pinball_flame.dart' as pf;

export 'cubit/jurte_bumper_cubit.dart';

/// {@template jurte_bumper}
/// Bumper for [JurteArea].
/// {@endtemplate}
class JurteBumper extends BodyComponent with InitialPosition, pf.ZIndex {
  /// {@macro jurtebumper}
  JurteBumper._({
    required double majorRadius,
    required double minorRadius,
    required String litAssetPath,
    required String dimmedAssetPath,
    required Vector2 spritePosition,
    Iterable<Component>? children,
    required this.bloc,
  })  : _majorRadius = majorRadius,
        _minorRadius = minorRadius,
        super(
        renderBody: false,
        children: [
          JurteBumperBallContactBehavior(),
          JurteBumperBlinkingBehavior(),
          _JurteBumperSpriteGroupComponent(
            dimmedAssetPath: dimmedAssetPath,
            litAssetPath: litAssetPath,
            position: spritePosition,
            state: bloc.state,
          ),
          ...?children,
        ],
      ) {
    zIndex = ZIndexes.jurteArea;
  }

  /// {@macro jurtebumper}
  JurteBumper.main({
    Iterable<Component>? children,
  }) : this._(
    majorRadius: 7.3,
    minorRadius: 5.7,
    litAssetPath: Assets.images.jurteArea.bumper.main.lit.keyName,
    dimmedAssetPath: Assets.images.jurteArea.bumper.main.dimmed.keyName,
    spritePosition: Vector2(0, -0.3),
    bloc: JurteBumperCubit(),
    children: [
      ...?children,
      BumpingBehavior(strength: 20),
    ],
  );

  /// Creates a JurteBumper without any children.
  ///
  /// This can be used for testing [JurteBumper]'s behaviors in isolation.
  @visibleForTesting
  JurteBumper.test({
    required this.bloc,
  })  : _majorRadius = 3.52,
        _minorRadius = 3.2;

  final double _majorRadius;

  final double _minorRadius;

  final JurteBumperCubit bloc;

  @override
  void onRemove() {
    bloc.close();
    super.onRemove();
  }

  @override
  Body createBody() {
    final shape = pf.EllipseShape(
      center: Vector2.zero(),
      majorRadius: _majorRadius,
      minorRadius: _minorRadius,
    )..rotate(1.57);
    final bodyDef = BodyDef(
      position: initialPosition,
    );

    return world.createBody(bodyDef)..createFixtureFromShape(shape);
  }
}

class _JurteBumperSpriteGroupComponent
    extends SpriteGroupComponent<JurteBumperState>
    with HasGameRef, ParentIsA<JurteBumper> {
  _JurteBumperSpriteGroupComponent({
    required String litAssetPath,
    required String dimmedAssetPath,
    required Vector2 position,
    required JurteBumperState state,
  })  : _litAssetPath = litAssetPath,
        _dimmedAssetPath = dimmedAssetPath,
        super(
        anchor: Anchor.center,
        position: position,
        current: state,
      );

  final String _litAssetPath;
  final String _dimmedAssetPath;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    parent.bloc.stream.listen((state) => current = state);

    final sprites = {
      JurteBumperState.lit: Sprite(
        gameRef.images.fromCache(_litAssetPath),
      ),
      JurteBumperState.dimmed:
      Sprite(gameRef.images.fromCache(_dimmedAssetPath)),
    };
    this.sprites = sprites;
    size = sprites[current]!.originalSize / 13.0;
  }
}

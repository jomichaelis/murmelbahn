import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:pinball_components/pinball_components.dart';
import 'package:pinball_components/src/components/bumping_behavior.dart';
import 'package:pinball_components/src/components/inspi_bumper/behaviors/behaviors.dart';
import 'package:pinball_flame/pinball_flame.dart' as pf;

export 'cubit/inspi_bumper_cubit.dart';

/// {@template inspi_bumper}
/// Bumper for the Sparky Scorch.
/// {@endtemplate}
class InspiBumper extends BodyComponent with InitialPosition, pf.ZIndex {
  /// {@macro inspi_bumper}
  InspiBumper._({
    required double majorRadius,
    required double minorRadius,
    required double rotation,
    required String litAssetPath,
    required String dimmedAssetPath,
    required Vector2 spritePosition,
    required this.bloc,
    Iterable<Component>? children,
  })  : _majorRadius = majorRadius,
        _minorRadius = minorRadius,
        _rotation = rotation,
        super(
          renderBody: false,
          children: [
            InspiBumperBallContactBehavior(),
            InspiBumperBlinkingBehavior(),
            _InspiBumperSpriteGroupComponent(
              litAssetPath: litAssetPath,
              dimmedAssetPath: dimmedAssetPath,
              position: spritePosition,
              state: bloc.state,
            ),
            ...?children,
          ],
        ) {
    zIndex = ZIndexes.inspiBumper;
  }

  /// {@macro inspi_bumper}
  InspiBumper.a({
    Iterable<Component>? children,
  }) : this._(
          majorRadius: 3.6,
          minorRadius: 2.2,
          rotation: math.pi / 2.1,
          litAssetPath: Assets.images.inspi.bumper.a.lit.keyName,
          dimmedAssetPath: Assets.images.inspi.bumper.a.dimmed.keyName,
          spritePosition: Vector2(0, -0.65),
          bloc: InspiBumperCubit(),
          children: [
            ...?children,
            BumpingBehavior(strength: 20),
          ],
        );

  /// {@macro inspi_bumper}
  InspiBumper.b({
    Iterable<Component>? children,
  }) : this._(
          majorRadius: 3.8,
          minorRadius: 2.4,
          rotation: math.pi / 2,
          litAssetPath: Assets.images.inspi.bumper.b.lit.keyName,
          dimmedAssetPath: Assets.images.inspi.bumper.b.dimmed.keyName,
          spritePosition: Vector2(0.1, -0.9),
          bloc: InspiBumperCubit(),
          children: [
            ...?children,
            BumpingBehavior(strength: 20),
          ],
        );

  /// {@macro inspi_bumper}
  InspiBumper.c({
    Iterable<Component>? children,
  }) : this._(
          majorRadius: 3.6,
          minorRadius: 2.2,
          rotation: math.pi / 1.9,
          litAssetPath: Assets.images.inspi.bumper.c.lit.keyName,
          dimmedAssetPath: Assets.images.inspi.bumper.c.dimmed.keyName,
          spritePosition: Vector2(0.1, -0.9),
          bloc: InspiBumperCubit(),
          children: [
            ...?children,
            BumpingBehavior(strength: 20),
          ],
        );

  /// Creates an [InspiBumper] without any children.
  ///
  /// This can be used for testing [InspiBumper]'s behaviors in isolation.
  @visibleForTesting
  InspiBumper.test({
    required this.bloc,
  })  : _majorRadius = 3,
        _minorRadius = 2.2,
        _rotation = math.pi / 2.1;

  final double _majorRadius;
  final double _minorRadius;
  final double _rotation;

  final InspiBumperCubit bloc;

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
    )..rotate(_rotation);
    final bodyDef = BodyDef(
      position: initialPosition,
    );

    return world.createBody(bodyDef)..createFixtureFromShape(shape);
  }
}

class _InspiBumperSpriteGroupComponent
    extends SpriteGroupComponent<InspiBumperState>
    with HasGameRef, ParentIsA<InspiBumper> {
  _InspiBumperSpriteGroupComponent({
    required String litAssetPath,
    required String dimmedAssetPath,
    required Vector2 position,
    required InspiBumperState state,
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
      InspiBumperState.lit: Sprite(
        gameRef.images.fromCache(_litAssetPath),
      ),
      InspiBumperState.dimmed: Sprite(
        gameRef.images.fromCache(_dimmedAssetPath),
      ),
    };
    this.sprites = sprites;
    size = sprites[current]!.originalSize / 9;
  }
}

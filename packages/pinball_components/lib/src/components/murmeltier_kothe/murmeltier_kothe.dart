import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:pinball_components/pinball_components.dart';
import 'package:pinball_components/src/components/bumping_behavior.dart';
import 'package:pinball_components/src/components/murmeltier_kothe/behaviors/behaviors.dart';
import 'package:pinball_flame/pinball_flame.dart';

export 'cubit/murmeltier_kothen_cubit.dart';

enum MurmeltierKotheSpriteState {
  active,
  inactive,
}

enum MurmeltierKotheId {
  main,
  a,
  b,
}

/// {@template murmeltier_kothe}
/// Bumper Kothe for the Murmeltier Camp.
/// {@endtemplate}
class MurmeltierKothe extends BodyComponent with InitialPosition {
  /// {@macro dash_bumper}
  MurmeltierKothe._({
    required this.id,
    required double majorRadius,
    required double minorRadius,
    required double rotation,
    required String activeAssetPath,
    required String inactiveAssetPath,
    required Vector2 spritePosition,
    Iterable<Component>? children,
  })  : _majorRadius = majorRadius,
        _minorRadius = minorRadius,
        _rotation = rotation,
        super(
          renderBody: false,
          children: [
            MurmeltierKotheSpriteGroupComponent(
              id: id,
              activeAssetPath: activeAssetPath,
              inactiveAssetPath: inactiveAssetPath,
              position: spritePosition,
            ),
            MurmeltierKotheBallContactBehavior(),
            ...?children,
          ],
        );

  /// {@macro murmeltier_kothe}
  ///
  /// [MurmeltierKothe.main], usually positioned with a [MurmeltierAnimatronic] on top of
  /// it.
  MurmeltierKothe.main({
    Iterable<Component>? children,
  }) : this._(
          id: MurmeltierKotheId.main,
          majorRadius: 4.9,
          minorRadius: 3.18,
          rotation: 1.6,
          activeAssetPath: Assets.images.murmeltier.kothe.main.active.keyName,
          inactiveAssetPath: Assets.images.murmeltier.kothe.main.inactive.keyName,
          spritePosition: Vector2(0, -0.3),
          children: [
            ...?children,
            BumpingBehavior(strength: 20),
          ],
        );

  /// {@macro murmeltier_kothe}
  ///
  /// [MurmeltierKothe.a] is positioned at the right side of the [MurmeltierKothe.main] in
  /// the Murmeltier Camp.
  MurmeltierKothe.a({
    Iterable<Component>? children,
  }) : this._(
          id: MurmeltierKotheId.a,
          majorRadius: 3.4,
          minorRadius: 2.1,
          rotation: 1.44,
          activeAssetPath: Assets.images.murmeltier.kothe.a.active.keyName,
          inactiveAssetPath: Assets.images.murmeltier.kothe.a.inactive.keyName,
          spritePosition: Vector2(0, -1.1),
          children: [
            ...?children,
            BumpingBehavior(strength: 20),
          ],
        );

  /// {@macro murmeltier_kothe}
  ///
  /// [MurmeltierKothe.b] is positioned at the left side of the [MurmeltierKothe.main] in
  /// the murmeltier camp.
  MurmeltierKothe.b({
    Iterable<Component>? children,
  }) : this._(
          id: MurmeltierKotheId.b,
          majorRadius: 3.5,
          minorRadius: 2.1,
          rotation: 1.6,
          activeAssetPath: Assets.images.murmeltier.kothe.b.active.keyName,
          inactiveAssetPath: Assets.images.murmeltier.kothe.b.inactive.keyName,
          spritePosition: Vector2(0.1, -1.1),
          children: [
            ...?children,
            BumpingBehavior(strength: 20),
          ],
        );

  /// Creates a [DashBumper] without any children.
  ///
  /// This can be used for testing [MurmeltierKothe]'s behaviors in isolation.
  @visibleForTesting
  MurmeltierKothe.test({required this.id})
      : _majorRadius = 3,
        _minorRadius = 2.5,
        _rotation = 1.6;

  final MurmeltierKotheId id;
  final double _majorRadius;
  final double _minorRadius;
  final double _rotation;

  @override
  Body createBody() {
    final shape = EllipseShape(
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

@visibleForTesting
class MurmeltierKotheSpriteGroupComponent
    extends SpriteGroupComponent<MurmeltierKotheSpriteState>
    with HasGameRef, FlameBlocListenable<MurmeltierKothenCubit, MurmeltierKothenState> {
  MurmeltierKotheSpriteGroupComponent({
    required MurmeltierKotheId id,
    required String activeAssetPath,
    required String inactiveAssetPath,
    required Vector2 position,
  })  : _id = id,
        _activeAssetPath = activeAssetPath,
        _inactiveAssetPath = inactiveAssetPath,
        super(
          anchor: Anchor.center,
          position: position,
        );

  final MurmeltierKotheId _id;
  final String _activeAssetPath;
  final String _inactiveAssetPath;

  @override
  bool listenWhen(MurmeltierKothenState previousState, MurmeltierKothenState newState) {
    return previousState.kotheSpriteStates[_id] !=
        newState.kotheSpriteStates[_id];
  }

  @override
  void onNewState(MurmeltierKothenState state) =>
      current = state.kotheSpriteStates[_id];

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final sprites = {
      MurmeltierKotheSpriteState.active:
          Sprite(gameRef.images.fromCache(_activeAssetPath)),
      MurmeltierKotheSpriteState.inactive:
          Sprite(gameRef.images.fromCache(_inactiveAssetPath)),
    };
    this.sprites = sprites;
    current = MurmeltierKotheSpriteState.inactive;
    size = sprites[current]!.originalSize / 10;
  }
}

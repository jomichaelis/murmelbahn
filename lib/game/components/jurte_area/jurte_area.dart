import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:murmelbahn/game/behaviors/behaviors.dart';
import 'package:murmelbahn/game/game.dart';
import 'package:pinball_components/pinball_components.dart';

/// {@template jurte_area}
/// Area located next to the [Launcher] containing the [Jurte],
/// [JurteWalls], and the [Slingshots].
/// {@endtemplate}
class JurteArea extends Component {
  /// {@macro jurte_area}
  JurteArea()
      : super(
          children: [
            JurteBumper.main(
              children: [
                ScoringContactBehavior(points: Points.twoHundredThousand),
              ],
            )..initialPosition = Vector2(24.2, -13.4),
            DinoWalls(),
            Slingshots(),
          ]
  );

  /// Creates [JurteArea] without any children.
  ///
  /// This can be used for testing [JurteArea]'s behaviors in isolation.
  @visibleForTesting
  JurteArea.test();
}
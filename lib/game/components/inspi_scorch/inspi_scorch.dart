// ignore_for_file: avoid_renaming_method_parameters

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:murmelbahn/game/behaviors/behaviors.dart';
import 'package:murmelbahn/game/components/inspi_scorch/behaviors/behaviors.dart';
import 'package:pinball_components/pinball_components.dart';

/// {@template sparky_scorch}
/// Area positioned at the top left of the board containing the
/// [InspiFire], [InspiAnimatronic], and [InspiBumper]s.
/// {@endtemplate}
class InspiScorch extends Component {
  /// {@macro sparky_scorch}
  InspiScorch()
      : super(
          children: [
            InspiBumper.a(
              children: [
                ScoringContactBehavior(points: Points.twentyThousand),
                BumperNoiseBehavior(),
              ],
            )..initialPosition = Vector2(-22.9, -41.65),
            InspiBumper.b(
              children: [
                ScoringContactBehavior(points: Points.twentyThousand),
                BumperNoiseBehavior(),
              ],
            )..initialPosition = Vector2(-21.25, -57.9),
            InspiBumper.c(
              children: [
                ScoringContactBehavior(points: Points.twentyThousand),
                BumperNoiseBehavior(),
              ],
            )..initialPosition = Vector2(-3.3, -52.55),
            InspiAnimatronic(
              children: [
                AnimatronicLoopingBehavior(animationCoolDown: 8),
              ],
            )..position = Vector2(-14, -58.2),
            InspiFire(
              children: [
                ScoringContactBehavior(points: Points.twoHundredThousand)
                  ..applyTo(['turbo_charge_sensor']),
              ],
            ),
            InspiFireBonusBehavior(),
          ],
        );

  /// Creates [SparkyScorch] without any children.
  ///
  /// This can be used for testing [SparkyScorch]'s behaviors in isolation.
  @visibleForTesting
  InspiScorch.test();
}

// ignore_for_file: avoid_renaming_method_parameters

import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flutter/material.dart';
import 'package:murmelbahn/game/behaviors/behaviors.dart';
import 'package:murmelbahn/game/components/murmeltier_camp/behaviors/behaviors.dart';
import 'package:pinball_components/pinball_components.dart';
import 'package:pinball_flame/pinball_flame.dart';

/// {@template murmeltier_camp}
/// Area positioned at the top right of the board where the [Ball] can bounce
/// off [MurmeltierKothe]s.
/// {@endtemplate}
class MurmeltierCamp extends Component with ZIndex {
  /// {@macro murmeltier_camp}
  MurmeltierCamp()
      : super(
          children: [
            FlameMultiBlocProvider(
              providers: [
                FlameBlocProvider<SignpostCubit, SignpostState>(
                  create: SignpostCubit.new,
                ),
                FlameBlocProvider<MurmeltierKothenCubit, MurmeltierKothenState>(
                  create: MurmeltierKothenCubit.new,
                ),
              ],
              children: [
                Signpost(
                  children: [
                    ScoringContactBehavior(points: Points.fiveThousand),
                    BumperNoiseBehavior(),
                  ],
                )..initialPosition = Vector2(7.95, -58.35),
                MurmeltierKothe.main(
                  children: [
                    ScoringContactBehavior(points: Points.twoHundredThousand),
                    BumperNoiseBehavior(),
                  ],
                )..initialPosition = Vector2(18.55, -59.35),
                MurmeltierKothe.a(
                  children: [
                    ScoringContactBehavior(points: Points.twentyThousand),
                    BumperNoiseBehavior(),
                  ],
                )..initialPosition = Vector2(8.95, -51.95),
                MurmeltierKothe.b(
                  children: [
                    ScoringContactBehavior(points: Points.twentyThousand),
                    BumperNoiseBehavior(),
                  ],
                )..initialPosition = Vector2(20.8, -46.75),
                MurmeltierAnimatronic(
                  children: [
                    AnimatronicLoopingBehavior(animationCoolDown: 7),
                  ],
                )..position = Vector2(18.6, -65),
                MurmeltierCampBonusBehavior(),
              ],
            ),
          ],
        ) {
    zIndex = ZIndexes.flutterForest;
  }

  /// Creates a [MurmeltierCamp] without any children.
  ///
  /// This can be used for testing [MurmeltierCamp]'s behaviors in isolation.
  @visibleForTesting
  MurmeltierCamp.test();
}

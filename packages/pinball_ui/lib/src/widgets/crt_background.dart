import 'package:flutter/material.dart';
import 'package:pinball_ui/pinball_ui.dart';

/// {@template crt_background}
/// [BoxDecoration] that provides a CRT-like background effect.
/// {@endtemplate}
class CrtBackground extends BoxDecoration {
  /// {@macro crt_background}
  const CrtBackground()
      : super(
          gradient: const LinearGradient(
            begin: Alignment(1, 2),
            stops: [0.0, 1],
            colors: [
              PinballColors.darkBlue,
              PinballColors.orange,
            ]
          ),
        );
}

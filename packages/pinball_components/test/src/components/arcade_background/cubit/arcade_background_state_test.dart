// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:pinball_components/pinball_components.dart';
import 'package:pinball_theme/pinball_theme.dart';

void main() {
  group('ArcadeBackgroundState', () {
    test('supports value equality', () {
      expect(
        ArcadeBackgroundState(characterTheme: ScoutTheme()),
        equals(ArcadeBackgroundState(characterTheme: ScoutTheme())),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          ArcadeBackgroundState(characterTheme: ScoutTheme()),
          isNotNull,
        );
      });

      test('initial contains DashTheme', () {
        expect(
          ArcadeBackgroundState.initial().characterTheme,
          ScoutTheme(),
        );
      });
    });
  });
}

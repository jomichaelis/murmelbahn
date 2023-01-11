// ignore_for_file: cascade_invocations

import 'package:flame/components.dart';
import 'package:flame_test/flame_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pinball_components/pinball_components.dart';

import '../../helpers/helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final asset = Assets.images.murmeltier.animatronic.keyName;
  final flameTester = FlameTester(() => TestGame([asset]));

  group('DashAnimatronic', () {
    flameTester.testGameWidget(
      'renders correctly',
      setUp: (game, tester) async {
        await game.images.load(asset);
        await game.ensureAdd(MurmeltierAnimatronic()..playing = true);
        game.camera.followVector2(Vector2.zero());
        await tester.pump();
      },
      verify: (game, tester) async {
        final animationDuration =
            game.firstChild<MurmeltierAnimatronic>()!.animation!.totalDuration();

        await expectLater(
          find.byGame<TestGame>(),
          matchesGoldenFile('golden/dash_animatronic/start.png'),
        );

        game.update(animationDuration * 0.25);
        await tester.pump();
        await expectLater(
          find.byGame<TestGame>(),
          matchesGoldenFile('golden/dash_animatronic/middle.png'),
        );

        game.update(animationDuration * 0.75);
        await tester.pump();
        await expectLater(
          find.byGame<TestGame>(),
          matchesGoldenFile('golden/dash_animatronic/end.png'),
        );
      },
    );

    flameTester.test(
      'loads correctly',
      (game) async {
        final murmeltierAnimatronic = MurmeltierAnimatronic();
        await game.ensureAdd(murmeltierAnimatronic);

        expect(game.contains(murmeltierAnimatronic), isTrue);
      },
    );

    flameTester.test('adds new children', (game) async {
      final component = Component();
      final murmeltierAnimatronic = MurmeltierAnimatronic(
        children: [component],
      );
      await game.ensureAdd(murmeltierAnimatronic);
      expect(murmeltierAnimatronic.children, contains(component));
    });
  });
}

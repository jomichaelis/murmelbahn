import 'dart:async';

import 'package:flame/extensions.dart';
import 'package:pinball_components/pinball_components.dart';
import 'package:sandbox/stories/ball/basic_ball_game.dart';

class InspiBumperGame extends BallGame {
  static const description = '''
    Shows how a InspiBumper is rendered.

    - Activate the "trace" parameter to overlay the body.
    - Tap anywhere on the screen to spawn a ball into the game.
''';

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    await images.loadAll([
      Assets.images.inspi.bumper.a.lit.keyName,
      Assets.images.inspi.bumper.a.dimmed.keyName,
      Assets.images.inspi.bumper.b.lit.keyName,
      Assets.images.inspi.bumper.b.dimmed.keyName,
      Assets.images.inspi.bumper.c.lit.keyName,
      Assets.images.inspi.bumper.c.dimmed.keyName,
    ]);

    final center = screenToWorld(camera.viewport.canvasSize! / 2);
    final inspiBumperA = InspiBumper.a()
      ..initialPosition = Vector2(center.x - 20, center.y + 20)
      ..priority = 1;
    final inspiBumperB = InspiBumper.b()
      ..initialPosition = Vector2(center.x - 10, center.y - 10)
      ..priority = 1;
    final inspiBumperC = InspiBumper.c()
      ..initialPosition = Vector2(center.x + 20, center.y)
      ..priority = 1;
    await addAll([
      inspiBumperA,
      inspiBumperB,
      inspiBumperC,
    ]);

    await traceAllBodies();
  }
}

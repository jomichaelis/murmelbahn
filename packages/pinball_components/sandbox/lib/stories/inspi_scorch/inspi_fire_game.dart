import 'dart:async';

import 'package:flame/input.dart';
import 'package:pinball_components/pinball_components.dart';
import 'package:sandbox/stories/ball/basic_ball_game.dart';

class InspiFireGame extends BallGame {
  static const description = '''
    Shows how the InspiFire is rendered.

    - Activate the "trace" parameter to overlay the body.
    - Tap anywhere on the screen to spawn a ball into the game.
''';

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    await images.loadAll([
      Assets.images.inspi.fire.base.keyName,
      Assets.images.inspi.fire.top.keyName,
      Assets.images.inspi.fire.glow.keyName,
    ]);

    camera.followVector2(Vector2(-10, -40));
    await add(InspiFire());
    await ready();
    await traceAllBodies();
  }
}

import 'package:flame/input.dart';
import 'package:pinball_components/pinball_components.dart';
import 'package:pinball_flame/pinball_flame.dart';
import 'package:pinball_theme/pinball_theme.dart' as theme;
import 'package:sandbox/common/common.dart';

class BallGame extends AssetsGame with TapDetector, Traceable {
  BallGame({
    this.ballPriority = 0,
    this.ballLayer = Layer.all,
    this.character,
    List<String>? imagesFileNames,
  }) : super(
          imagesFileNames: [
            theme.Assets.images.scout.ball.keyName,
            if (imagesFileNames != null) ...imagesFileNames,
          ],
        );

  static const description = '''
    Shows how a Ball works.
      
    - Tap anywhere on the screen to spawn a ball into the game.
''';

  static final characterBallPaths = <String, String>{
    'Scout': theme.Assets.images.scout.ball.keyName,
  };

  final int ballPriority;
  final Layer ballLayer;
  final String? character;

  @override
  void onTapUp(TapUpInfo info) {
    add(
      Ball(
        assetPath: characterBallPaths[character],
      )
        ..initialPosition = info.eventPosition.game
        ..layer = ballLayer
        ..priority = ballPriority,
    );
    traceAllBodies();
  }
}

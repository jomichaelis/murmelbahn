import 'package:flame/components.dart';
import 'package:pinball_components/pinball_components.dart';
import 'package:pinball_flame/pinball_flame.dart';

/// {@template inspi_animatronic}
/// Animated Inspi that sits on top of the [InspiFire].
/// {@endtemplate}
class InspiAnimatronic extends SpriteAnimationComponent
    with HasGameRef, ZIndex {
  /// {@macro sparky_animatronic}
  InspiAnimatronic({Iterable<Component>? children})
      : super(
          anchor: Anchor.center,
          playing: false,
          children: children,
        ) {
    zIndex = ZIndexes.inspiAnimatronic;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final spriteSheet = gameRef.images.fromCache(
      Assets.images.inspi.animatronic.keyName,
    );

    const amountPerRow = 9;
    const amountPerColumn = 7;
    final textureSize = Vector2(
      spriteSheet.width / amountPerRow,
      spriteSheet.height / amountPerColumn,
    );
    size = textureSize / 12;

    animation = SpriteAnimation.fromFrameData(
      spriteSheet,
      SpriteAnimationData.sequenced(
        amount: amountPerRow * amountPerColumn,
        amountPerRow: amountPerRow,
        stepTime: 1 / 24,
        textureSize: textureSize,
        loop: false,
      ),
    );
  }
}

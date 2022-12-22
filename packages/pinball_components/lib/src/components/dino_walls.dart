import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:pinball_components/gen/assets.gen.dart';
import 'package:pinball_components/pinball_components.dart' hide Assets;
import 'package:pinball_flame/pinball_flame.dart';

/// {@template dino_walls}
/// Walls near the [JurteBumper].
/// {@endtemplate}
class DinoWalls extends Component {
  /// {@macro dino_walls}
  DinoWalls()
      : super(
          children: [
            _DinoTopWall(),
            _DinoBottomWall(),
          ],
        );
}

/// {@template dino_top_wall}
/// Wall segment located above [JurteBumper].
/// {@endtemplate}
class _DinoTopWall extends BodyComponent with InitialPosition, ZIndex {
  ///{@macro dino_top_wall}
  _DinoTopWall()
      : super(
          children: [
            _DinoTopWallSpriteComponent(),
            _DinoTopWallTunnelSpriteComponent(),
          ],
          renderBody: false,
        );

  List<FixtureDef> _createFixtureDefs() {
    final topEdgeShape = EdgeShape()
      ..set(
        Vector2(29.55, -40.97),
        Vector2(28.2, -40.77),
      );

    final topCurveShape = BezierCurveShape(
      controlPoints: [
        topEdgeShape.vertex2,
        Vector2(22.15, -32.72),
        Vector2(22.45, -27.62),
      ],
    );

    final tunnelTopEdgeShape = EdgeShape()
      ..set(
        topCurveShape.vertices.last,
        Vector2(30.15, -31.32),
      );

    final tunnelBottomEdgeShape = EdgeShape()
      ..set(
        Vector2(30.55, -27.17),
        Vector2(24.65, -24.22),
      );

    final middleEdgeShape = EdgeShape()
      ..set(
        tunnelBottomEdgeShape.vertex2,
        Vector2(25.25, -21.32),
      );

    final bottomEdgeShape = EdgeShape()
      ..set(
        middleEdgeShape.vertex2,
        Vector2(24, -19.02),
      );

    final undersideEdgeShape = EdgeShape()
      ..set(
        bottomEdgeShape.vertex2,
        Vector2(30.78, -17.77),
      );

    return [
      FixtureDef(topEdgeShape),
      FixtureDef(topCurveShape),
      FixtureDef(tunnelTopEdgeShape),
      FixtureDef(tunnelBottomEdgeShape),
      FixtureDef(middleEdgeShape),
      FixtureDef(bottomEdgeShape),
      FixtureDef(undersideEdgeShape),
    ];
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: initialPosition,
      userData: this,
    );

    final body = world.createBody(bodyDef);
    _createFixtureDefs().forEach(body.createFixture);

    return body;
  }
}

class _DinoTopWallSpriteComponent extends SpriteComponent
    with HasGameRef, ZIndex {
  _DinoTopWallSpriteComponent()
      : super(
          position: Vector2(21.85, -41.07),
        ) {
    zIndex = ZIndexes.jurteAreaTopWall;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final sprite = Sprite(
      gameRef.images.fromCache(
        Assets.images.jurteArea.topWall.keyName,
      ),
    );
    this.sprite = sprite;
    size = sprite.originalSize / 10;
  }
}

class _DinoTopWallTunnelSpriteComponent extends SpriteComponent
    with HasGameRef, ZIndex {
  _DinoTopWallTunnelSpriteComponent()
      : super(position: Vector2(22.41, -29.01)) {
    zIndex = ZIndexes.jurteAreaTopWallTunnel;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final sprite = Sprite(
      gameRef.images.fromCache(
        Assets.images.jurteArea.topWallTunnel.keyName,
      ),
    );
    this.sprite = sprite;
    size = sprite.originalSize / 10;
  }
}

/// {@template dino_bottom_wall}
/// Wall segment located below [JurteBumper].
/// {@endtemplate}
class _DinoBottomWall extends BodyComponent with InitialPosition, ZIndex {
  ///{@macro dino_top_wall}
  _DinoBottomWall()
      : super(
          children: [_DinoBottomWallSpriteComponent()],
          renderBody: false,
        ) {
    zIndex = ZIndexes.jurteAreaBottomWall;
  }

  List<FixtureDef> _createFixtureDefs() {
    final topEdgeShape = EdgeShape()
      ..set(
        Vector2(32.2, -8.8),
        Vector2(24.8, -7.7),
      );

    final topLeftCurveShape = BezierCurveShape(
      controlPoints: [
        topEdgeShape.vertex2,
        Vector2(21.6, -7),
        Vector2(29.6, 13.8),
      ],
    );

    final bottomLeftEdgeShape = EdgeShape()
      ..set(
        topLeftCurveShape.vertices.last,
        Vector2(31.7, 44.1),
      );

    final bottomEdgeShape = EdgeShape()
      ..set(
        bottomLeftEdgeShape.vertex2,
        Vector2(37.6, 44.1),
      );

    return [
      FixtureDef(topEdgeShape),
      FixtureDef(topLeftCurveShape),
      FixtureDef(bottomLeftEdgeShape),
      FixtureDef(bottomEdgeShape),
    ];
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      position: initialPosition,
      userData: this,
    );

    final body = world.createBody(bodyDef);
    _createFixtureDefs().forEach(body.createFixture);

    return body;
  }
}

class _DinoBottomWallSpriteComponent extends SpriteComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final sprite = Sprite(
      gameRef.images.fromCache(
        Assets.images.jurteArea.bottomWall.keyName,
      ),
    );
    this.sprite = sprite;
    size = sprite.originalSize / 10;
    position = Vector2(23.6, -9.5);
  }
}

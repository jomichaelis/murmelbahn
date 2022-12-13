/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/pinball_button.png
  AssetGenImage get pinballButton =>
      const AssetGenImage('assets/images/pinball_button.png');

  $AssetsImagesScoutGen get scout => const $AssetsImagesScoutGen();

  /// File path: assets/images/select_character_background.png
  AssetGenImage get selectCharacterBackground =>
      const AssetGenImage('assets/images/select_character_background.png');

  /// List of all assets
  List<AssetGenImage> get values => [pinballButton, selectCharacterBackground];
}

class $AssetsImagesScoutGen {
  const $AssetsImagesScoutGen();

  /// File path: assets/images/scout/animation.png
  AssetGenImage get animation =>
      const AssetGenImage('assets/images/scout/animation.png');

  /// File path: assets/images/scout/background.jpg
  AssetGenImage get background =>
      const AssetGenImage('assets/images/scout/background.jpg');

  /// File path: assets/images/scout/ball.png
  AssetGenImage get ball => const AssetGenImage('assets/images/scout/ball.png');

  /// File path: assets/images/scout/icon.png
  AssetGenImage get icon => const AssetGenImage('assets/images/scout/icon.png');

  /// File path: assets/images/scout/leaderboard_icon.png
  AssetGenImage get leaderboardIcon =>
      const AssetGenImage('assets/images/scout/leaderboard_icon.png');

  /// File path: assets/images/scout/mb_background.png
  AssetGenImage get mbBackground =>
      const AssetGenImage('assets/images/scout/mb_background.png');

  /// File path: assets/images/scout/mb_ball.blend
  String get mbBallBlend => 'assets/images/scout/mb_ball.blend';

  /// File path: assets/images/scout/mb_ball.xcf
  String get mbBallXcf => 'assets/images/scout/mb_ball.xcf';

  /// File path: assets/images/scout/mb_ball_full.png
  AssetGenImage get mbBallFull =>
      const AssetGenImage('assets/images/scout/mb_ball_full.png');

  /// List of all assets
  List<dynamic> get values => [
        animation,
        background,
        ball,
        icon,
        leaderboardIcon,
        mbBackground,
        mbBallBlend,
        mbBallXcf,
        mbBallFull
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package = 'pinball_theme',
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => 'packages/pinball_theme/$_assetName';
}

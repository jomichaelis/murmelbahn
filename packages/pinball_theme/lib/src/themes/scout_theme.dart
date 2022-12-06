import 'package:pinball_theme/pinball_theme.dart';

/// {@template scout_theme}
/// Defines Scout character theme assets and attributes.
/// {@endtemplate}
class ScoutTheme extends CharacterTheme {
  /// {@macro scout_theme}
  const ScoutTheme();

  @override
  String get name => 'Scout';

  @override
  AssetGenImage get ball => Assets.images.scout.ball;

  @override
  AssetGenImage get background => Assets.images.scout.background;

  @override
  AssetGenImage get icon => Assets.images.scout.icon;

  @override
  AssetGenImage get leaderboardIcon => Assets.images.scout.leaderboardIcon;

  @override
  AssetGenImage get animation => Assets.images.scout.animation;
}

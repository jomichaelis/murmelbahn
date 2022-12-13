part of 'backbox_bloc.dart';

/// {@template backbox_event}
/// Base class for backbox events.
/// {@endtemplate}
abstract class BackboxEvent extends Equatable {
  /// {@macro backbox_event}
  const BackboxEvent();
}

/// {@template player_name_requested}
/// Event that triggers the user name display.
/// {@endtemplate}
class PlayerNameRequested extends BackboxEvent {
  /// {@macro player_name_requested}
  const PlayerNameRequested({
    required this.score,
  });

  /// Player's score.
  final int score;

  @override
  List<Object?> get props => [score];
}

/// {@template group_name_requested}
/// Event that triggers the user group display.
/// {@endtemplate}
class GroupNameRequested extends BackboxEvent {
  /// {@macro group_name_requested}
  const GroupNameRequested({
    required this.score,
    required this.playerName,
  });

  /// Player's score.
  final int score;

  /// Player's name.
  final String playerName;

  @override
  List<Object?> get props => [score, playerName];
}

/// {@template submitted}
/// Event that submits the user score, playerName and groupName.
/// {@endtemplate}
class PlayerSubmitted extends BackboxEvent {
  /// {@macro submitted}
  const PlayerSubmitted({
    required this.score,
    required this.playerName,
    required this.groupName,
  });

  /// Player's score.
  final int score;

  /// Player's name.
  final String playerName;

  /// Player's group.
  final String groupName;

  @override
  List<Object?> get props => [score, playerName, groupName];
}

/// {@template share_score_requested}
/// Event when user requests to share their score.
/// {@endtemplate}
class ShareScoreRequested extends BackboxEvent {
  /// {@macro share_score_requested}
  const ShareScoreRequested({
    required this.score,
  });

  /// Player's score.
  final int score;

  @override
  List<Object?> get props => [score];
}

/// Event that triggers the fetching of the leaderboard
class LeaderboardRequested extends BackboxEvent {
  @override
  List<Object?> get props => [];
}

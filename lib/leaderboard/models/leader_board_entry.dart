import 'package:equatable/equatable.dart';
import 'package:leaderboard_repository/leaderboard_repository.dart';

/// {@template leaderboard_entry}
/// A model representing a leaderboard entry containing the ranking position,
/// player's initials, score, and chosen character.
///
/// {@endtemplate}
class LeaderboardEntry extends Equatable {
  /// {@macro leaderboard_entry}
  const LeaderboardEntry({
    required this.rank,
    required this.playerName,
    required this.groupName,
    required this.score,
  });

  /// Ranking position for [LeaderboardEntry].
  final String rank;

  /// Player's chosen name for [LeaderboardEntry].
  final String playerName;

  /// Player's chosen groupName for [LeaderboardEntry].
  final String groupName;

  /// Score for [LeaderboardEntry].
  final int score;

  @override
  List<Object?> get props => [rank, playerName, groupName, score];
}

/// Converts [LeaderboardEntryData] from repository to [LeaderboardEntry].
extension LeaderboardEntryDataX on LeaderboardEntryData {
  /// Conversion method to [LeaderboardEntry]
  LeaderboardEntry toEntry(int position) {
    return LeaderboardEntry(
      rank: position.toString(),
      playerName: playerName,
      groupName: groupName,
      score: score,
    );
  }
}

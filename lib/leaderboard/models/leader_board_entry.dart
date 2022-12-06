import 'package:equatable/equatable.dart';
import 'package:pinball_models/pinball_models.dart';

/// {@template leaderboard_entry}
/// A model representing a leaderboard entry containing the ranking position,
/// player's initials, score, and chosen character.
///
/// {@endtemplate}
class LeaderboardEntry extends Equatable {
  /// {@macro leaderboard_entry}
  const LeaderboardEntry({
    required this.rank,
    required this.playerInitials,
    required this.score,
  });

  /// Ranking position for [LeaderboardEntry].
  final String rank;

  /// Player's chosen initials for [LeaderboardEntry].
  final String playerInitials;

  /// Score for [LeaderboardEntry].
  final int score;

  @override
  List<Object?> get props => [rank, playerInitials, score];
}

/// Converts [LeaderboardEntryData] from repository to [LeaderboardEntry].
extension LeaderboardEntryDataX on LeaderboardEntryData {
  /// Conversion method to [LeaderboardEntry]
  LeaderboardEntry toEntry(int position) {
    return LeaderboardEntry(
      rank: position.toString(),
      playerInitials: playerInitials,
      score: score,
    );
  }
}

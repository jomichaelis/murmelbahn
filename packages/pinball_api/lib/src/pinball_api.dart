import 'package:pinball_models/pinball_models.dart';

/// {@template pinball_api}
/// Repository to access leaderboard data.
/// {@endtemplate}
abstract class PinballApi {
  /// {@macro pinball_api}
  const PinballApi();

  /// Acquires top 10 [LeaderboardEntryData]s.
  Future<List<LeaderboardEntryData>> fetchTop10Leaderboard();

  /// Adds player's score entry to the leaderboard if it is within the top-10
  Future<void> addLeaderboardEntry(LeaderboardEntryData entry);
}

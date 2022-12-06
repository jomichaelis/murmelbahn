import 'package:pinball_api/pinball_api.dart';

/// {@template pinball_repository}
/// A repository that handles pinball related requests.
/// {@endtemplate}
class PinballRepository {
  /// {@macro pinball_repository}
  const PinballRepository({
    required PinballApi pinballApi,
  })  : _pinballApi = pinballApi;

  final PinballApi _pinballApi;

  /// Provides a [Future] of top10 leaderboards.
  Future<List<LeaderboardEntryData>> fetchTop10Leaderboard() async {
    return _pinballApi.fetchTop10Leaderboard();
  }

  /// Adds player's score entry to the leaderboard if it is within the top-10
  Future<void> addLeaderboardEntry(LeaderboardEntryData entry) async {
    return _pinballApi.addLeaderboardEntry(entry);
  }
}

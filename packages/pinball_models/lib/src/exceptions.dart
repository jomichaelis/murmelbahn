/// {@template leaderboard_exception}
/// Base exception for leaderboard repository failures.
/// {@endtemplate}
abstract class LeaderboardException implements Exception {
  /// {@macro leaderboard_exception}
  const LeaderboardException(this.error, this.stackTrace);

  /// The error that was caught.
  final Object error;

  /// The Stacktrace associated with the [error].
  final StackTrace stackTrace;
}

/// {@template fetch_top_10_leaderboard_exception}
/// Exception thrown when failure occurs while fetching top 10 leaderboard.
/// {@endtemplate}
class FetchTop10LeaderboardException extends LeaderboardException {
  /// {@macro fetch_top_10_leaderboard_exception}
  const FetchTop10LeaderboardException(Object error, StackTrace stackTrace)
      : super(error, stackTrace);
}

/// {@template add_leaderboard_entry_exception}
/// Exception thrown when failure occurs while adding entry to leaderboard.
/// {@endtemplate}
class AddLeaderboardEntryException extends LeaderboardException {
  /// {@macro add_leaderboard_entry_exception}
  const AddLeaderboardEntryException(Object error, StackTrace stackTrace)
      : super(error, stackTrace);
}

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

/// {@template leaderboard_entry_data}
/// A model representing a leaderboard entry containing the player's initials
/// and score.
///
/// Stored in Firestore `leaderboard` collection.
///
/// Example:
/// ```json
/// {
///   "playerInitials" : "ABC",
///   "score" : 1500
/// }
/// ```
/// {@endtemplate}
@JsonSerializable()
class LeaderboardEntryData extends Equatable {
  /// {@macro leaderboard_entry_data}
  const LeaderboardEntryData({
    required this.playerInitials,
    required this.score,
  });

  /// Factory which converts a [Map] into a [LeaderboardEntryData].
  factory LeaderboardEntryData.fromJson(Map<String, dynamic> json) {
    return LeaderboardEntryData(
      playerInitials: json['playerInitials'] as String,
      score: json['score'] as int,
    );
  }

  /// Converts the [LeaderboardEntryData] to [Map].
  Map<String, dynamic> toJson() => {
      'playerInitials': playerInitials,
      'score': score,
  };

  /// Player's chosen initials for [LeaderboardEntryData].
  ///
  /// Example: 'ABC'.
  @JsonKey(name: 'playerInitials')
  final String playerInitials;

  /// Score for [LeaderboardEntryData].
  ///
  /// Example: 1500.
  @JsonKey(name: 'score')
  final int score;

  /// An empty [LeaderboardEntryData] object.
  static const empty = LeaderboardEntryData(
    playerInitials: '',
    score: 0,
  );

  @override
  List<Object?> get props => [playerInitials, score];
}

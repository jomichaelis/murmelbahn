import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

/// {@template leaderboard_entry_data}
/// A model representing a leaderboard entry containing the player's name,
/// chosen group name and score.
///
/// Stored in Firestore `leaderboard` collection.
///
/// Example:
/// ```json
/// {
///   "playerName" : "jomichaelis",
///   "groupName" : "Seepferdchen zur Gätterdämmerung",
///   "score" : 1500
/// }
/// ```
/// {@endtemplate}
@JsonSerializable()
class LeaderboardEntryData extends Equatable {
  /// {@macro leaderboard_entry_data}
  const LeaderboardEntryData({
    required this.playerName,
    required this.groupName,
    required this.score,
  });

  /// Factory which converts a [Map] into a [LeaderboardEntryData].
  factory LeaderboardEntryData.fromJson(Map<String, dynamic> json) {
    return LeaderboardEntryData(
      playerName: json['playerName'] as String,
      groupName: json['groupName'] as String,
      score: json['score'] as int,
    );
  }

  /// Converts the [LeaderboardEntryData] to [Map].
  Map<String, dynamic> toJson() => <String, dynamic>{
    'playerName': playerName,
    'groupName': groupName,
    'score': score,
  };

  /// Player's chosen name for [LeaderboardEntryData].
  ///
  /// Example: 'jomichaelis'.
  @JsonKey(name: 'playerName')
  final String playerName;

  /// Player's chosen group for [LeaderboardEntryData].
  ///
  /// Example: 'Seepferdchen zur Götterdämmerung'.
  @JsonKey(name: 'groupName')
  final String groupName;

  /// Score for [LeaderboardEntryData].
  ///
  /// Example: 1500.
  @JsonKey(name: 'score')
  final int score;

  /// An empty [LeaderboardEntryData] object.
  static const empty = LeaderboardEntryData(
    playerName: '',
    groupName: '',
    score: 0,
  );

  @override
  List<Object?> get props => [playerName, groupName, score];
}

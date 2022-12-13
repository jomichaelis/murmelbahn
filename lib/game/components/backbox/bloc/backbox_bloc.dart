import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:leaderboard_repository/leaderboard_repository.dart';

part 'backbox_event.dart';
part 'backbox_state.dart';

/// {@template backbox_bloc}
/// Bloc which manages the Backbox display.
/// {@endtemplate}
class BackboxBloc extends Bloc<BackboxEvent, BackboxState> {
  /// {@macro backbox_bloc}
  BackboxBloc({
    required LeaderboardRepository leaderboardRepository,
    required List<LeaderboardEntryData>? initialEntries,
  })  : _leaderboardRepository = leaderboardRepository,
        super(
          initialEntries != null
              ? LeaderboardSuccessState(entries: initialEntries)
              : LeaderboardFailureState(),
        ) {
    on<PlayerNameRequested>(_onPlayerNameRequested);
    on<GroupNameRequested>(_onGroupNameRequested);
    on<PlayerSubmitted>(_onSubmitted);
    on<ShareScoreRequested>(_onScoreShareRequested);
    on<LeaderboardRequested>(_onLeaderboardRequested);
  }

  final LeaderboardRepository _leaderboardRepository;

  void _onPlayerNameRequested(
    PlayerNameRequested event,
    Emitter<BackboxState> emit,
  ) {
    emit(
      InitialsFormState(
        score: event.score,
      ),
    );
  }

  void _onGroupNameRequested(
      GroupNameRequested event,
      Emitter<BackboxState> emit,
      ) {
    emit(
      InitialsFormState(
        score: event.score,
      ),
    );
  }

  Future<void> _onSubmitted(
    PlayerSubmitted event,
    Emitter<BackboxState> emit,
  ) async {
    try {
      emit(LoadingState());
      await _leaderboardRepository.addLeaderboardEntry(
        LeaderboardEntryData(
          playerName: event.playerName,
          groupName: event.groupName,
          score: event.score,
        ),
      );
      emit(
        PlayerSuccessState(
          score: event.score,
        ),
      );
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(
        PlayerFailureState(
          score: event.score,
        ),
      );
    }
  }

  Future<void> _onScoreShareRequested(
    ShareScoreRequested event,
    Emitter<BackboxState> emit,
  ) async {
    emit(
      ShareState(score: event.score),
    );
  }

  Future<void> _onLeaderboardRequested(
    LeaderboardRequested event,
    Emitter<BackboxState> emit,
  ) async {
    try {
      emit(LoadingState());

      final entries = await _leaderboardRepository.fetchTop10Leaderboard();

      emit(LeaderboardSuccessState(entries: entries));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(LeaderboardFailureState());
    }
  }
}

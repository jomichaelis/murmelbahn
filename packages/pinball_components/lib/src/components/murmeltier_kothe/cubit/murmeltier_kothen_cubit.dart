import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinball_components/pinball_components.dart';

part 'murmeltier_kothen_state.dart';

class MurmeltierKothenCubit extends Cubit<MurmeltierKothenState> {
  MurmeltierKothenCubit() : super(MurmeltierKothenState.initial());

  /// Event added when a ball contacts with a kothe.
  void onBallContacted(MurmeltierKotheId id) {
    final spriteStatesMap = {...state.kotheSpriteStates};
    emit(
      MurmeltierKothenState(
        kotheSpriteStates: spriteStatesMap
          ..update(id, (_) => MurmeltierKotheSpriteState.active),
      ),
    );
  }

  /// Event added when the bumpers should return to their initial
  /// configurations.
  void onReset() {
    emit(MurmeltierKothenState.initial());
  }
}

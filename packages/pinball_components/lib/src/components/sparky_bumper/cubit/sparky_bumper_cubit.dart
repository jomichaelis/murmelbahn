import 'package:bloc/bloc.dart';

part 'sparky_bumper_state.dart';

class SparkyBumperCubit extends Cubit<SparkyBumperState> {
  SparkyBumperCubit() : super(SparkyBumperState.dimmed);

  void onBallContacted() {
    emit(SparkyBumperState.lit);
  }

  void onBlinked() {
    emit(SparkyBumperState.dimmed);
  }
}

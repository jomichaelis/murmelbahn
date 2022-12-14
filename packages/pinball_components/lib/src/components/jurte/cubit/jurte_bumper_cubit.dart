import 'package:bloc/bloc.dart';

part 'jurte_bumper_state.dart';

class JurteBumperCubit extends Cubit<JurteBumperState> {
  JurteBumperCubit() : super(JurteBumperState.dimmed);

  void onBallContacted() {
    emit(JurteBumperState.lit);
  }

  void onBlinked() {
    emit(JurteBumperState.dimmed);
  }
}

import 'package:bloc/bloc.dart';

part 'android_bumper_state.dart';

class AndroidBumperCubit extends Cubit<AndroidBumperState> {
  AndroidBumperCubit() : super(AndroidBumperState.dimmed);

  void onBallContacted() {
    emit(AndroidBumperState.lit);
  }

  void onBlinked() {
    emit(AndroidBumperState.dimmed);
  }
}

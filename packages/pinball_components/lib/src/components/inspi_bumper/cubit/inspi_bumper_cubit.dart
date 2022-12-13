import 'package:bloc/bloc.dart';

part 'inspi_bumper_state.dart';

class InspiBumperCubit extends Cubit<InspiBumperState> {
  InspiBumperCubit() : super(InspiBumperState.dimmed);

  void onBallContacted() {
    emit(InspiBumperState.lit);
  }

  void onBlinked() {
    emit(InspiBumperState.dimmed);
  }
}

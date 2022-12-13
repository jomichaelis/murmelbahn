import 'package:bloc/bloc.dart';

part 'inspi_fire_state.dart';

class InspiFireCubit extends Cubit<InspiFireState> {
  InspiFireCubit() : super(InspiFireState.withoutBall);

  void onBallEntered() {
    emit(InspiFireState.withBall);
  }

  void onBallTurboCharged() {
    emit(InspiFireState.withoutBall);
  }
}

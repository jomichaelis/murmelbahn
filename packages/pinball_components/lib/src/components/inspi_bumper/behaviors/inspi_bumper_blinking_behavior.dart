import 'package:flame/components.dart';
import 'package:pinball_components/pinball_components.dart';

/// {@template inspi_bumper_blinking_behavior}
/// Makes a [InspiBumper] blink back to [InspiBumperState.dimmed] when
/// [InspiBumperState.lit].
/// {@endtemplate}
class InspiBumperBlinkingBehavior extends TimerComponent
    with ParentIsA<InspiBumper> {
  /// {@macro inspi_bumper_blinking_behavior}
  InspiBumperBlinkingBehavior() : super(period: 0.05);

  void _onNewState(InspiBumperState state) {
    switch (state) {
      case InspiBumperState.dimmed:
        break;
      case InspiBumperState.lit:
        timer
          ..reset()
          ..start();
        break;
    }
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    timer.stop();
    parent.bloc.stream.listen(_onNewState);
  }

  @override
  void onTick() {
    super.onTick();
    timer.stop();
    parent.bloc.onBlinked();
  }
}

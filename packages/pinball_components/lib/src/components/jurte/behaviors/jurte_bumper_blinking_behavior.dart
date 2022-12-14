import 'package:flame/components.dart';
import 'package:pinball_components/pinball_components.dart';

/// {@template jurte_bumper_blinking_behavior}
/// Makes a [JurteBumper] blink back to [JurteBumperState.dimmed] when
/// [JurteBumperState.lit].
/// {@endtemplate}
class JurteBumperBlinkingBehavior extends TimerComponent
    with ParentIsA<JurteBumper> {
  /// {@macro android_bumper_blinking_behavior}
  JurteBumperBlinkingBehavior() : super(period: 0.05);

  void _onNewState(JurteBumperState state) {
    switch (state) {
      case JurteBumperState.dimmed:
        break;
      case JurteBumperState.lit:
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

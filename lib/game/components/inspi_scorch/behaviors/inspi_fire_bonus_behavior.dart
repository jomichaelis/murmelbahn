import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:murmelbahn/game/game.dart';
import 'package:pinball_components/pinball_components.dart';

/// Adds a [GameBonus.inspiFire] when a [Ball] enters the
/// [InspiFire].
class InspiFireBonusBehavior extends Component
    with ParentIsA<InspiScorch>, FlameBlocReader<GameBloc, GameState> {
  @override
  void onMount() {
    super.onMount();
    final sparkyComputer = parent.firstChild<InspiFire>()!;
    sparkyComputer.bloc.stream.listen((state) async {
      final listenWhen = state == InspiFireState.withBall;
      if (!listenWhen) return;

      bloc.add(const BonusActivated(GameBonus.inspiFire));
    });
  }
}

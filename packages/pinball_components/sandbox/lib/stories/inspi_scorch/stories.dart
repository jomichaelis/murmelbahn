import 'package:dashbook/dashbook.dart';
import 'package:sandbox/common/common.dart';
import 'package:sandbox/stories/inspi_scorch/inspi_bumper_game.dart';
import 'package:sandbox/stories/inspi_scorch/inspi_fire_game.dart';

void addInspiScorchStories(Dashbook dashbook) {
  dashbook.storiesOf('Inspi Scorch')
    ..addGame(
      title: 'Inspi Fire',
      description: InspiFireGame.description,
      gameBuilder: (_) => InspiFireGame(),
    )
    ..addGame(
      title: 'Inspi Bumper',
      description: InspiBumperGame.description,
      gameBuilder: (_) => InspiBumperGame(),
    );
}

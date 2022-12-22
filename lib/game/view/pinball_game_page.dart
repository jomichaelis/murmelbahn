import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leaderboard_repository/leaderboard_repository.dart';
import 'package:murmelbahn/assets_manager/assets_manager.dart';
import 'package:murmelbahn/game/game.dart';
import 'package:murmelbahn/l10n/l10n.dart';
import 'package:murmelbahn/more_information/more_information.dart';
import 'package:murmelbahn/start_game/start_game.dart';
import 'package:pinball_audio/pinball_audio.dart';
import 'package:pinball_ui/pinball_ui.dart';
import 'package:platform_helper/platform_helper.dart';
import 'package:share_repository/share_repository.dart';

import 'intro_screen.dart';

class PinballGameRootPage extends StatefulWidget {
  const PinballGameRootPage({
    Key? key,
    this.isDebugMode = kDebugMode,
  }) : super(key: key);

  final bool isDebugMode;

  @override
  State<PinballGameRootPage> createState() => _PinballGameRootPageState();
}

class _PinballGameRootPageState extends State<PinballGameRootPage> {

  bool _isFirstVisit = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isFirstVisit
      ? IntroScreenDefault()
      : PinballGamePage();
  }
}

class PinballGamePage extends StatelessWidget {
  const PinballGamePage({
    Key? key,
    this.isDebugMode = kDebugMode,
  }) : super(key: key);

  final bool isDebugMode;

  @override
  Widget build(BuildContext context) {
    final audioPlayer = context.read<PinballAudioPlayer>();
    final leaderboardRepository = context.read<LeaderboardRepository>();
    final shareRepository = context.read<ShareRepository>();
    final platformHelper = context.read<PlatformHelper>();
    final gameBloc = context.read<GameBloc>();
    final game = PinballGame(
      audioPlayer: audioPlayer,
      leaderboardRepository: leaderboardRepository,
      shareRepository: shareRepository,
      l10n: context.l10n,
      platformHelper: platformHelper,
      gameBloc: gameBloc,
    );

    return Scaffold(
      backgroundColor: PinballColors.black,
      body: BlocProvider(
        create: (_) => AssetsManagerCubit(game, audioPlayer)..load(),
        child: PinballGameView(game),
      ),
    );
  }
}

class PinballGameView extends StatelessWidget {
  const PinballGameView(this.game, {Key? key}) : super(key: key);

  final PinballGame game;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssetsManagerCubit, AssetsManagerState>(
      builder: (context, state) {
        return state.isLoading
            ? const AssetsLoadingPage()
            : PinballGameLoadedView(game);
      },
    );
  }
}

@visibleForTesting
class PinballGameLoadedView extends StatelessWidget {
  const PinballGameLoadedView(this.game, {Key? key}) : super(key: key);

  final PinballGame game;

  @override
  Widget build(BuildContext context) {
    return StartGameListener(
      child: Stack(
        children: [
          Positioned.fill(
            child: MouseRegion(
              onHover: (_) {
                if (!game.focusNode.hasFocus) {
                  game.focusNode.requestFocus();
                }
              },
              child: GameWidget<PinballGame>(
                game: game,
                focusNode: game.focusNode,
                initialActiveOverlays: const [PinballGame.playButtonOverlay],
                overlayBuilderMap: {
                  PinballGame.playButtonOverlay: (_, game) => const Positioned(
                        bottom: 20,
                        right: 0,
                        left: 0,
                        child: PlayButtonOverlay(),
                      ),
                  PinballGame.mobileControlsOverlay: (_, game) => Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: MobileControls(game: game),
                      ),
                  PinballGame.replayButtonOverlay: (context, game) =>
                      const Positioned(
                        bottom: 20,
                        right: 0,
                        left: 0,
                        child: ReplayButtonOverlay(),
                      )
                },
              ),
            ),
          ),
          const _PositionedGameHud(),
          const _PositionedInfoIcon(), // TODO
        ],
      ),
    );
  }
}

class _PositionedGameHud extends StatelessWidget {
  const _PositionedGameHud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPlaying = context.select(
      (StartGameBloc bloc) => bloc.state.status == StartGameStatus.play,
    );
    final isGameOver = context.select(
      (GameBloc bloc) => bloc.state.status.isGameOver,
    );

    final gameWidgetWidth = MediaQuery.of(context).size.height * 9 / 16;
    final screenWidth = MediaQuery.of(context).size.width;
    final leftMargin = (screenWidth / 2) - (gameWidgetWidth / 1.8);
    final clampedMargin = leftMargin > 0 ? leftMargin : 10.0;
    final top = 60.0;

    return Positioned(
      top: top,
      left: clampedMargin,
      child: Visibility(
        visible: isPlaying && !isGameOver,
        child: const GameHud(),
      ),
    );
  }
}

class _PositionedInfoIcon extends StatelessWidget {
  const _PositionedInfoIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          return Visibility(
            visible: state.status.isGameOver,
            child: IconButton(
              iconSize: 50,
              icon: const Icon(Icons.info, color: PinballColors.white),
              onPressed: () => showMoreInformationDialog(context),
            ),
          );
        },
      ),
    );
  }
}

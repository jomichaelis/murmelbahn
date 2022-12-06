import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:murmelbahn/game/game.dart';
import 'package:murmelbahn/l10n/l10n.dart';
import 'package:murmelbahn/start_game/start_game.dart';
import 'package:pinball_audio/pinball_audio.dart';
import 'package:pinball_repository/pinball_repository.dart';
import 'package:pinball_ui/pinball_ui.dart';
import 'package:platform_helper/platform_helper.dart';
import 'package:share_repository/share_repository.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required PinballRepository pinballRepository,
    required ShareRepository shareRepository,
    required PinballAudioPlayer pinballAudioPlayer,
    required PlatformHelper platformHelper,
  })  : _pinballRepository = pinballRepository,
        _shareRepository = shareRepository,
        _pinballAudioPlayer = pinballAudioPlayer,
        _platformHelper = platformHelper,
        super(key: key);

  final PinballRepository _pinballRepository;
  final ShareRepository _shareRepository;
  final PinballAudioPlayer _pinballAudioPlayer;
  final PlatformHelper _platformHelper;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _pinballRepository),
        RepositoryProvider.value(value: _shareRepository),
        RepositoryProvider.value(value: _pinballAudioPlayer),
        RepositoryProvider.value(value: _platformHelper),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => StartGameBloc()),
          BlocProvider(create: (_) => GameBloc()),
        ],
        child: MaterialApp(
          title: 'I/O Pinball',
          theme: PinballTheme.standard,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: const PinballGamePage(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murmelbahn/assets_manager/assets_manager.dart';
import 'package:murmelbahn/l10n/l10n.dart';
import 'package:pinball_ui/pinball_ui.dart';

/// {@template assets_loading_page}
/// Widget used to indicate the loading progress of the different assets used
/// in the game
/// {@endtemplate}
class AssetsLoadingPage extends StatelessWidget {
  /// {@macro assets_loading_page}
  const AssetsLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final headline1 = Theme.of(context).textTheme.headline1?.copyWith(fontSize: 50);
    final headline1lower = Theme.of(context).textTheme.headline1?.copyWith(fontSize: 25);
    final headline2 = Theme.of(context).textTheme.headline2;
    return Container(
      decoration: const CrtBackground(),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Murmelbahn',
              style: headline1,
            ),
            const SizedBox(height: 10),
            Text(
              'Internetnacht 2023',
              style: headline1lower,
            ),
            const SizedBox(height: 70),
            AnimatedEllipsisText(
              l10n.loading,
              style: headline2,
            ),
            const SizedBox(height: 40),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: BlocBuilder<AssetsManagerCubit, AssetsManagerState>(
                builder: (context, state) {
                  return PinballLoadingIndicator(value: state.progress);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

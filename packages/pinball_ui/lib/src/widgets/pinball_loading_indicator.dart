import 'package:flutter/material.dart';
import 'package:pinball_ui/pinball_ui.dart';

/// {@template pinball_loading_indicator}
/// Pixel-art loading indicator
/// {@endtemplate}
class PinballLoadingIndicator extends StatelessWidget {
  /// {@macro pinball_loading_indicator}
  const PinballLoadingIndicator({
    Key? key,
    required this.value,
  })  : assert(
          value >= 0.0 && value <= 1.0,
          'Progress must be between 0 and 1',
        ),
        super(key: key);

  /// Progress value
  final double value;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      child: Column(
        children: [
          LinearProgressIndicator(
            backgroundColor: PinballColors.loadingLight,
            color: PinballColors.darkBlue,
            value: value,
            minHeight: 15,
          ),
        ],
      ),
    );
  }
}

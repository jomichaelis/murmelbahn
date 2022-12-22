part of 'murmeltier_kothen_cubit.dart';

class MurmeltierKothenState extends Equatable {
  const MurmeltierKothenState({required this.kotheSpriteStates});

  MurmeltierKothenState.initial()
      : this(
          kotheSpriteStates: {
            for (var id in MurmeltierKotheId.values)
              id: MurmeltierKotheSpriteState.inactive
          },
        );

  final Map<MurmeltierKotheId, MurmeltierKotheSpriteState> kotheSpriteStates;

  bool get isFullyActivated => kotheSpriteStates.values
      .every((spriteState) => spriteState == MurmeltierKotheSpriteState.active);

  @override
  List<Object> get props => [...kotheSpriteStates.values];
}

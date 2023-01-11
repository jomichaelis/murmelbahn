import 'package:authentication_repository/authentication_repository.dart';
import 'package:leaderboard_repository/leaderboard_repository.dart';
import 'package:murmelbahn/app/app.dart';
import 'package:murmelbahn/bootstrap.dart';
import 'package:platform_helper/platform_helper.dart';
import 'package:share_repository/share_repository.dart';

void main() {
  bootstrap((firestore, firebaseAuth) async {
    final leaderboardRepository = LeaderboardRepository(firestore);
    const shareRepository =
        ShareRepository(appUrl: ShareRepository.pinballGameUrl);
    final authenticationRepository = AuthenticationRepository(firebaseAuth);
    final platformHelper = PlatformHelper();
    await authenticationRepository.authenticateAnonymously();
    return App(
      authenticationRepository: authenticationRepository,
      leaderboardRepository: leaderboardRepository,
      shareRepository: shareRepository,
      platformHelper: platformHelper,
    );
  });
}

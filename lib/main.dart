import 'package:http_pinball_api/http_pinball_api.dart';
import 'package:pinball/app/app.dart';
import 'package:pinball/bootstrap.dart';
import 'package:pinball/common/http/clients.dart';
import 'package:pinball_audio/pinball_audio.dart';
import 'package:pinball_repository/pinball_repository.dart';
import 'package:platform_helper/platform_helper.dart';
import 'package:share_repository/share_repository.dart';

void main() {
  bootstrap(() async {
    final pinballApi = HttpPinballApi(
      client: PinballHttpBaseClient(ShareRepository.pinballApiUrl),
    );
    final pinballRepository = PinballRepository(pinballApi: pinballApi);
    const shareRepository =
        ShareRepository(appUrl: ShareRepository.pinballGameUrl);
    final pinballAudioPlayer = PinballAudioPlayer();
    final platformHelper = PlatformHelper();
    return App(
      pinballRepository: pinballRepository,
      shareRepository: shareRepository,
      pinballAudioPlayer: pinballAudioPlayer,
      platformHelper: platformHelper,
    );
  });
}

import 'package:http_pinball_api/http_pinball_api.dart';

class PinballHttpBaseClient extends AbstractBaseClient {
  PinballHttpBaseClient(
    super.baseUrl, {
    Client? client,
  }) : _inner = client ?? Client();

  final Client _inner;

  Future<StreamedResponse> send(BaseRequest request) {
    // request.headers.addAll(Constants.headers);
    return _inner.send(request);
  }

  @override
  void close() => _inner.close();
}

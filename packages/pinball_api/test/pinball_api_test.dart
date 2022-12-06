import 'package:pinball_api/pinball_api.dart';
import 'package:test/test.dart';

class TestPinballApi extends PinballApi {
  TestPinballApi() : super();

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}

void main() {
  group('PinballApi', () {
    test('can be constructed', () {
      expect(TestPinballApi.new, returnsNormally);
    });
  });
}

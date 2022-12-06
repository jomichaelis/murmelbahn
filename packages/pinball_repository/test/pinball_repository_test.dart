// ignore_for_file: prefer_const_constructors
import 'package:mocktail/mocktail.dart';
import 'package:pinball_api/pinball_api.dart';
import 'package:test/test.dart';

class MockPinballApi extends Mock implements PinballApi {}

// class FakeTrending extends Fake implements Trending {}

void main() {
  group('TodosRepository', () {
    // late PinballApi api;
    //
    // final trendings = [
    // ];
    //
    // setUpAll(() {
    //   registerFallbackValue(FakeTrending());
    // });
    //
    // setUp(() {
    //   api = MockTrendingApi();
    //   when(() => api.getTrending(page: 1, pageSize: 20)).thenAnswer((_) => Future.value(trendings));
    // });
    //
    // TrendingRepository createSubject() => TrendingRepository(trendingApi: api);
    //
    // group('constructor', () {
    //   test('works properly', () {
    //     expect(
    //       createSubject,
    //       returnsNormally,
    //     );
    //   });
    // });
    //
    // group('getTrending', () {
    //   test('makes correct api request', () {
    //     final subject = createSubject();
    //
    //     expect(
    //       subject.getTrending(),
    //       isNot(throwsA(anything)),
    //     );
    //
    //     verify(() => api.getTrending(page: 1, pageSize: 20)).called(1);
    //   });
    //
    //   test('returns stream of current list todos', () {
    //     expect(
    //       createSubject().getTrending(),
    //       emits(trendings),
    //     );
    //   });
    // });
  });
}

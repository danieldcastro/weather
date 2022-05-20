import 'package:flutter_test/flutter_test.dart';
import 'package:weather/domain/contracts/gateways/http_service.dart';
import 'package:weather/infra/contracts/gateways/dio_service.dart';

void main() {
  group('DioService', () {
    late DioService sut;

    setUp(() {
      sut = DioService();
    });
    test('should return a list of users', () async {
      final result =
          await sut.get(url: 'https://google.com', queryParameters: {});
      expect(result, isA<HttpResponse>());
    });

    test('teste logger return this ', () {
      expect(sut.getInstance(), isA<Future<DioService>>());
    });
  });
}

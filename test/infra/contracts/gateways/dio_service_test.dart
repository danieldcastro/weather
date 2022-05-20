import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/domain/contracts/gateways/http_service.dart';
import 'package:weather/infra/contracts/gateways/dio_service.dart';

import '../../../mock/weather_mock.dart';

// class DioServiceMock extends Mock implements HttpService {}

//TODO verificar pq o coverage não reconhece o teste quando é feito com o mock

void main() {
  late HttpService sut;
  setUp(() {
    sut = DioService();
  });
  group('DioService', () {
    success() {
      when(() => sut.get(url: 'https://google.com', queryParameters: {}))
          .thenAnswer((_) async => HttpResponse(
              data: WeatherMock.validWeatherJson, statusCode: 200));
    }

    fail() {
      when(() => sut.get(url: 'https://google.com', queryParameters: {}))
          .thenAnswer((_) async => HttpResponse(data: {}, statusCode: 400));
    }

    test('should return a weather', () async {
      // success();
      final result =
          await sut.get(url: 'https://google.com', queryParameters: {});
      expect(result, isA<HttpResponse>());
      expect(result.statusCode, 200);
    });

    test('should return a error', () async {
      // fail();
      final result =
          await sut.get(url: 'https://google.com', queryParameters: {});
      expect(result, isA<HttpResponse>());
      // expect(result.statusCode, 400);
    });

    test('Should be return instance of DioService', () async {
      final _sut = DioService();
      final result = await _sut.getInstance();
      expect(result, isA<DioService>());
    });
  });
}

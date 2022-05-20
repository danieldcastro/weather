import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/domain/contracts/gateways/http_service.dart';
import 'package:weather/infra/contracts/gateways/dio_service.dart';
import 'package:weather/infra/provider/datasource.dart';
import 'package:weather/infra/provider/remote/datasource_impl.dart';

import '../../../mock/weather_mock.dart';

// class MockDatasource extends Mock implements Datasource {}
// class MockHttpService extends Mock implements HttpService {}

//TODO verificar pq o coverage não reconhece o teste quando é feito com o mock

void main() {
  late Datasource sut;
  late HttpService httpService;

  setUp(() {
    httpService = DioService();
    sut = DatasourceImpl(httpService: httpService);
  });

  group('Datasource', () {
    success() {
      when(() => httpService
          .get(
              url: 'https://google.com',
              queryParameters: {})).thenAnswer((_) async =>
          HttpResponse(data: WeatherMock.validWeatherJson, statusCode: 200));
    }

    fail() {
      when(() =>
              httpService.get(url: 'https://google.com', queryParameters: {}))
          .thenAnswer((_) async => HttpResponse(data: {}, statusCode: 400));
    }

    test('Should be return a weather', () async {
      // success();
      final result = await sut.getWeatherByCityName('Jundiai');
      expect(result.isRight, true);
      expect(result.right.statusCode, 200);
      expect(result.right, isA<HttpResponse>());
    });

    // test('Should be return a error', () async {
    //   // fail(FailureRequest.badRequest());
    //   final result = await sut.getWeatherByCityName('');
    //   expect(result.isLeft, true);
    //   expect(result.left, isA<FailureRequest>());
    //   expect(result.left, FailureRequest.badRequest());
    // });
  });
}

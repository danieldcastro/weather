import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/domain/contracts/gateways/http_service.dart';
import 'package:weather/domain/contracts/repositories/get_weather_repository.dart';
import 'package:weather/domain/entities/weather_entity.dart';
import 'package:weather/infra/contracts/repositories/get_weather_repository_impl.dart';
import 'package:weather/infra/errors/failure_request.dart';
import 'package:weather/infra/provider/datasource.dart';

import '../../../mock/weather_mock.dart';

class DatasourceMock extends Mock implements Datasource {}

void main() {
  late GetWeatherRepository sut;
  late Datasource datasource;

  setUp(() {
    datasource = DatasourceMock();
    sut = GetWeatherRepositoryImpl(datasource: datasource);
  });

  group('Get weather repository', () {
    success() {
      when(() => datasource.getWeatherByCityName('Jundiai')).thenAnswer(
          (_) async => Right(HttpResponse(
              data: WeatherMock.validWeatherJson, statusCode: 200)));
    }

    fail(FailureRequest error) {
      when(() => datasource.getWeatherByCityName('Jundiai'))
          .thenAnswer((_) async => Left(error));
    }

    test('Should be return success when call repository', () async {
      success();
      final result = await sut.call('Jundiai');
      verify(() => datasource.getWeatherByCityName('Jundiai')).called(1);
      expect(result, isA<Either<FailureRequest, WeatherEntity>>());
      expect(result.isRight, true);
      expect(result.right, isA<WeatherEntity>());
      expect(result.right, WeatherMock.validWeatherEntity);
    });

    test('Should be return error when call repository', () async {
      fail(FailureRequest.badRequest());
      final result = await sut.call('Jundiai');
      verify(() => datasource.getWeatherByCityName('Jundiai')).called(1);
      expect(result, isA<Either<FailureRequest, WeatherEntity>>());
      expect(result.isLeft, true);
      expect(result.left, isA<FailureRequest>());
      expect(result.left, FailureRequest.badRequest());
    });
  });
}

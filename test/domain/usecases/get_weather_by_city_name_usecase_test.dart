import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/domain/contracts/repositories/get_weather_repository.dart';
import 'package:weather/domain/entities/weather_entity.dart';
import 'package:weather/domain/usecases/get_weather_by_city_name/get_weather_by_city_name_usecase.dart';
import 'package:weather/domain/usecases/get_weather_by_city_name/get_weather_by_city_name_usecase_impl.dart';
import 'package:weather/infra/errors/failure_request.dart';

import '../../mock/weather_mock.dart';

class GetWeatherRepositoryMock extends Mock implements GetWeatherRepository {}

void main() {
  late GetWeatherRepository repository;
  late GetWeatherByCityNameUsecase sut;
  late WeatherEntity weather;

  setUp(() {
    repository = GetWeatherRepositoryMock();
    sut = GetWeatherByCityNameUsecaseImpl(repository: repository);
    weather = WeatherMock.validWeatherEntity;
  });

  group('Get weather by city name usecase', () {
    success() {
      when(() => repository.call('Jundiai'))
          .thenAnswer((invocation) async => Right(weather));
    }

    fail(FailureRequest error) {
      when(() => repository.call('Jundiai'))
          .thenAnswer((invocation) async => Left(error));
    }

    test('Should be return a valid weather', () async {
      success();

      final result = await sut.call('Jundiai');

      expect(result.right, weather);
      expect(result.isRight, true);
      expect(result.right, isA<WeatherEntity>());
      verify(() => repository.call('Jundiai')).called(1);
    });

    test('Should be return an error', () async {
      fail(FailureRequest.badRequest());

      final result = await sut.call('Jundiai');

      expect(result.left, isA<FailureRequest>());
      expect(result.isLeft, true);
      expect(result.left, FailureRequest.badRequest());
    });

    test('Should be return an error when cityName is empty', () async {
      final result = await sut.call('');

      expect(result.left, isA<Exception>());
      expect(result.isLeft, true);
    });
  });
}

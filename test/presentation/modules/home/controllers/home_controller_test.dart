import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/domain/entities/weather_entity.dart';
import 'package:weather/domain/usecases/get_weather_by_city_name/get_weather_by_city_name_usecase.dart';
import 'package:weather/presentation/pages/home/controllers/home_controller.dart';

import '../../../../mock/weather_mock.dart';

class GetWeatherByCityNameUsecaseMock extends Mock
    implements GetWeatherByCityNameUsecase {}

class BuildContextMock extends Mock implements BuildContext {}

void main() {
  late HomeController sut;
  late GetWeatherByCityNameUsecaseMock getWeatherByCityNameUsecaseMock;
  late BuildContext buildContextMock;

  setUp(() {
    getWeatherByCityNameUsecaseMock = GetWeatherByCityNameUsecaseMock();
    sut = HomeController();
    buildContextMock = BuildContextMock();
  });
  group('Home controller', () {
    success() {
      when(() => getWeatherByCityNameUsecaseMock.call('Jundiai')).thenAnswer(
          (invocation) async => Right(WeatherMock.validWeatherEntity));
    }

    failure() {
      when(() => getWeatherByCityNameUsecaseMock.call('Jundiai'))
          .thenAnswer((invocation) async => Left(Exception()));
    }

    test('Should return a valid instance', () {
      expect(sut, isA<HomeController>());
    });

    test('Should be return a valid method to get weather by city name',
        () async {
      success();
      String cityName = 'Jundiai';

      await sut.getWeatherByCityName(
          cityName: cityName, context: buildContextMock);

      expect(sut.weather, isA<WeatherEntity>());
      expect(sut.weather?.cityName, 'Jundiaí');
    });

    test(
        'Should be return a valid snackbar when get weather by city name fails',
        () {
      failure();

      sut.showSnackBar(
          'teste', buildContextMock); // TODO fazer o teste funcionar
    });
  });
}

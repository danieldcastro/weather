import 'package:flutter_test/flutter_test.dart';
import 'package:weather/domain/entities/weather_entity.dart';
import 'package:weather/infra/models/remote_weather_model.dart';

import '../../mock/weather_mock.dart';

void main() {
  group('Weather Entity', () {
    test('Should be return a valid WeatherEntity', () {
      final remoteWeatherModel =
          RemoteWeatherModel.fromJson(WeatherMock.validWeatherJson);

      final weather = WeatherEntity.fromModel(remoteWeatherModel);

      expect(weather, isA<WeatherEntity>());
      expect(weather, WeatherMock.validWeatherEntity);
    });

    test('Should be return toString', () {
      final remoteWeatherModel =
          RemoteWeatherModel.fromJson(WeatherMock.validWeatherJson);

      final weather = WeatherEntity.fromModel(remoteWeatherModel);

      expect(weather.toString(), isA<String>());
      expect(weather.toString(), WeatherMock.validWeatherEntity.toString());
    });

    test('Should be return hashCode', () {
      final weatherEntityHashcode = WeatherMock.validWeatherEntity.hashCode;

      expect(weatherEntityHashcode, isA<int>());
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:weather/infra/models/remote_weather_model.dart';

import '../../mock/weather_mock.dart';

void main() {
  group('Remote Weather Model', () {
    test('Should be return a valid RemoteWeatherModel', () {
      final remoteWeatherModel =
          RemoteWeatherModel.fromJson(WeatherMock.validWeatherJson);

      expect(remoteWeatherModel, isA<RemoteWeatherModel>());
      expect(remoteWeatherModel, WeatherMock.validRemoteWeatherModel);
    });

    test('Should be return toString', () {
      final remoteWeatherModel =
          RemoteWeatherModel.fromJson(WeatherMock.validWeatherJson);

      expect(remoteWeatherModel.toString(), isA<String>());
      expect(remoteWeatherModel.toString(),
          WeatherMock.validRemoteWeatherModel.toString());
    });

    test('Should be return hashCode', () {
      final remoteWeatherModelHashcode =
          WeatherMock.validRemoteWeatherModel.hashCode;

      expect(remoteWeatherModelHashcode, isA<int>());
    });
  });
}

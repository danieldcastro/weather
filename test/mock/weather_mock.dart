import 'package:weather/domain/entities/weather_entity.dart';
import 'package:weather/infra/models/remote_weather_model.dart';

class WeatherMock {
  static const Map<String, dynamic> validWeatherJson = {
    "temp": 18,
    "condition_code": "27",
    "description": "Tempo limpo",
    "city_name": "Jundiaí"
  };

  static const Map<String, dynamic> invalidWeatherJson = {};

  static RemoteWeatherModel validRemoteWeatherModel = RemoteWeatherModel(
      temp: 18,
      conditionCode: "27",
      description: "Tempo limpo",
      cityName: "Jundiaí");

  static RemoteWeatherModel invalidRemoteWeatherModel = RemoteWeatherModel(
      temp: null, conditionCode: null, description: null, cityName: null);

  static WeatherEntity validWeatherEntity = WeatherEntity(
      temp: 18,
      conditionCode: "27",
      description: "Tempo limpo",
      cityName: "Jundiaí");

  static WeatherEntity invalidWeatherEntity = WeatherEntity(
      temp: null, conditionCode: null, description: null, cityName: null);
}

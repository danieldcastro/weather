import 'package:weather/infra/models/remote_weather_model.dart';

class WeatherEntity {
  int? temp;
  String? conditionCode;
  String? description;
  String? cityName;
  DateTime? time;

  WeatherEntity({
    this.temp,
    this.conditionCode,
    this.description,
    this.cityName,
    this.time,
  });

  factory WeatherEntity.fromModel(RemoteWeatherModel model) {
    return WeatherEntity(
      temp: model.temp,
      conditionCode: model.conditionCode,
      description: model.description,
      cityName: model.cityName,
      time: model.time,
    );
  }

  @override
  String toString() {
    return 'WeatherEntity(temp: $temp, conditionCode: $conditionCode, description: $description, cityName: $cityName, time: $time) ';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherEntity &&
        other.temp == temp &&
        other.conditionCode == conditionCode &&
        other.description == description &&
        other.cityName == cityName &&
        other.time == time;
  }

  @override
  int get hashCode {
    return temp.hashCode ^
        conditionCode.hashCode ^
        description.hashCode ^
        cityName.hashCode ^
        time.hashCode;
  }
}

import 'package:weather/infra/models/remote_weather_model.dart';

class WeatherEntity {
  int? temp;
  String? conditionCode;
  String? description;
  String? cityName;

  WeatherEntity({
    this.temp,
    this.conditionCode,
    this.description,
    this.cityName,
  });

  factory WeatherEntity.fromModel(RemoteWeatherModel model) {
    return WeatherEntity(
      temp: model.temp,
      conditionCode: model.conditionCode,
      description: model.description,
      cityName: model.cityName,
    );
  }

  factory WeatherEntity.empty() {
    return WeatherEntity(
      temp: 0,
      conditionCode: '',
      description: '',
      cityName: '',
    );
  }

  @override
  String toString() {
    return 'WeatherEntity(temp: $temp, conditionCode: $conditionCode, description: $description, cityName: $cityName)';
  }

  List<Object?> get props => [
        temp,
        conditionCode,
        description,
        cityName,
      ];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeatherEntity &&
        other.temp == temp &&
        other.conditionCode == conditionCode &&
        other.description == description &&
        other.cityName == cityName;
  }

  @override
  int get hashCode {
    return temp.hashCode ^
        conditionCode.hashCode ^
        description.hashCode ^
        cityName.hashCode;
  }
}

class RemoteWeatherModel {
  int? temp;
  String? conditionCode;
  String? description;
  String? cityName;

  RemoteWeatherModel({
    this.temp,
    this.conditionCode,
    this.description,
    this.cityName,
  });

  factory RemoteWeatherModel.fromJson(Map<String, dynamic> data) =>
      RemoteWeatherModel(
        temp: data['temp'] as int?,
        conditionCode: data['condition_code'] as String?,
        description: data['description'] as String?,
        cityName: data['city_name'] as String?,
      );

  @override
  String toString() {
    return 'RemoteWeatherModel(temp: $temp, conditionCode: $conditionCode, description: $description, cityName: $cityName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RemoteWeatherModel &&
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

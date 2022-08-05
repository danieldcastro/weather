class RemoteWeatherModel {
  int? temp;
  String? conditionCode;
  String? description;
  String? cityName;
  DateTime? time;

  RemoteWeatherModel({
    this.temp,
    this.conditionCode,
    this.description,
    this.cityName,
    this.time,
  });

  factory RemoteWeatherModel.fromJson(Map<String, dynamic> data) =>
      RemoteWeatherModel(
        temp: data['temp'] as int?,
        conditionCode: data['condition_code'] as String?,
        description: data['description'] as String?,
        cityName: data['city_name'] as String?,
        time: DateTime.parse('0000-00-00 ${data['time']}'),
      );

  @override
  String toString() {
    return 'RemoteWeatherModel(temp: $temp, conditionCode: $conditionCode, description: $description, cityName: $cityName, time: $time) ';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RemoteWeatherModel &&
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

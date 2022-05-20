import 'package:either_dart/either.dart';

import '../../entities/weather_entity.dart';

abstract class GetWeatherRepository {
  Future<Either<Exception, WeatherEntity>> call(String cityName);
}

import 'package:either_dart/either.dart';

import '../../entities/weather_entity.dart';

abstract class GetWeatherByCityNameUsecase {
  Future<Either<Exception, WeatherEntity>> call(String cityName);
}

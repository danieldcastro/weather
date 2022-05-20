import 'package:either_dart/either.dart';
import 'package:weather/infra/errors/failure_request.dart';

import '../../entities/weather_entity.dart';

abstract class GetWeatherRepository {
  Future<Either<FailureRequest, WeatherEntity>> call(String cityName);
}

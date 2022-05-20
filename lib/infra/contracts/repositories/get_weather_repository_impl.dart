import 'package:either_dart/either.dart';
import 'package:weather/domain/contracts/repositories/get_weather_repository.dart';
import 'package:weather/domain/entities/weather_entity.dart';
import 'package:weather/infra/errors/failure_request.dart';
import 'package:weather/infra/models/remote_weather_model.dart';
import 'package:weather/infra/provider/datasource.dart';

class GetWeatherRepositoryImpl implements GetWeatherRepository {
  final Datasource _datasource;

  GetWeatherRepositoryImpl({required Datasource datasource})
      : _datasource = datasource;

  @override
  Future<Either<FailureRequest, WeatherEntity>> call(String cityName) async {
    final result = await _datasource.getWeatherByCityName(cityName);

    if (result.isLeft) {
      return Left(result.left);
    } else {
      final weather = RemoteWeatherModel.fromJson(result.right.data);

      final weatherModelToEntity = WeatherEntity.fromModel(weather);

      return Right(weatherModelToEntity);
    }
  }
}

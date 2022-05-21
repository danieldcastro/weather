import 'package:either_dart/either.dart';
import 'package:weather/domain/contracts/repositories/get_weather_repository.dart';
import 'package:weather/domain/entities/weather_entity.dart';
import 'package:weather/domain/usecases/get_weather_by_city_name/get_weather_by_city_name_usecase.dart';

class GetWeatherByCityNameUsecaseImpl implements GetWeatherByCityNameUsecase {
  final GetWeatherRepository _repository;

  GetWeatherByCityNameUsecaseImpl({required GetWeatherRepository repository})
      : _repository = repository;

  @override
  Future<Either<Exception, WeatherEntity>> call(String cityName) async {
    if (cityName.trim().isEmpty) {
      return Left(Exception('O nome da cidade não pode estar vazio'));
    }

    final response = await _repository.call(cityName);

    if (response.isLeft) {
      return Left(response.left);
    } else {
      return Right(response.right);
    }
  }
}

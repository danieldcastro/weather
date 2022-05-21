import 'package:weather/domain/contracts/gateways/http_service.dart';
import 'package:weather/domain/contracts/repositories/get_weather_repository.dart';
import 'package:weather/domain/usecases/get_weather_by_city_name/get_weather_by_city_name_usecase.dart';
import 'package:weather/domain/usecases/get_weather_by_city_name/get_weather_by_city_name_usecase_impl.dart';
import 'package:weather/infra/contracts/repositories/get_weather_repository_impl.dart';
import 'package:weather/infra/provider/datasource.dart';
import 'package:weather/infra/provider/remote/datasource_impl.dart';

import '../../../../infra/contracts/gateways/dio_service.dart';

class HomeBinding {
  HttpService? _dioService;
  Datasource? _datasource;
  GetWeatherRepository? _getWeatherRepository;
  GetWeatherByCityNameUsecase? _getWeatherByCityNameUsecase;

  GetWeatherByCityNameUsecase getWeatherByCityNameUsecase() {
    _dioService = DioService();
    _datasource = DatasourceImpl(httpService: _dioService!);
    _getWeatherRepository = GetWeatherRepositoryImpl(datasource: _datasource!);
    _getWeatherByCityNameUsecase =
        GetWeatherByCityNameUsecaseImpl(repository: _getWeatherRepository!);

    return _getWeatherByCityNameUsecase!;
  }
}

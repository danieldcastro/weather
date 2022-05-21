import 'package:weather/domain/usecases/get_weather_by_city_name/get_weather_by_city_name_usecase.dart';
import 'package:weather/presentation/pages/home/bindings/home_binding.dart';

class HomeController {
  final GetWeatherByCityNameUsecase usecase =
      HomeBinding().getWeatherByCityNameUsecase();

  Future<void> getWeatherByCityName(String cityName) async {
    await usecase.call(cityName);
  }
}

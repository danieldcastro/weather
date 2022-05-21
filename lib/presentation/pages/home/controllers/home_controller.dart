import 'package:flutter/material.dart';
import 'package:weather/domain/entities/weather_entity.dart';
import 'package:weather/domain/usecases/get_weather_by_city_name/get_weather_by_city_name_usecase.dart';
import 'package:weather/presentation/pages/home/bindings/home_binding.dart';

class HomeController {
  WeatherEntity? weather;
  bool isLoading = false;

  final GetWeatherByCityNameUsecase usecase =
      HomeBinding().getWeatherByCityNameUsecase();

  Future<void> getWeatherByCityName(
      {required String cityName, required BuildContext context}) async {
    isLoading = true;
    final result = await usecase.call(cityName);

    if (result.isRight) {
      weather = result.right;
    } else {
      showSnackBar('Não foi possível procurar pela cidade', context);
    }
  }

  void showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather/core/util/Helpers/image_paths.dart';

/// 0 - Tempestade forte
/// 1 - Tempestade tropical
/// 2 - Furacão
/// 3 - Tempestades severas
/// 4 - Tempestades
/// 5 - Misto de neve e chuva
/// 6 - Misto chuva e gelo
/// 7 - Misto neve e gelo
/// 8 - Geada fina
/// 9 - Chuviscos
/// 10 - Congelamento chuva
/// 11 - Alguns chuviscos
/// 12 - Alguns chuviscos
/// 13 - Neve baixa
/// 14 - Tempestade com neve
/// 15 - Ventania com neve
/// 16 - Neve
/// 17 - Granizo
/// 18 - Gelo
/// 19 - Poeira
/// 20 - Neblina
/// 21 - Tempestade de areia
/// 22 - Fumacento
/// 23 - Vento acentuado
/// 24 - Ventania
/// 25 - Tempo frio
/// 26 - Tempo nublado
/// 27 - Tempo limpo
/// 28 - Tempo nublado
/// 29 - Parcialmente nublado
/// 30 - Parcialmente nublado
/// 31 - Tempo limpo
/// 32 - Ensolarado
/// 33 - Estrelado
/// 34 - Ensolarado com muitas nuvens
/// 35 - Misto chuva e granizo
/// 36 - Ar quente
/// 37 - Tempestades isoladas
/// 38 - Trovoadas dispersas
/// 39 - Trovoadas dispersas
/// 40 - Chuvas esparsas
/// 41 - Pesados neve
/// 42 - Chuviscos com neve
/// 43 - Neve pesada
/// 44 - Sol com poucas nuvens
/// 45 - Chuva
/// 46 - Queda de neve
/// 47 - Tempestades isoladas
/// 48 - Serviço não disponível

class SetWeatherDetails {
  String setImageByConditionCode(String conditionCode) {
    switch (int.parse(conditionCode)) {
      case 0:
        return PathImage.thunderstorm;
      case 1:
        return PathImage.thunderstorm;
      case 2:
        return PathImage.windy;
      case 3:
        return PathImage.thunderstorm;
      case 4:
        return PathImage.thunderstorm;
      case 5:
        return PathImage.snow;
      case 6:
        return PathImage.rocks;
      case 7:
        return PathImage.snow;
      case 8:
        return PathImage.cold;
      case 9:
        return PathImage.rain;
      case 10:
        return PathImage.rain;
      case 11:
        return PathImage.rain;
      case 12:
        return PathImage.rain;
      case 13:
        return PathImage.snow;
      case 14:
        return PathImage.snow;
      case 15:
        return PathImage.snow;
      case 16:
        return PathImage.snowflake;
      case 17:
        return PathImage.rocks;
      case 18:
        return PathImage.rocks;
      case 19:
        return PathImage.windy;
      case 20:
        return PathImage.cloudy;
      case 21:
        return PathImage.windy;
      case 22:
        return PathImage.cloudy;
      case 23:
        return PathImage.windy;
      case 24:
        return PathImage.windy;
      case 25:
        return PathImage.cold;
      case 26:
        return PathImage.cloudy;
      case 27:
        return PathImage.cleanSky;
      case 28:
        return PathImage.cloudy;
      case 29:
        return PathImage.cloudy;
      case 30:
        return PathImage.cloudy;
      case 31:
        return PathImage.cleanSky;
      case 32:
        return PathImage.sunny;
      case 33:
        return PathImage.night;
      case 34:
        return PathImage.sunny;
      case 35:
        return PathImage.rocks;
      case 36:
        return PathImage.hot;
      case 37:
        return PathImage.thunderstorm;
      case 38:
        return PathImage.thunderstorm;
      case 39:
        return PathImage.thunderstorm;
      case 40:
        return PathImage.rain;
      case 41:
        return PathImage.snowflake;
      case 42:
        return PathImage.snow;
      case 43:
        return PathImage.snowflake;
      case 44:
        return PathImage.sunny;
      case 45:
        return PathImage.rain;
      case 46:
        return PathImage.snow;
      case 47:
        return PathImage.thunderstorm;
      default:
        return PathImage.cleanSky;
    }
  }

  Color setBackColorByHour(DateTime dateTime) {
    int hour = dateTime.hour;
    if (hour >= 0) {
      return const Color(0xFF2d4545);
    } else if (hour >= 6) {
      return const Color(0xFF98b9e7);
    } else if (hour >= 12) {
      return const Color(0xFFe6e6e6);
    } else if (hour >= 18) {
      return const Color(0xFFec6841);
    } else {
      return const Color(0xFF2d4545);
    }
  }
}

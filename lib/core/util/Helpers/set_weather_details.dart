import 'package:flutter/material.dart';

class SetWeatherDetails {
  String setImageByConditionCode(String conditionCode) {
    switch (int.parse(conditionCode)) {
      case 0:
        return 'teste';
      default:
        return 'teste';
    } // TODO: Arrumar função para retornar a imagem de acordo com o código da condição
  }

  Color setBackColorByHour() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour >= 6 && hour <= 18) {
      return Colors.blue;
    } else {
      return Colors.grey;
    }
    // TODO arrumar função para retornar cor de acordo com a hora
  }
}

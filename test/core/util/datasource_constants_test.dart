import 'package:flutter_test/flutter_test.dart';
import 'package:weather/core/util/datasource_constants.dart';

void main() {
  //TODO verificar pq o coverage não identifica esses testes
  group('Datasource constants', () {
    test('Should be return the string of the url', () {
      const result = DatasourceConstants.WEATHER_API_URL;
      expect(result, 'https://api.hgbrasil.com/weather');
    });

    test('Should be return the string of the key', () {
      const result = DatasourceConstants.WEATHER_API_KEY;
      expect(result, '52985fab');
    });

    test('Should be return the string of the fields', () {
      const result = DatasourceConstants.WEATHER_API_FIELDS;
      expect(result,
          'only_results, temp, description, condition_code, city_name, time');
    });
  });
}

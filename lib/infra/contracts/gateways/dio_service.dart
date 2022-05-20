import 'dart:developer' as dev;

import 'package:dio/dio.dart';
import 'package:weather/domain/contracts/gateways/http_service.dart';

class DioService implements HttpService {
  final _client = Dio();

  Future<DioService> getInstance() async {
    return this;
  }

  @override
  Future<HttpResponse> get(
      {required String url,
      required Map<String, dynamic> queryParameters}) async {
    final response = await _client.get(url, queryParameters: queryParameters);
    _logs(
        method: 'GET',
        url: url,
        response: response,
        statusCode: response.statusCode.toString());
    return HttpResponse(
      data: response.data,
      statusCode: response.statusCode,
    );
  }

  void _logs(
      {required String url,
      required Response<dynamic> response,
      required String method,
      required String statusCode}) {
    dev.log('############### $method ###############');
    dev.log('URL: $url');
    dev.log('StatusCode: $statusCode');
    dev.log('RESPONSE: ${response.data}');
    dev.log('######################################');
  }
}

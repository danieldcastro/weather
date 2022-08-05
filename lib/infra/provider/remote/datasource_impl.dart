import 'package:either_dart/either.dart';
import 'package:weather/core/util/datasource_constants.dart';
import 'package:weather/domain/contracts/gateways/http_service.dart';
import 'package:weather/infra/errors/failure_request.dart';
import 'package:weather/infra/provider/datasource.dart';

class DatasourceImpl implements Datasource {
  final HttpService _httpService;

  DatasourceImpl({required HttpService httpService})
      : _httpService = httpService;

  @override
  Future<Either<FailureRequest, HttpResponse>> getWeatherByCityName(
      String cityName) async {
    final response = await _httpService
        .get(url: DatasourceConstants.WEATHER_API_URL, queryParameters: {
      'fields': DatasourceConstants.WEATHER_API_FIELDS,
      'key': DatasourceConstants.WEATHER_API_KEY,
      'city_name': cityName,
    });
    return _handleResponse(response);
  }

  Either<FailureRequest, HttpResponse> _handleResponse(HttpResponse response) {
    switch (response.statusCode) {
      case 200:
        return Right(response);
      case 201:
        return Right(response);
      case 204:
        return Right(response);
      case 400:
        return Left(FailureRequest.badRequest(response.data));
      case 404:
        return Left(FailureRequest.notFound(response.data));
      case 500:
        return Left(FailureRequest.serverError(response.data));
      case 401:
        return Left(FailureRequest.unauthorized(response.data));
      case 409:
        return Left(FailureRequest.conflict(response.data));
      case 403:
        return Left(FailureRequest.forbidden(response.data));
      default:
        return Left(FailureRequest.unknownError(response.data));
    }
  }
}

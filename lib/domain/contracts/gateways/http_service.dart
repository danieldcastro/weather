abstract class HttpService {
  Future<HttpResponse> get(
      {required String url, required Map<String, dynamic> queryParameters});
}

class HttpResponse {
  final dynamic data;
  final int? statusCode;

  HttpResponse({required this.data, this.statusCode});
}

abstract class ApiClientAdapter<T> {
  Future<T> post({required String path, Object? data});
  Future<T> get({required String path, Map<String, String>? queryParam});
  Future<T> delete({required String path});
  Future<T> put({required String path, Object? data});
}

class Response<T> {
  T? data;
  int? statusCode;

  Response({this.data, this.statusCode});
}
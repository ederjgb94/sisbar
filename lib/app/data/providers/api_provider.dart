import 'request_handler.dart';

class ApiProvider {
  final String idProject;
  final String model;
  late String urlBase;

  ApiProvider({
    required this.idProject,
    required this.model,
  }) {
    urlBase =
        'https://firestore.googleapis.com/v1/projects/$idProject/databases/(default)/documents/$model';
  }

  Future<Map<String, dynamic>> getAll({
    Map<String, String>? headers,
  }) async {
    return sendRequest(HttpMethod.GET, urlBase, headers: headers);
  }

  Future<Map<String, dynamic>> get(
    String id, {
    Map<String, String>? headers,
  }) async {
    return sendRequest(HttpMethod.GET, '$urlBase/$id', headers: headers);
  }

  Future<Map<String, dynamic>> add(
    Map<String, dynamic> data, {
    Map<String, String>? headers,
  }) async {
    return sendRequest(HttpMethod.POST, urlBase, data: data, headers: headers);
  }

  Future<Map<String, dynamic>> update(
    String id,
    Map<String, dynamic> data, {
    Map<String, String>? headers,
  }) async {
    return sendRequest(
      HttpMethod.PATCH,
      '$urlBase/$id',
      data: data,
      headers: headers,
    );
  }

  Future<Map<String, dynamic>> delete(
    String id, {
    Map<String, String>? headers,
  }) async {
    return sendRequest(HttpMethod.DELETE, '$urlBase/$id', headers: headers);
  }
}

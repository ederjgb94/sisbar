import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../core/utils/firestore_values_util.dart';

enum HttpMethod { GET, POST, PATCH, DELETE }

Future<Map<String, dynamic>> handleResponse(http.Response response) async {
  if (response.statusCode == 200) {
    return {
      'error': false,
      'data': getFirestoreValues(json.decode(response.body)),
    };
  } else {
    return {
      'error': true,
      'message': json.decode(response.body),
    };
  }
}

Future<Map<String, dynamic>> sendRequest(
  HttpMethod method,
  String url, {
  Map<String, dynamic>? data,
  Map<String, String>? headers,
}) async {
  final uri = Uri.parse(url);
  final requestHeaders = {"Content-Type": "application/json", ...?headers};
  final body = data != null ? json.encode(toFirestoreValues(data)) : null;

  http.Response response;
  switch (method) {
    case HttpMethod.GET:
      response = await http.get(uri, headers: requestHeaders);
      break;
    case HttpMethod.POST:
      response = await http.post(uri, headers: requestHeaders, body: body);
      break;
    case HttpMethod.PATCH:
      response = await http.patch(uri, headers: requestHeaders, body: body);
      break;
    case HttpMethod.DELETE:
      response = await http.delete(uri, headers: requestHeaders);
      break;
  }
  return handleResponse(response);
}

import 'package:http/http.dart' as http;
import 'dart:convert';

class FirebaseService {
  String idProject = 'sisbar-colab';

  String urlProducts =
      'https://firestore.googleapis.com/v1/projects/sisbar-colab/databases/(default)/documents/products';

  Future<void> getDocuments() async {
    var response = await post(
      urlProducts,
      body: {
        'fields': {
          'name': {'stringValue': 'Product 1'},
          'price': {'doubleValue': 100.0},
        }
      },
    );

    print(response);

    response = await get(urlProducts);

    print(response);
  }

  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    final response = await http.get(
      Uri.parse(url),
      headers: {"Content-Type": "application/json", ...?headers},
    );

    if (response.statusCode == 200) {
      return {
        'error': false,
        'data': json.decode(response.body),
      };
    } else {
      return {
        'error': true,
        'message': json.decode(response.body),
      };
    }
  }

  Future<Map<String, dynamic>> post(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json", ...?headers},
      body: json.encode(body),
    );

    return {
      'error': response.statusCode != 200,
      'data': json.decode(response.body),
    };
  }
}

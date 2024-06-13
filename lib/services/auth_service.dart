
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String _baseUrl = 'http://10.0.2.2/opachki/wp-json';

  Future<String?> getToken(String username, String password) async {
    final response = await http.post(
      Uri.parse(_baseUrl + "/jwt-auth/v1/token"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return responseBody['token'];
    } else {
      print('Failed to obtain token: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  }
}
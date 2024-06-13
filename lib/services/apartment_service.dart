import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/apartment.dart';

class ApartmentService {
  final String _baseUrl = 'http://10.0.2.2/opachki/wp-json/wp/v2';
  final String token;

  ApartmentService(this.token);

  Future<bool> createApartment(Apartment apartment) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/posts'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(apartment.toJson()),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      print('Failed to create appartment: ${response.statusCode}');
      print('Response body: ${response.body}');
      return false;
    }
  }
}

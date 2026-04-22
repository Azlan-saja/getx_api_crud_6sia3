import 'dart:convert';

import 'package:getx_api_crud_6sia3/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  // Method GET
  Future<List<UserModel>> getUsers() async {
    final response = await http.get(
      Uri.parse("$baseUrl/users"),
      headers: {"Accept": "application/json"},
    );
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => UserModel.fromJson(e)).toList();
    }
    return [];
  }

  // Method POST
  Future<UserModel?> createUser(String name, String email) async {
    final response = await http.post(
      Uri.parse("$baseUrl/users"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name, "email": email}),
    );
    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return UserModel.fromJson(data);
    }
    return null;
  }

  // Method PUT
  Future<bool> updateUser(int id, String name, String email) async {
    final response = await http.put(
      Uri.parse("$baseUrl/users/$id"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode({"name": name, "email": email}),
    );

    return response.statusCode == 200;
  }

  // Method DELETE
  Future<bool> deleteUser(int id) async {
    final response = await http.delete(
      Uri.parse("$baseUrl/users/$id"),
      headers: {"Accept": "application/json"},
    );
    return response.statusCode == 200 || response.statusCode == 204;
  }
}

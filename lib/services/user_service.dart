import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_list/constants/constants.dart';
import '../models/user_model.dart';

class UserService {
  static Future<List<User>> fetchUsers() async {
    String url = Constants.endpoint + Constants.users;
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
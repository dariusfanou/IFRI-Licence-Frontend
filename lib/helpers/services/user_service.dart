import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:licence/helpers/dio_instance.dart';

import '../models/user.dart';

class UserService {
  final Dio api = configureDio();

  Future<User> login(Map<String, String> data) async {
    final response = await api.post(
      'login',
      data: data,
    );

    final token = response.data['data']['token'];

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);

    return User.fromJson(
      response.data['data']['user'],
    );
  }

  Future register(RegisterUser user) async {
    await api.post(
      'register',
      data: user.toJson()
    );
  }
}
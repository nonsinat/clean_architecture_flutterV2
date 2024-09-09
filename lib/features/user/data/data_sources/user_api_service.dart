// lib/features/user/data/datasources/user_api_service.dart
import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/features/user/data/model/user_model.dart';

class UserApiService {
  final Dio dio;

  UserApiService(this.dio);

  Future<List<UserModel>> getAllUsers() async {
    final response = await dio.get('https://dummyjson.com/users');

    if (response.statusCode == 200) {
      List<dynamic> userList = response.data['users'];
      return userList.map((userJson) => UserModel.fromJson(userJson)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}

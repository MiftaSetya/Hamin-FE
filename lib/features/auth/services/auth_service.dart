import 'package:dio/dio.dart';
import 'package:hamin/core/network/dio_client.dart';
import 'package:hamin/features/auth/models/login_response.dart';

class AuthService {
  Future<LoginResponse> login({
    required String username,
    required String password
  }) async {
    try {
      final response = await DioClient.dio.post("/login", data: {
        "username": username,
        "password": password
      });

      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ?? 'Login failed'
      );
    } catch (e) {
      throw Exception(
        'Unexpected error: $e'
      );
    }
  }
}
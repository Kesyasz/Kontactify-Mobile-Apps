import '../model/user.dart';
import '../service/api_service.dart';

class UserRepository {
  final ApiService _apiService;

  UserRepository({required ApiService apiService}) : _apiService = apiService;

  Future<List<User>> getUsers() async {
    try {
      return await _apiService.getUsers();
    } catch (e) {
      throw Exception("Failed to fetch users: $e");
    }
  }
}

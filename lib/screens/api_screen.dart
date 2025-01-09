import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:echanyoba/service/api_service.dart'; // Sesuaikan path jika berbeda

class ApiTestScreen extends StatefulWidget {
  static const String id = 'api_test_screen';

  @override
  _ApiTestScreenState createState() => _ApiTestScreenState();
}

class _ApiTestScreenState extends State<ApiTestScreen> {
  final ApiService _apiService = ApiService(Dio());
  List<dynamic> _users = [];
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Test Screen'),
      ),
      body: _errorMessage != null
          ? Center(
        child: Text(
          'Error: $_errorMessage',
          style: TextStyle(color: Colors.red, fontSize: 16),
        ),
      )
          : _users.isEmpty
          ? Center(
        child: ElevatedButton(
          onPressed: fetchUsers,
          child: Text('Fetch Users'),
        ),
      )
          : ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return ListTile(
            title: Text(user['name']),
            subtitle: Text(user['email']),
          );
        },
      ),
    );
  }

  void fetchUsers() async {
    try {
      final users = await _apiService.getUsers();
      setState(() {
        _users = users.map((user) => user.toJson()).toList(); // Gunakan toJson jika model mendukung
        _errorMessage = null;
      });
    } on DioError catch (dioError) {
      setState(() {
        _errorMessage = dioError.response?.data['message'] ?? dioError.message;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    }
  }
}

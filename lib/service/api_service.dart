import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:echanyoba/model/user.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/users")
  Future<List<User>> getUsers();
}

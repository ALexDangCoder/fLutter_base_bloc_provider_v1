import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST('/login')
  Future<void> login();

  // @POST('/login')
  // Future<LoginResponse> login(@Body() LoginRequest request);
}

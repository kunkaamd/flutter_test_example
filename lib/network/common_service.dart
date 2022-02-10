import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:test_round_1/network/dto/category_response_dto.dart';
import 'package:test_round_1/network/dto/user_request_dto.dart';

import 'dto/user_response_dto.dart';
part 'common_service.g.dart';

@RestApi()
abstract class CommonService {
  factory CommonService(Dio dio, {String baseUrl}) = _CommonService;

  @POST('/users/email')
  @Headers({"Content-Type": "application/json"})
  Future<UserResponseDTO> signUp(
      @Body() UserRequestDTO userRequestDTO);

  @PUT('/users/{userId}/default-categories')
  @Headers({"Content-Type": "application/json"})
  Future<UserResponseDTO> saveCategories(
      @Body() Map<String, dynamic> body,@Path("userId") String userId);

  @GET('/categories')
  Future<CategoryResponseDTO> getCategories();
}

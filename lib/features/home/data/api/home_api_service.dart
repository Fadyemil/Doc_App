import 'package:dio/dio.dart';
import 'package:doc_app/core/networking/api_constants.dart';
import 'package:doc_app/features/home/data/models/spec_response_model.dart';
import 'package:retrofit/http.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(ApiConstants.specializationEP)
  Future<SpecializationsResponseModel> getSpecialization();
}

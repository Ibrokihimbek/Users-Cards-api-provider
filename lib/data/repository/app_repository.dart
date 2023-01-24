import 'package:provider_example/data/api_service/api_service.dart';
import 'package:provider_example/data/models/my_response/response_model.dart';

class AppRepository {
  late ApiService _apiService;

  AppRepository({required ApiService apiService}) {
    _apiService = apiService;
  }

  Future<MyResponse> getCards() => _apiService.getAllCards();

}
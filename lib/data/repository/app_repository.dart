import 'package:provider_example/data/api_service/api_service.dart';
import 'package:provider_example/data/models/users_cards_model.dart';

class AppRepository {
  late ApiService _apiService;

  AppRepository({required ApiService apiService}) {
    _apiService = apiService;
  }

  Future<List<UsersCardsModel>> getCards() => _apiService.getAllCards();

}

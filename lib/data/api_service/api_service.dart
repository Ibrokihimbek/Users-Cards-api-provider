import 'dart:convert';

import 'package:http/http.dart';
import 'package:provider_example/data/models/users_cards_model.dart';

class ApiService {
  Future<List<UsersCardsModel>> getAllCards() async {
    try {
      Response response = await get(
          Uri.parse('https://banking-api.free.mockoapp.net/user_cards'));
      if (response.statusCode >= 200 && response.statusCode <= 300) {
        var jsonData = jsonDecode(response.body);
        List<UsersCardsModel> cards = (jsonData as List?)
                ?.map((e) => UsersCardsModel.fromJson(e))
                .toList() ??
            [];
        return cards;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
import 'package:flutter/material.dart';
import 'package:provider_example/data/models/users_cards_model.dart';
import 'package:provider_example/data/repository/app_repository.dart';

class CardsViewModel extends ChangeNotifier {
  late AppRepository _appRepository;

  CardsViewModel({required AppRepository appRepository}) {
    _appRepository = appRepository;
  }

  bool isLoading = false;

  List<UsersCardsModel> usersCardsData = [];

  fetchCardsInfo() async {
    notify(true);
    usersCardsData = await  _appRepository.getCards();
    notify(false);
  }

  notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}

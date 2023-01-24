import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_example/cubit/cards_state.dart';
import 'package:provider_example/data/models/my_response/response_model.dart';
import 'package:provider_example/data/models/users_cards_model.dart';
import 'package:provider_example/data/repository/app_repository.dart';

class CardsCubit extends Cubit<CardsState> {
  late AppRepository appRepository;

  CardsCubit(this.appRepository) : super(InitialCardsState()) {
    fetchAllCards();
  }

  fetchAllCards() async {
    emit(LoadCardsInProgress());
    MyResponse myResponse = await appRepository.getCards();
    if (myResponse.error.isEmpty) {
      emit(LoadCardsInSuccess(cards: myResponse.data));
    } else {
      emit(LoadCardssInFailure(errorText: myResponse.error));
    }
  }
}

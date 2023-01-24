import 'package:provider_example/data/models/users_cards_model.dart';

abstract class CardsState {}

class InitialCardsState extends CardsState {}

/// ----------------- Cards info State -------------------------------

class LoadCardsInProgress extends CardsState {}

class LoadCardsInSuccess extends CardsState {
  LoadCardsInSuccess({required this.cards});

  final List<UsersCardsModel> cards;
}

class LoadCardssInFailure extends CardsState {
  LoadCardssInFailure({required this.errorText});

  final String errorText;
}


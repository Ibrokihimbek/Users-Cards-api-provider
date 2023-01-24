import 'package:provider_example/data/models/users_cards_model.dart';

abstract class CardsBlocState {}

class InitialCardsBlocState extends CardsBlocState {}

/// ----------------- Cards info State -------------------------------

class LoadCardsBlocInProgress extends CardsBlocState {}

class LoadCardsBlocInSuccess extends CardsBlocState {
  LoadCardsBlocInSuccess({required this.cardsBloc});

  final List<UsersCardsModel> cardsBloc;
}

class LoadCardsBlocInFailure extends CardsBlocState {
  LoadCardsBlocInFailure({required this.errorText});

  final String errorText;
}

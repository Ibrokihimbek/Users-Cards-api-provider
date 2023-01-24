import 'package:equatable/equatable.dart';
import 'package:provider_example/data/models/users_cards_model.dart';
import 'package:provider_example/single_bloc/cardss_single_bloc.dart';

class SingleBlocCardsState extends Equatable {
  final List<UsersCardsModel>? usersCardsModel;
  final CardsStatus? cardsStatus;
  final String? errorText;
  const SingleBlocCardsState({
    this.usersCardsModel,
    this.cardsStatus,
    this.errorText,
  });
  SingleBlocCardsState copyWith({
    List<UsersCardsModel>? usersCardsModel,
    CardsStatus? cardsStatus,
    String? errorText,
  }) =>
      SingleBlocCardsState(
        cardsStatus: cardsStatus ?? this.cardsStatus,
        usersCardsModel: usersCardsModel ?? this.usersCardsModel,
        errorText: errorText ?? this.errorText,
      );

  @override
  List<Object?> get props => [
        usersCardsModel,
        cardsStatus,
        errorText,
      ];
}

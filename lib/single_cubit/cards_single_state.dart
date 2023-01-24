import 'package:equatable/equatable.dart';
import 'package:provider_example/data/models/users_cards_model.dart';
import 'package:provider_example/single_cubit/cards_single_cubit.dart';

class SingleCubitCardsState extends Equatable {
  final List<UsersCardsModel>? usersCardsModel;
  final CardsCubitStatus? cardsCubitStatus;
  final String? errorText;
  const SingleCubitCardsState({
    this.usersCardsModel,
    this.cardsCubitStatus,
    this.errorText,
  });
  SingleCubitCardsState copyWith({
    List<UsersCardsModel>? usersCardsModel,
    CardsCubitStatus? cardsCubitStatus,
    String? errorText,
  }) =>
      SingleCubitCardsState(
        cardsCubitStatus: cardsCubitStatus ?? this.cardsCubitStatus,
        usersCardsModel: usersCardsModel ?? this.usersCardsModel,
        errorText: errorText ?? this.errorText,
      );

  @override
  List<Object?> get props => [
        usersCardsModel,
        cardsCubitStatus,
        errorText,
      ];
}

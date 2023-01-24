import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_example/data/models/colors_model.dart';
import 'package:provider_example/data/models/my_response/response_model.dart';
import 'package:provider_example/data/models/users_cards_model.dart';
import 'package:provider_example/data/repository/app_repository.dart';
import 'package:provider_example/single_bloc/cards_single_event.dart';
import 'package:provider_example/single_bloc/cards_single_state.dart';

class SingleCardsBloc extends Bloc<CardsSingleEvent, SingleBlocCardsState> {
  final AppRepository appRepository;
  SingleCardsBloc({required this.appRepository})
      : super(SingleBlocCardsState()) {
    on<FetchAllCardsSingleBloc>(_fetchCards);
  }

  _fetchCards(
    CardsSingleEvent event,
    Emitter<SingleBlocCardsState> emit,
  ) async {
    emit(
      state.copyWith(cardsStatus: CardsStatus.LOADING),
    );
    MyResponse myResponse = await appRepository.getCards();

    if (myResponse.error.isEmpty) {
      emit(
        state.copyWith(
          usersCardsModel: myResponse.data,
          cardsStatus: CardsStatus.SUCCESS,
        ),
      );
    } else {
      emit(
        state.copyWith(
            errorText: myResponse.error, cardsStatus: CardsStatus.ERROR),
      );
    }
  }
}

enum CardsStatus { ERROR, SUCCESS, LOADING, PURE }

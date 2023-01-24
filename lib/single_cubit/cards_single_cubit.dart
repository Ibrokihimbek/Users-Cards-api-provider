import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_example/data/models/my_response/response_model.dart';
import 'package:provider_example/data/repository/app_repository.dart';
import 'package:provider_example/single_cubit/cards_single_state.dart';

class SingleCardsCubit extends Cubit<SingleCubitCardsState> {
  final AppRepository appRepository;
  SingleCardsCubit({required this.appRepository})
      : super(SingleCubitCardsState()) {
    _fetchCards();
  }

  _fetchCards() async {
    emit(
      state.copyWith(cardsCubitStatus: CardsCubitStatus.LOADING),
    );
    MyResponse myResponse = await appRepository.getCards();

    if (myResponse.error.isEmpty) {
      emit(
        state.copyWith(
          usersCardsModel: myResponse.data,
          cardsCubitStatus: CardsCubitStatus.SUCCESS,
        ),
      );
    } else {
      emit(
        state.copyWith(
            errorText: myResponse.error,
            cardsCubitStatus: CardsCubitStatus.ERROR),
      );
    }
  }
}

enum CardsCubitStatus { ERROR, SUCCESS, LOADING, PURE }

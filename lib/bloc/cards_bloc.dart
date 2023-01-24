import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_example/bloc/cards_event.dart';
import 'package:provider_example/bloc/cards_state.dart';
import 'package:provider_example/data/models/my_response/response_model.dart';
import 'package:provider_example/data/repository/app_repository.dart';

class CardsBloc extends Bloc<CardsEvent, CardsBlocState> {
  final AppRepository appRepository;
  CardsBloc({required this.appRepository}) : super(InitialCardsBlocState()) {
    on<FetchAllCards>(_fetchCards);
  }

  _fetchCards(FetchAllCards event, Emitter<CardsBlocState> emit) async {
    emit(LoadCardsBlocInProgress());
    MyResponse myResponse = await appRepository.getCards();
    if (myResponse.error.isEmpty) {
      emit(LoadCardsBlocInSuccess(cardsBloc: myResponse.data));
    } else {
      emit(LoadCardsBlocInFailure(errorText: myResponse.error));
    }
  }
}
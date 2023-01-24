import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_example/cubit/cards_state.dart';
import 'package:provider_example/data/api_service/api_service.dart';
import 'package:provider_example/data/repository/app_repository.dart';
import 'package:provider_example/screens/users_cards/widgets/shimmer_widget.dart';
import 'package:provider_example/utils/app_colors.dart';
import 'package:provider_example/cubit/cards_cubit.dart';

class UsersCardsPage extends StatelessWidget {
  const UsersCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    CardsCubit cardsCubit = CardsCubit(AppRepository(apiService: ApiService()));
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.C_21064E,
            AppColors.C_6008F0.withOpacity(0.19),
          ],
        ),
      ),
      child: BlocProvider(
        create: (context) => cardsCubit,
        child: BlocBuilder<CardsCubit, CardsState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: const Text(
                  'Users Cards',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              body: state is LoadCardsInProgress
                  ? const Center(child: ShimmerWidget())
                  : state is LoadCardsInSuccess
                      ? Center(
                          child: Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: state.cards.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(
                                    top: 15,
                                    bottom: 15,
                                    left: 20,
                                    right: 20,
                                  ),
                                  padding: const EdgeInsets.all(20),
                                  height: 200,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color(
                                            hexColor(state
                                                .cards[index].colors.color_a),
                                          ),
                                          Color(
                                            hexColor(state
                                                .cards[index].colors.color_b),
                                          ),
                                        ]),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            state.cards[index].card_type,
                                            style: const TextStyle(
                                              fontSize: 22,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            width: 60,
                                            height: 40,
                                            child: Image.network(
                                              state.cards[index].icon_image,
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        state.cards[index].bank_name,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Row(
                                        children: [
                                          Text(
                                            '${state.cards[index].money_amount}',
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          const Text(
                                            "SO'M",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 18),
                                      Text(
                                        state.cards[index].card_number,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : state is LoadCardssInFailure
                          ? Center(
                              child: Text(
                                state.errorText.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            )
                          : Container(),
            );
          },
        ),
      ),
    );
  }

  hexColor(String colorhexcode) {
    String colornew = '0xff$colorhexcode';
    colornew = colornew.replaceAll("#", "");
    int colorint = int.parse(colornew);
    return colorint;
  }
}

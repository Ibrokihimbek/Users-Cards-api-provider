import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/screens/users_cards/widgets/shimmer_widget.dart';
import 'package:provider_example/utils/app_colors.dart';
import 'package:provider_example/view_model/cards_view_model.dart';

class UsersCardsPage extends StatefulWidget {
  const UsersCardsPage({super.key});

  @override
  State<UsersCardsPage> createState() => _UsersCardsPageState();
}

class _UsersCardsPageState extends State<UsersCardsPage> {
  @override
  void initState() {
    super.initState();
    context.read<CardsViewModel>().fetchCardsInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.C_21064E,
            AppColors.C_6008F0.withOpacity(0.19),
          ],
        ),
      ),
      child: Scaffold(
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
        body: Consumer<CardsViewModel>(
          builder: (context, cardsViewModel, child) {
            return Center(
              child: cardsViewModel.isLoading
                  ? const ShimmerWidget()
                  : Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: cardsViewModel.usersCardsData.length,
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
                                      hexColor(cardsViewModel
                                          .usersCardsData[index]
                                          .colors
                                          .color_a),
                                    ),
                                    Color(
                                      hexColor(cardsViewModel
                                          .usersCardsData[index]
                                          .colors
                                          .color_b),
                                    ),
                                  ]),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      cardsViewModel
                                          .usersCardsData[index].card_type,
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
                                        cardsViewModel
                                            .usersCardsData[index].icon_image,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  cardsViewModel
                                      .usersCardsData[index].bank_name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Text(
                                      '${cardsViewModel.usersCardsData[index].money_amount}',
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
                                  cardsViewModel
                                      .usersCardsData[index].card_number,
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/data/api_service/api_service.dart';
import 'package:provider_example/data/repository/app_repository.dart';
import 'package:provider_example/screens/users_cards/users_cards.dart';
import 'package:provider_example/view_model/cards_view_model.dart';

void main() {
  AppRepository appRepository = AppRepository(apiService: ApiService());
  CardsViewModel cardsViewModel = CardsViewModel(appRepository: appRepository);
  runApp(
    MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (_) => cardsViewModel),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UsersCardsPage() ,
    );
  }
}

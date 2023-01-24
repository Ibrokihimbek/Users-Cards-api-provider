import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_example/data/api_service/api_service.dart';
import 'package:provider_example/data/repository/app_repository.dart';
import 'package:provider_example/screens/users_cards/cards_single_bloc.dart';
import 'package:provider_example/screens/users_cards/users_cards_bloc.dart';
import 'package:provider_example/screens/users_cards/users_cards_cubit.dart';

import 'screens/users_cards/cards_single_cubit.dart';

void main() {
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AppRepository(
            apiService: ApiService(),
          ),
        ),
      ],
      child: MyApp(),
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
      home: UsersCardsSingleCubitPage(),
    );
  }
}

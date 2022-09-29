import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_characters/src/data/repositories/search_characters_repository_impl.dart';
import 'package:rick_and_morty_characters/src/domain/usecases/search_characters.dart';
import 'package:rick_and_morty_characters/src/external/datasources/api_datasource.dart';
import 'package:rick_and_morty_characters/src/presenter/pages/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => Dio(),
        ),
        Provider(
          create: (ctx) => ApiDatasource(
            Provider.of<Dio>(ctx, listen: false),
          ),
        ),
        Provider(
          create: (ctx) => SearchCharactersRepositoryImpl(
            Provider.of<ApiDatasource>(ctx, listen: false),
          ),
        ),
        Provider(
          create: (ctx) => SearchCharactersImpl(
            Provider.of<SearchCharactersRepositoryImpl>(ctx, listen: false),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Rick and Morty Characters',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

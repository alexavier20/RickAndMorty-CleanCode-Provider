// ignore_for_file: avoid_print, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_characters/src/domain/usecases/search_characters.dart';
import 'package:rick_and_morty_characters/src/presenter/states/provider/favorites_provider.dart';

import '../../domain/entities/character.dart';
import '../widgets/search_list.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ScrollController _scrollController = ScrollController();
  late FavoritesProvider favoritesProvider;

  int pageCount = 0;
  bool loading = false;
  String urlNextPage = '';

  @override
  void initState() {
    super.initState();
    getAllCharacters();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !loading) {
        loadMore();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  String searchText = '';

  searchTextOnChanged(String value) {
    setState(() {
      searchText = value;
      getChacarcterByName(searchText);
    });
  }

  List<Character> listCharacters = [];

  getAllCharacters() async {
    try {
      var list = await context.read<SearchCharactersImpl>().getAll();
      setState(() {
        urlNextPage = list.info.next;
        listCharacters = list.results;
      });
    } catch (e) {
      print(e);
    }
  }

  getChacarcterByName(String name) async {
    try {
      var list = await context.read<SearchCharactersImpl>().getByName(name);
      setState(() {
        urlNextPage = list.info.next;
        listCharacters = list.results;
      });
    } catch (e) {
      print(e);
    }
  }

  loadMore() async {
    try {
      if (urlNextPage.isEmpty) {
        return;
      }

      setState(() {
        loading = true;
      });

      await Future.delayed(const Duration(milliseconds: 500));
      var list =
          await context.read<SearchCharactersImpl>().loadMore(urlNextPage);
      setState(() {
        listCharacters.addAll(list.results);
        urlNextPage = list.info.next;
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    favoritesProvider = context.watch<FavoritesProvider>();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Rick and Morty',
          style:
              TextStyle(color: Color(0xff318F42), fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xff7FD039),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Buscar...',
            ),
            onChanged: searchTextOnChanged,
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              SearchLIst(
                favoritesProvider: favoritesProvider,
                listCharacters: listCharacters,
                scrollController: _scrollController,
              ),
              if (loading) ...[
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ],
          ),
        ),
      ]),
    );
  }
}

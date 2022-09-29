import 'package:rick_and_morty_characters/src/data/datasource/search_characters_datasource.dart';
import 'package:rick_and_morty_characters/src/domain/entities/result_search.dart';
import 'package:rick_and_morty_characters/src/domain/repositories/search_Characters_repository.dart';

class SearchCharactersRepositoryImpl implements SearchCharactersRepository {
  final SearchCharactersDatasource datasource;

  SearchCharactersRepositoryImpl(this.datasource);

  @override
  Future<ResultSearch> getAll() async {
    try {
      final result = await datasource.getAll();
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ResultSearch> getByName(String name) async {
    try {
      final result = await datasource.getByName(name);
      return result;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<ResultSearch> loadMore(String urlNextPage) async {
    try {
      final result = await datasource.loadMore(urlNextPage);
      return result;
    } catch (e) {
      throw Exception();
    }
  }
}

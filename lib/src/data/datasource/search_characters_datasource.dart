import 'package:rick_and_morty_characters/src/data/models/result_search_model.dart';

abstract class SearchCharactersDatasource {
  Future<ResultSearchModel> getAll();

  Future<ResultSearchModel> getByName(String name);

  Future<ResultSearchModel> loadMore(String urlNextPage);
}

// ignore_for_file: file_names

import '../entities/result_search.dart';

abstract class SearchCharactersRepository {
  Future<ResultSearch> getAll();

  Future<ResultSearch> getByName(String name);

  Future<ResultSearch> loadMore(String urlNextPage);
}

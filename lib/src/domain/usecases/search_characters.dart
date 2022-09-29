import 'package:rick_and_morty_characters/src/domain/repositories/search_Characters_repository.dart';

import '../entities/result_search.dart';

abstract class SearchCharacters {
  Future<ResultSearch> getAll();

  Future<ResultSearch> getByName(String name);

  Future<ResultSearch> loadMore(String urlNextPage);
}

class SearchCharactersImpl implements SearchCharacters {
  final SearchCharactersRepository repository;

  SearchCharactersImpl(this.repository);

  @override
  Future<ResultSearch> getAll() {
    return repository.getAll();
  }

  @override
  Future<ResultSearch> getByName(String name) {
    return repository.getByName(name);
  }

  @override
  Future<ResultSearch> loadMore(String urlNextPage) {
    return repository.loadMore(urlNextPage);
  }
}

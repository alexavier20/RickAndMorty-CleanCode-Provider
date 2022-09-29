import 'package:dio/dio.dart';
import 'package:rick_and_morty_characters/src/data/datasource/search_characters_datasource.dart';
import 'package:rick_and_morty_characters/src/data/models/result_search_model.dart';
import 'package:rick_and_morty_characters/src/domain/errors/errors.dart';

class ApiDatasource implements SearchCharactersDatasource {
  final String urlApi = 'https://rickandmortyapi.com/api/character';
  final Dio dio;

  ApiDatasource(this.dio);

  @override
  Future<ResultSearchModel> getAll() async {
    final response = await dio.get(urlApi);

    if (response.statusCode == 200) {
      Map<String, dynamic> userdata = Map<String, dynamic>.from(response.data);

      ResultSearchModel result = ResultSearchModel.fromMap(userdata);

      return result;
    } else {
      throw GetAllError();
    }
  }

  @override
  Future<ResultSearchModel> getByName(String name) async {
    final response = await dio.get('$urlApi/?name=$name');

    if (response.statusCode == 200) {
      Map<String, dynamic> userdata = Map<String, dynamic>.from(response.data);

      ResultSearchModel result = ResultSearchModel.fromMap(userdata);

      return result;
    } else {
      throw GetByNameError();
    }
  }

  @override
  Future<ResultSearchModel> loadMore(String urlNextPage) async {
    final response = await dio.get(urlNextPage);

    if (response.statusCode == 200) {
      Map<String, dynamic> userdata = Map<String, dynamic>.from(response.data);

      ResultSearchModel result = ResultSearchModel.fromMap(userdata);

      return result;
    } else {
      throw LoadMoreError();
    }
  }
}

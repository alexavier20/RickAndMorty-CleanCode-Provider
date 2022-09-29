// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields, annotate_overrides
import 'dart:convert';

import 'package:rick_and_morty_characters/src/domain/entities/result_search.dart';

import 'character_model.dart';
import 'result_search_info_model.dart';

class ResultSearchModel extends ResultSearch {
  ResultSearchInfoModel info;
  List<CharacterModel> results;

  ResultSearchModel({
    required this.info,
    required this.results,
  }) : super(info, results);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'info': info.toMap(),
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchModel(
      info: ResultSearchInfoModel.fromMap(map['info'] as Map<String, dynamic>),
      results: List<CharacterModel>.from(
        (map['results'] as List<dynamic>).map<CharacterModel>(
          (x) => CharacterModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

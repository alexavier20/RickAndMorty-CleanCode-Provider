// ignore_for_file: annotate_overrides, overridden_fields

import 'dart:convert';

import 'package:rick_and_morty_characters/src/domain/entities/result_search_info.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResultSearchInfoModel extends ResultSearchInfo {
  int count;
  int pages;
  String next;
  String prev;

  ResultSearchInfoModel({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  }) : super(count, pages, next, prev);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'pages': pages,
      'next': next,
      'prev': prev,
    };
  }

  factory ResultSearchInfoModel.fromMap(Map<String, dynamic> map) {
    return ResultSearchInfoModel(
      count: map['count'] as int,
      pages: map['pages'] as int,
      next: map['next'] as String,
      prev: map['prev'] != null ? map['prev'] as String : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchInfoModel.fromJson(String source) =>
      ResultSearchInfoModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

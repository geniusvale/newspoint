import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newspoint/model/sourcemodel.dart';

part 'articlemodel.freezed.dart';
part 'articlemodel.g.dart';

@freezed
class ArticleModel with _$ArticleModel {
  factory ArticleModel({
    SourceModel? source,
    dynamic author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
  }) = _ArticleModel;

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
}

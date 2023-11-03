
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:newspoint/model/articlemodel.dart';

part 'newsmodel.freezed.dart';
part 'newsmodel.g.dart';

@freezed
class NewsModel with _$NewsModel {
  factory NewsModel({
    String? status,
    int? totalResults,
    List<ArticleModel>? articles,
  }) = _NewsModel;
	
  factory NewsModel.fromJson(Map<String, dynamic> json) =>
			_$NewsModelFromJson(json);
}

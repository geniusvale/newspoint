
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sourcemodel.freezed.dart';
part 'sourcemodel.g.dart';

@freezed
class SourceModel with _$SourceModel {
  factory SourceModel({
    String? id,
    String? name,
  }) = _SourceModel;
	
  factory SourceModel.fromJson(Map<String, dynamic> json) =>
			_$SourceModelFromJson(json);
}

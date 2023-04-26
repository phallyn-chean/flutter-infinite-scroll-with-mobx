import 'package:json_annotation/json_annotation.dart';

part 'card_model.g.dart';

@JsonSerializable()
class CardModels {
  @JsonKey(name: 'id')
  late String id;

  @JsonKey(name: 'author')
  late String author;

  @JsonKey(name: 'width')
  late int width;

  @JsonKey(name: 'height')
  late int height;

  @JsonKey(name: 'url')
  late String url;

  @JsonKey(name: 'download_url')
  late String downloadUrl;

  CardModels({
    this.id = '',
    this.author = '',
    this.width = 0,
    this.height = 0,
    this.url = '',
    this.downloadUrl = '',
  });

  CardModels fromJson(Map<String, dynamic> json) {
    return _$CardModelsFromJson(json);
  }

  factory CardModels.fromJson(Map<String, dynamic> json) {
    return _$CardModelsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CardModelsToJson(this);
}

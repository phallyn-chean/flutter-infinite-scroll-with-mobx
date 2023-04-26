// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModels _$CardModelsFromJson(Map<String, dynamic> json) => CardModels(
      id: json['id'] as String? ?? '',
      author: json['author'] as String? ?? '',
      width: json['width'] as int? ?? 0,
      height: json['height'] as int? ?? 0,
      url: json['url'] as String? ?? '',
      downloadUrl: json['download_url'] as String? ?? '',
    );

Map<String, dynamic> _$CardModelsToJson(CardModels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'download_url': instance.downloadUrl,
    };

import 'package:dio/dio.dart';
import 'package:infinite_scroll/models/pagination_model.dart';
import 'package:infinite_scroll/models/card_model.dart';
import 'package:infinite_scroll/services/card_service_interface.dart';

class CardService extends CardServicesInterface {
  @override
  Future<List<CardModels>> fetchCards(PaginationModels paginate) async {
    var params = {"page": paginate.page, "limit": paginate.limit};
    try {
      Response response = await Dio()
          .get("https://picsum.photos/v2/list", queryParameters: params);
      return response.data
          .map((json) => CardModels.fromJson(json))
          .toList()
          .cast<CardModels>() as List<CardModels>;
    } catch (error) {
      return [];
    }
    throw UnimplementedError();
  }
}

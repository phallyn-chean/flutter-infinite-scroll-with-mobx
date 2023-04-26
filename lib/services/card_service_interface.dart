import 'package:infinite_scroll/models/card_model.dart';
import 'package:infinite_scroll/models/pagination_model.dart';

abstract class CardServicesInterface {
  Future<List<CardModels>> fetchCards(PaginationModels paginate);
}

import 'package:dio/dio.dart';
import 'package:infinite_scroll/models/card_model.dart';
import 'package:infinite_scroll/models/pagination_model.dart';
import 'package:infinite_scroll/services/card_service.dart';
import 'package:infinite_scroll/services/card_service_interface.dart';
import 'package:mobx/mobx.dart';
part 'card_view_store.g.dart';

class CardViewStore = _CardViewStoreBase with _$CardViewStore;

abstract class _CardViewStoreBase with Store {
  late CardServicesInterface _service;

  bool isFetchData = false;
  int _page = 1;
  final int _limit = 10;

  void init() {
    _service = CardService();
  }

  ObservableList<CardModels> cards = ObservableList<CardModels>();

  Future fetchCards() async {
    if (isFetchData) {
      return;
    }

    isFetchData = true;
    print("page = $_page");

    var paginate = PaginationModels(page: _page, limit: _limit);

    var response = await _service.fetchCards(paginate);
    if (response.isNotEmpty) {
      cards.addAll(response);
      _page++;
    }

    isFetchData = false;
  }
}

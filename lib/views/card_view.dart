import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:infinite_scroll/models/card_model.dart';
import 'package:infinite_scroll/stores/card_view_store.dart';
import 'package:infinite_scroll/views/card_items_view.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  late CardViewStore _viewStore;

  @override
  void initState() {
    _viewStore = CardViewStore();
    _viewStore.init();
    _viewStore.fetchCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Infinite Scroll"),
        ),
        body: Observer(builder: (context) {
          if (_viewStore.cards.isEmpty) {
            return _buildLoading;
          }
          return ListView.builder(
              itemCount: _viewStore.cards.length + 1,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                if (index == _viewStore.cards.length) {
                  _viewStore.fetchCards();
                  return _buildLoading;
                }
                return CardItemView(models: _viewStore.cards[index]);
              });
        }));
  }

  Center get _buildLoading {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
